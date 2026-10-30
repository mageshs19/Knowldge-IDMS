# 04 — LRF Update and Restart: Generic IDMS → DB2 Conversion Rules

> **Scope.** Programs that change data through the IDMS Logical Record Facility, i.e. `STORE | MODIFY | ERASE <LR> WHERE <path-selector>`, and the restart and transaction control around them.
>
> **Audience.** A Python conversion engine and its reviewers. Each rule has:
> - an ID
> - a detection signature (what to look for in the IDMS source and subschema)
> - the DB2 emission (what to generate)
> - the evidence (program cases that prove the rule)
> - a confidence level
>
> **Confidence levels**
> - `CONFIRMED` — proven by ≥1 legacy/DB2 pair with equivalent behaviour.
> - `CONFIRMED-VARIANT` — the manual DB2 code differs from legacy, and the difference is accepted or pending.
> - `PROVISIONAL` — blocked by an open question.
> - `NO EVIDENCE YET` — the pattern is expected but not yet observed in an analysed pair. **The engine must not auto-apply it.** Route to human review.
>
> **Evidence so far:** VM1BD250 → VMDZ1250. Extend this file as each of the 50 programs is analysed: add a case row, raise or lower confidence, and add exceptions.

---

## 0. Core concepts (read first)

### 0.1 What an LR call is
```cobol
OBTAIN|STORE|MODIFY|ERASE <logical-record> WHERE <path-selector-keyword>
IF <path-status-88> ... ELSE IF LR-ERROR ... END-IF
```
- The **LR buffer** (e.g. `VMBTL06-R01`) contains copies of all element records (VMBFORM, VMBSIAS, …). The program fills element fields in the LR buffer **before** the call. The path reads them as `<field> OF <record> OF LR`.
- The **path** (subschema source, `PATH-GROUP STORE …`) is a mini-program: FIND/OBTAIN/STORE/CONNECT DML with `ON <status> RETURN <path-status>` clauses.
- Path completion without a RETURN → `LR-FOUND`.
- An unhandled DML error → `LR-ERROR`.
- `LR-NOT-FOUND` applies to retrieval paths.
- **Program-level decision.** After each call, the program tests path statuses and decides CONTINUE or abort (IDMS-STOP). **The same path can be tolerated at one call site and fatal at another** (VM1BD250 para 280 vs 240). Always derive the SQLCODE policy from the **call site**, not from the path definition.

### 0.2 What replaces it in DB2
- One LR call → **one or more SQL statements**, one per *stored* element record that survives the migration.
- The path's FIND-owner steps → **FK columns** in the child INSERT, plus DB2 RI (`-530`), or an explicit SELECT existence check where RI is absent.
- Path statuses → SQLCODE `WHEN` branches, mapped by section 2.

### 0.3 Universal status → SQLCODE table

| IDMS status / path RETURN | Meaning | DB2 SQLCODE | Confidence |
|---|---|---|---|
| `0000` / `LR-FOUND` (STORE path completed) | success | `0` | CONFIRMED |
| `1205` (DB-DUPLICATE) → `<REC>-EXISTS` | duplicate key on STORE | `-803` | CONFIRMED |
| `0326` (DB-REC-NOT-FOUND) → `<OWNER>-NOT-FND` on FIND owner in a STORE path | parent missing | `-530` (RI) | CONFIRMED (requires RI, see LRS-02 note) |
| `0326` on OBTAIN CALC (non-LR) | not found | `+100` | CONFIRMED (RET-01) |
| `0307` end-of-set / `LR-NOT-FOUND` on retrieval | no more rows | `+100` on FETCH | NO EVIDENCE YET (see guide 03) |
| `1225`/`1233` etc. → `LR-ERROR` | any other DB error | `WHEN OTHER` → `PERFORM SQLERROR` | CONFIRMED |
| `0532` FK/set-related on ERASE (members exist) | child rows exist | `-532` | NO EVIDENCE YET |
| deadlock `0029` | — | `-911` / `-913` handled by SQLERROR | NO EVIDENCE YET |

---

## 1. Platform removal and SQL scaffolding

### PLAT-01 Remove IDMS platform code — CONFIRMED (VM1BD250)

**Delete:**
- `CBL NOSQL` (replace with the shop `CBL` options; observed `CBL ARITH(EXTEND)`)
- `IDMS-CONTROL SECTION` + `PROTOCOL …`
- `SCHEMA SECTION` + `DB <subschema> WITHIN <schema>`
- `COPY IDMS SUBSCHEMA-BINDS`, `BIND …`
- `READY [<area>] USAGE-MODE …`
- `FINISH`
- `COPY IDMS <record>` and `COPY IDMS <LR>`
- `COPY IDMS IDMS-STATUS`, the `IDMS-ABORT SECTION`, and `PERFORM IDMS-STATUS`

**Keep:** `CALL USERABEN`, `STOP RUN`, PARM linkage, and file I/O.

### PLAT-02 Add SQL scaffolding — CONFIRMED

```cobol
      *----- INCLUDE FOR DB2 ---------------------------------------*
           EXEC SQL INCLUDE SQLERRWS END-EXEC.
           EXEC SQL INCLUDE SQLCA    END-EXEC.
      *----- INCLUDE VIEWS -----------------------------------------*
           EXEC SQL INCLUDE <view-1> END-EXEC.      *> one per DB2 view used
           ...
           EXEC SQL INCLUDE DZ01RSTV END-EXEC.       *> restart, if FFRECAB was used
      * last lines of PROCEDURE DIVISION
           EXEC SQL
                INCLUDE SQLERROR
           END-EXEC.
```
- SQL statements reference **views** (`<pfx><obj>TV`), not tables (`…TB`). DCLGEN member name = view name.
- The view list = the DB2 targets (mapping CSV column "New DB2 Record") of every element record the program stores, modifies, erases or reads, minus decommissioned records (LRS-09).

---

## 2. LR STORE conversion rules

### LRS-01 Store of an independent record (path = single `STORE <REC> ON 1205 RETURN <REC>-EXISTS`)

**Signature**
- `STORE <LR> WHERE CREATE-<REC>`, and the path body has no FIND-owner step.

**Emission**
```cobol
       01-INSERT-<obj>.
      D    DISPLAY '01-INSERT-<obj>.'
           EXEC SQL
                INSERT INTO <view>
                       VALUES (:DCL<view>)
           END-EXEC
           EVALUATE SQLCODE
               WHEN 0
                    ADD 1 TO WS-NB-<obj>-UPD-I
               WHEN -803
                    <policy from call site, see variants>
               WHEN OTHER
                    DISPLAY 'ERROR REC NUMBER : ' WS-NB-INPUT-UPD-I
                    PERFORM SQLERROR
           END-EVALUATE
           .
```

**Variants (decided by the legacy IF after the call)**

| Variant | Legacy call-site test | `WHEN -803` emission | Evidence |
|---|---|---|---|
| **LRS-01-A** owner/index (SI*) | `IF <REC>-EXISTS OR LR-FOUND CONTINUE ELSE PERFORM IDMS-STOP` | `CONTINUE` | VM1BD250 SIAS/SIDN/SIR/SIAR — CONFIRMED |
| **LRS-01-B** must-be-new | `IF <REC>-EXISTS OR LR-ERROR PERFORM IDMS-STOP` | `DISPLAY` + `PERFORM SQLERROR` | VM1BD250 FORM 0030/0219/0220/0221/1816 — CONFIRMED |
| **LRS-01-C** may-already-exist | `IF LR-ERROR PERFORM IDMS-STOP` (EXISTS not tested ⇒ tolerated) | `CONTINUE` — in a **separate paragraph** if the same view also has LRS-01-B call sites | VM1BD250 FORM 1818 — legacy CONFIRMED; the manual DB2 conversion is **defective** (it made it fatal) |

**Engine algorithm:** for every call site, collect the set of path statuses that lead to CONTINUE.
- If `<REC>-EXISTS` is in that set, or is not tested at all (and not caught by a catch-all ELSE → stop), use `CONTINUE`.
- Otherwise -803 is fatal.
- If the same view has both policies across call sites, generate two insert paragraphs (`01-INSERT-<obj>` and `01-INSERT-<obj>-DUP-OK`).

**Note:** an independent owner (SI*) row in DB2 typically holds only the key + `TS_CREATE` + `NR_USERID` (4 columns). Fill it with `INITIALIZE`, key moves, then audit moves (AUD-01; no TS_UPDATE column in this table type).

### LRS-02 Store of a child record under owner(s) (path = FIND owner(s) by CALC key OF LR, then STORE child)

**Signature** — the path body contains:
```
FIND FIRST <OWNER> WHERE CALCKEY EQ <key> OF <OWNER> OF LR
     ON 0326 RETURN <OWNER>-NOT-FND
[FIND FIRST <OWNER2> WHERE CALCKEY EQ ... ON 0326 RETURN <OWNER2>-NOT-FND]
STORE <CHILD>
```
(The CHILD is an automatic member of a set owned by each OWNER.)

**Emission**
1. `INITIALIZE DCL<child-view>`.
2. Move the business fields (mapping CSV).
3. For each owner, move the **owner's DB2 key columns** into the child FK columns (`<col>_<owner-suffix>`). The values come from **the same input fields** used to build the owner key, with the same conversion (DATE-01 for date parts). Never read them back from the owner row.
4. Audit columns (AUD-01).
5. INSERT:
   - If the child view has a generated identifier column (DCLGEN column `NR_ID_<child>` that is not in the legacy record), use an **explicit column list** with `RIGHT(DIGITS(NEXT VALUE FOR <child>SQ),20)` for it (LRS-04).
   - Otherwise use `VALUES (:DCL<view>)`.
6. SQLCODE:
```cobol
           EVALUATE SQLCODE
               WHEN 0      ADD 1 TO WS-NB-<child>-UPD-I
               WHEN -530   DISPLAY 'ERROR REC NUMBER : ' WS-NB-INPUT-UPD-I
                           PERFORM SQLERROR            *> was <OWNER>-NOT-FND
               WHEN OTHER  DISPLAY 'ERROR REC NUMBER : ' WS-NB-INPUT-UPD-I
                           PERFORM SQLERROR            *> was LR-ERROR
           END-EVALUATE
```
- If the legacy call site DISPLAYs key fields on error (e.g. `DISPLAY KY-VMBFAR`), DISPLAY the corresponding DB2 key columns before SQLERROR (VM1BD250 BFAR).

**Evidence:** VM1BD250 BFAS (1 owner), BFDN (2 owners FORM+SIDN), MBFR (2 owners FORM+BSIR), BFAR (1 owner SIAR) — CONFIRMED.

**Precondition — PROVISIONAL (Q-11):** `-530` fires only if DB2 RI exists. If RI is not defined, `<OWNER>-NOT-FND` semantics are lost. In that case the engine must emit an explicit existence check:
```cobol
           EXEC SQL SELECT 1 INTO :WS-DUMMY FROM <owner-view>
                    WHERE <owner key cols> = :<values> FETCH FIRST 1 ROW ONLY END-EXEC
           IF SQLCODE = 100 → abort (as legacy NOT-FND)
```
Default when RI is unknown: trust RI, and flag for review.

**Owner key column naming (observed):**
- `<COL>_479<OWNER>`, e.g. `NR_CIO_479SIDN`, `NR_CIOFMAS_479SIAS`.
- The FORM-owner FK is 6 columns: `CT_RKTGDSV_479FORM, NR_CIO_479FORM, DA_CR_479FORM, NR_ID_479FORM, CT_OPD_479FORM, CT_OPG_479FORM`.
- Take the exact names from the child DCLGEN. Never construct them.

### LRS-03 "OF LR" key reuse → explicit host values — CONFIRMED
- **IDMS:** one LR buffer; the program fills `<OWNER>` fields once, and both the owner STORE path and the child path read them.
- **DB2:** each view has its own host structure, so the engine must **duplicate** the key moves into every structure that needs them (the owner's DCL and the child's FK columns).
- Generated code shows repeated `MOVE NR-CIO-FORM-AS-R TO …` per structure. This is expected, not redundancy to remove.

### LRS-04 Surrogate identifier from sequence — CONFIRMED
- **Signature:** the child DCLGEN has an identifier column (`NR_ID_<child>`) with no source in the legacy record or mapping CSV ("generated"/"sequence" remark), and a sequence `<pfx><child>SQ` exists.
- **Emission:** `RIGHT(DIGITS(NEXT VALUE FOR <seq>),20)` in the VALUES list. The column list must be explicit (host-structure insert cannot carry an expression).
- **Behaviour note:** duplicate detection on the child business key is lost unless a unique index exists (VM1BD250 V-04 / Q-12).

### LRS-05 Currency-dependent store (`FIND CURRENT <OWNER>` in path) — NO EVIDENCE YET (only a dropped example)
- **Signature:** a path containing `FIND CURRENT <OWNER>` followed by `STORE <CHILD>`, under subschema `LR CURRENCY NO RESET`. The owner was stored or found by a previous LR call (possibly on a previous input record).
- **Expected emission:**
  - Keep the owner's key (or generated id) in a **mandatory working-storage helper** (`WS-CUR-<OWNER>-KEY`), set when the owner row is inserted or selected.
  - Use it to fill the child FK columns.
  - If the owner id comes from a sequence, retrieve it via `SELECT … FROM FINAL TABLE (INSERT …)` or `IDENTITY_VAL_LOCAL()` / `PREVIOUS VALUE FOR <seq>`.
- Do not auto-apply until it is proven by a pair.
- **Example:** VM1BD250 `CREATE-VMBFTEL-FOR-VMBFTE` (dropped in DB2).

### LRS-06 CONNECT / DISCONNECT in paths or programs — NO EVIDENCE YET
- **Expected:**
  - CONNECT optional member → `UPDATE <child-view> SET <fk cols> = :owner-key WHERE <child key>`.
  - DISCONNECT → `SET <fk cols> = <null / default value>`.
- Only commented-out code has been observed (VM1BD250 Project 3622 `CONNECT-VMBFRT-TO-VMBSIRT-DI2`). **Commented code is never converted.**

### LRS-07 LR MODIFY — NO EVIDENCE YET
- **Expected:** `UPDATE <view> SET <changed columns>, TS_UPDATE = :TS-TIMESTAMP, <USERID col> = :CS-PROGRAM WHERE <full key>`.
- **SQLCODE mapping:**
  - 0 → ok
  - +100 → was `<REC>-NOT-FND` (path FIND before MODIFY)
  - -803 → was 1205 on key change
- Fill from programs with `MODIFY <LR> WHERE`.

### LRS-08 LR ERASE — NO EVIDENCE YET
- **Expected:** `DELETE FROM <view> WHERE <key>`.
- **ERASE PERMANENT/ALL** → also DELETE the children first (child-first order), unless they are covered by `ON DELETE CASCADE`.
- **SQLCODE:** +100 → NOT-FND; -532 → members exist.
- Fill from programs with `ERASE <LR> WHERE`.

### LRS-09 Decommissioned element records — PROVISIONAL (Q-03)

**Signature:** a legacy STORE path writes a record that has no DCLGEN included in the DB2 pair, and whose STORE the manual conversion omitted.

**Observed set (VM1BD250):**
- VMBMESS
- VMBSIRT, VMBFRT
- VMBSITE, VMBFTE, VMBFTEL
- VMBSIRV, VMBFRV

**Emission**
- Remove the LR call, its fill paragraph, and its status IF.
- **Keep** the surrounding paragraph, its other inserts (e.g. FORM), and the dispatch.
- Keep the control switches that affect surviving inserts (see BIZ-SW-01).

**Conflict:** the mapping CSV lists DB2 targets for all 8 records, and the DZMESSTV DCLGEN exists. Until Q-03 is answered, the engine must emit a `*>> TODO DECOMMISSIONED? <record>` marker comment and a review flag, rather than silently dropping the code.

---

## 3. Field conversion rules (apply inside every fill paragraph)

### DATE-01 IDMS numeric date → DB2 DATE host (X(10) 'DD.MM.CCYY') — CONFIRMED

```cobol
           MOVE ZEROES                    TO DA-CCYYMMDD
           MOVE <src 9(8) CCYYMMDD>       TO DA-CCYYMMDD
           IF DA-CCYYMMDD = ZERO OR DA-CCYYMMDD = SPACES
              MOVE 00010101               TO DA-CCYYMMDD
           END-IF
           IF DA-CCYYMMDD = 99999999
              MOVE 99991231               TO DA-CCYYMMDD
           END-IF
           MOVE CORR DA-CCYYMMDD-R        TO DA-DD-MM-CCYY
           MOVE DA-DD-MM-CCYY             TO <date col> OF DCL<view>
```
- Generate explicit `END-IF`s. The manual code relies on a period, and its indentation is misleading.
- The source is the numeric `-R` redefine of the input date (HLP-04).
- Apply it to **every** DATE column, including FK date columns (LRS-02).

**Required working storage:**
```cobol
       01  WS-DATUMVELDEN.
           03  DA-CCYYMMDD            PIC 9(8).
           03  DA-CCYYMMDD-R REDEFINES DA-CCYYMMDD.
               05 CCYY                PIC 9(4).
               05 MM                  PIC 99.
               05 DD                  PIC 99.
           03  DA-DD-MM-CCYY.
               05 DD                  PIC 99.
               05 FILLER              PIC X VALUE '.'.
               05 MM                  PIC 99.
               05 FILLER              PIC X VALUE '.'.
               05 CCYY                PIC 9(4).
```
(The source used named markers `TE-MARKER5/6` instead of FILLER; either form works with MOVE CORR.)

### DATE-02 Legacy date not set → DB2 low date — CONFIRMED
- A NOT NULL DATE column with no legacy source, or with legacy literal `'00000000'` / INITIALIZE → `MOVE '01.01.0001'`.
- A companion numeric "date present" indicator, if any (`SX-INFSD`), gets ZERO.

### AUD-01 Audit columns on INSERT — CONFIRMED

| Column pattern (from DCLGEN) | Value | Source |
|---|---|---|
| `TS_CREATE_<obj>` | `TS-TIMESTAMP` (one value per run, 820000-GET-TIMESTAMP at init) | FUNCTION CURRENT-DATE |
| `TS_UPDATE_<obj>` | `MAX-TS-TIMESTAMP` = `'9999-12-31-23.59.59.999999'` | constant |
| `NR_USERID_<obj>` / `ID_USERID_<obj>` / `NR_USER_<obj>` | `CS-PROGRAM` (DB2 program name) | constant |

- Column names vary per table, so always read them from the DCLGEN.
- SI* owner tables have TS_CREATE and USERID only.

### HLP-04 Use numeric redefines for numeric/DATE targets — CONFIRMED
- If the input field is `PIC X(n)` and there is a `REDEFINES` with `PIC 9(n)` (suffix `-R`), use the `-R` field for the DECIMAL/DATE host.
- Use the X field for literal comparisons (dispatch).

### NAME-02 Field renames come only from the mapping CSV — CONFIRMED
- **Example:** `NS-CPAID-GDIFAR` → `NS_INFSPD_479BFAR` (CSV L135).
- The engine must never infer renames from similar names.
- FILLER fields are dropped.

---

## 4. Restart, commit and error handling for LRF update programs

LRF update programs in this codebase use **FFRECAB** (direct DML, not LR) for restart. The full template is in guide 02 (RST-01…RST-07). Summary of what is LRF-specific:

| ID | Rule | Confidence |
|---|---|---|
| RST-LR-01 | The checkpoint UPDATE of the restart row and the business INSERTs must be in the **same unit of work**: UPDATE restart row, then `EXEC SQL COMMIT`, in one paragraph (`800-PROCESS-COMMIT`). | CONFIRMED |
| RST-LR-02 | `LR CURRENCY NO RESET` state does not survive a restart in either platform. Any switch or SAVE field derived from the previous record (e.g. block detection) restarts in its initial state. Document it as a shared risk; do not "fix" it silently. | CONFIRMED (shared risk) |
| ERR-01 | `IDMS-STOP` (DISPLAY statuses, ROLLBACK, CALL USERABEN) → `DISPLAY 'ERROR REC NUMBER : ' WS-NB-INPUT-UPD-I` + `PERFORM SQLERROR`. The `SQLERROR` include is assumed to ROLLBACK and abend (Q-02). | CONFIRMED-VARIANT (include not supplied) |
| ERR-02 | `STOP01` and other program-defined abends (DISPLAY + CALL USERABEN) → unchanged, apart from renaming the message prefix to the DB2 program name. | CONFIRMED |
| ERR-03 | Every SQL statement gets `EVALUATE SQLCODE` with an explicit `WHEN OTHER → PERFORM SQLERROR`. No statement may be left unchecked (including COMMIT). | CONFIRMED |

---

## 5. Business-logic preservation rules (generic)

| ID | Rule | Lesson from |
|---|---|---|
| BIZ-FLOW-01 | Copy the dispatch structure (IF/EVALUATE on operation codes) **verbatim**. Preserve the absence of WHEN OTHER: unknown codes are skipped but still counted. | VM1BD250 |
| BIZ-SW-01 | Every SET/MOVE on a control switch or SAVE field in the legacy program must appear in the DB2 program, **even in paragraphs whose IDMS DML was dropped**. The engine must diff the switch assignments between legacy and generated code. | VM1BD250 D-01 (`SET NOT-WRITE-GLOBAL-OMRUILING` lost) |
| BIZ-SW-02 | A comment such as "EXISTS IS OK" signals LRS-01-C. The engine must implement it, not just carry the comment. | VM1BD250 D-02 |
| BIZ-ORD-01 | Keep the insert order owner → form → child, matching the LR path order. Required for RI. | VM1BD250 |
| BIZ-CNT-01 | The checkpoint position counts **input records**, not DB rows. | VM1BD250 |
| BIZ-OVR-01 | Business overrides after fill (e.g. `MOVE NR-ST-FORM-AS TO NR-STFMAS-479BFAS` in annulment) must be kept after the fill PERFORM, in the same order. | VM1BD250 230 |

---

## 6. Case registry (extend per program)

| Case | Program pair | Rule(s) | Legacy lines | DB2 lines | Result |
|---|---|---|---|---|---|
| C-250-01 | VM1BD250 / VMDZ1250 | LRS-01-A | 221 (252-275) | 375-385, 1129-1146 | equivalent |
| C-250-02 | " | LRS-01-B | 210/240/300 + 400 | 367-370, 410-413, 530+, 794-815, 1109-1127 | equivalent |
| C-250-03 | " | LRS-01-C, BIZ-SW-02 | 280 (443-483) | 520-524 | **defect D-02** |
| C-250-04 | " | LRS-02, LRS-04 | 221, 500-510 | 817-991, 1148-1344 | equivalent |
| C-250-05 | " | LRS-02 (2 owners), LRS-04 | 240 | 427-497, 1365-1429 | equivalent |
| C-250-06 | " | LRS-02 (2 owners), LRS-04 | 300 | 530-666, 1450-1538 | equivalent |
| C-250-07 | " | LRS-02 (business key) | 320 | 669-791, 1559-1589 | equivalent |
| C-250-08 | " | BIZ-SW-01, LRS-05, LRS-09 | 260-265 (397-441) | 507-518 | **defect D-01**; FTE/FTEL dropped |
| C-250-09 | " | LRS-09 | 210, 251, 265, 280 | — | provisional (Q-03) |

---

## 7. Exceptions and open items affecting this guide

| ID | Item | Status |
|---|---|---|
| Q-02 | SQLERROR / SQLERRWS contents | open |
| Q-03 | Decommissioned records vs mapping CSV | open — blocks LRS-09 |
| Q-11 | DB2 RI defined? | open — affects LRS-02 |
| Q-12 | Child PK / uniqueness when using sequences | **answered**: two composite keys (CALC key + surrogate NR_ID PK). Duplicates options per record are in `workspace/Schema-Listing.txt` |
| — | LRS-05 / 06 / 07 / 08 | need evidence from other programs |
