# Gap / enhancement assessment — VM4BZ420

- Source report: `IDMS Programs/VM4BZ420.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L9: > **Pairing.** The VMDZ4425 header ("EXTRACT THE INPUT KASBONS DATA … DZCOUPTB(PARENT) → DZEVCPTB(CHILD)", seq 000900-001600) is Dhuri template boilerplate: the same first sentence is in VMDZ4200/4300/4302/4305/4420/7102 [OBS grep]; only the table line is specific, and it names the VMBCOUP/VMBEVCP tables. Body evidence: same FDs OUTFILE1/OUTFILE2 on DD010/DD020 with 35/80 bytes (L13-14, L30-44 = seq 002500-004700); `COPY VM4BZRP5 REPLACING ==:PREF:== BY ==WS==` and `TELLER-EVEN-MASK PIC -999`, each unique to this pair on both sides [OBS grep]; identical paragraph names (NIV-COUPON, B-PROG, E-COUPON, BEHANDELING, E-PROG); identical PARAM-DATONLY with DATE6-LS; identical date prologue, including the unusual `< 60` window; identical cause-code lists. **Confidence: High.** The number break (BZ420 → 4425, not 4421) is the only anomaly (Q-146).
- L13: ## 1. Identity, scope and completion
- L17: | Legacy | `IDMS Programs/VM4BZ420.cbl`, 245 lines. "REVISED BY VERHAEGHE PEDRO - CARLSBERG" (L6); "03/05 VERSTRAETEN PH MODIFICATIONS R2" (L21-23). No functional header. VM4BZRP5 copybook by Verstraeten, 13-06-03, "GEGEVENS UIT CIRCULATIE & INVENTARIS" (data from circulation and inventory, copybook L6, L91-95) [OBS] |
- L18: | DB2 | `DB2 Manual converted Programs/VMDZ4425.cbl`, 470 lines. A. Dhuri, June 2026. `CBL ARITH(EXTEND)`. Legacy revision lines dropped [OBS] |
- L21: | IDMS access | **Direct DML, no LRF.** Subschema VMBTS09 (L50); the unused LR path SWEEP-VMBCOUP-VMBEVCP exists (VMBTS09.txt L164-173). `PROTOCOL MODE IS BATCH DEBUG IDMS-RECORDS MANUAL` (L19-20), so status is checked explicitly and **immediately** (`IF DB-END-OF-SET … ELSE PERFORM IDMS-STATUS`). **Area sweep** `OBTAIN FIRST/NEXT VMBCOUP WITHIN AR-VMBCOUP` + `FIND CURRENT VMBCOUP` (L149, L188-190). Set walk `VMBCOUP-VMBEVCP` (L161, L229). Read-only, no FFRECAB, no COMMIT [OBS] |
- L24: | Completion | All paragraphs traced; full IF/EVALUATE/MOVE diff legacy vs DB2; clone check vs VMDZ1130 (same DZEVCPC1 shape, QUERYNO 180 vs 182, seq 014900-018100) and VMDZ4420 (header, timestamp, 7xx/8xx skeleton) (XPG-01). Not in workspace: SQLERRWS/SQLERROR (Q-48, Q-61), IDMS-STATUS copy, the DD010/DD020 consumers (Q-143) |
- L67: | Kind | Legacy | DB2 |
- L120: | Legacy | DB2 | Verdict |
- L150: | Case | Legacy | DB2 | Verdict |
- L163: | Structure | Legacy | DB2 | Note |
- L213: | ID | Sev | Line | Finding | DB2 |
- L276: | **Q-146** | Confirm that VMDZ4425 is the official replacement of VM4BZ420 in the job stream (number 4425 instead of 4421; header text "KASBONS" copied from VMDZ4420) | pairing |

## Open / referenced COBOL-team questions

- `Q-146`
- `Q-48`
- `Q-61`
- `Q-143`
- `Q-17`
- `Q-145`
- `Q-59`
- `Q-109`
- `Q-62`
- `Q-144`
- `Q-86`
- `Q-25`
- `Q-129`

## Important report findings to preserve

- L202: | D-02 | Low (conditional) | seq 027600-029100 | Raw X(8) DA-UBSECIS-STOCK is rebuilt from a DATE: legacy spaces/invalid → 0001-01-01 → '00000000'; OUTREC1 bytes 9-16 differ (same as VMDZ1130 D-02) | DATE-N130-1; Q-59/Q-109 |
- L203: | D-03 | Low [INF] | seq 008300, 025400 | KEY-COUPON NR-IDSTOCK is 9(12) but receives CHAR(12). Alpha-prefixed stock numbers (R3, NR-PA-STOCK X5) pass through an alnum→numeric MOVE; bytes survive only because the last byte is a digit (compiler zone fix-up on the last byte) | use X(12) (KEY-W4420-1); T-09, Q-145 |
- L204: | D-04 | Low [INF] | seq 021010, 024600 | `INITIALIZE OUT-RECORD` moved from "after a WHEN-1 write" (L176) to the start of every coupon. Moved fields are equal; CO-DEVIES (28-30) differs **only on OUTREC1 records written before the first legacy INITIALIZE** (legacy = initial WS storage, DB2 = spaces). FILLER 31-35 is never initialized in either (undefined in both) | HLP-W4420-1; Q-144 |
- L205: | D-05 | Info | various | WITH HOLD not needed; DESC sort not needed (ORD-N130-1); header text is "KASBONS" boilerplate (Q-146); CS-PROGRAM unused; 600-GET-TIMESTAMP + 3 totals DISPLAY only; INITIALIZE DCLDZCOUPTV/DCLDZEVCPTV redundant; DZCOUPC1 END-EXEC without period; legacy revision lines dropped; ~285 k OPEN/CLOSE pairs (FK index assumed, cf. Q-86) | cosmetic / performance |
- L206: | D-06 | Info | seq 046900 | SQLERROR path does not CLOSE OUTFILE1/2 (legacy IDMS-ABORT does, L244-245); z/OS closes on abend [INF] | Q-48/Q-61 |
- L207: | D-07 | Info [INF] | seq 027300 | Legacy same-PIC packed MOVE may keep a stored X'F' sign; DB2 DECIMAL returns X'C'/X'D' → OUTREC1 byte 27 sign nibble only | accept (as VMDZ4420 D-06) |
- L215: | L-01 | Info | L125-134 | Run date computed (window `< 60` → 20, also in VM1BD595, VM1BZ170/250/260 [OBS grep]) but never read; DATE6-LS not validated; PARM still required (LINKAGE accessed) | identical (seq 022200-023100) |
- L216: | L-02 | Low | L216, L225 | TELLER-EVEN S9(3) without ON SIZE ERROR: |net| > 999 truncates silently | identical (CNT-W4420-1) |

## Reusable rule IDs already present

- `RST-08`
- `XPG-01`
- `ERR-V4420-1`
- `ORD-N130-1`
- `DATE-IND`
- `DATE-YMD`
- `DATE-DMY`
- `DATE-YMD8`
- `DATE-Y1`
- `SEQ-040IRMO`
- `KEY-COUPON`
- `DATE-01`
- `PLAT-01`
- `PLAT-02`
- `LRO-V4300-1`
- `LRO-N130-1`
- `ERR-01`
- `ERR-03`
- `DATE-04`
- `DSP-02`
- `LRO-V4310-1`
- `HLP-W4420-1`
- `DATE-CY`
- `DATE-W4420-1`
- `CNT-01`
- `CNT-W4420-1`
- `NAME-03`
- `KEY-W4420-1`
- `ERR-N130-1`
- `DATE-Z310-1`
- `ORD-V4300-1`
- `PROC-01`
- `CMT-N590-1`
- `CMT-01`
- `AUD-01`
- `DATE-N130-1`
- `HLP-V4300-1`
- `HLP-Z310-1`
- `DSP-Z250-1`
- `ORD-V4420-1`
- `CPY-01`
- `LRO-Z310-1`
- `ORD-01`
- `KEY-Z570-1`
- `HLP-V4310-1`
- `XPG-N575-1`

## Concepts this program must contribute to

- LRF
- Restart
- Cursor_SQL
- Error_Handling
- Field_Mapping
- Storage
- Ordering_Relationships
- Decommission

## Required production enhancement for Copilot

1. Read the full original program report before creating or changing any generic rule.
2. Extract each reusable behavior into the appropriate concept rule file; do not copy narrative blindly.
3. Record rule conditions, exceptions, legacy operation/status, DB2 replacement, field/type dependencies, and evidence anchors.
4. Add or update the corresponding semantic entry in `machine/rules.json`.
5. Add this program to the program × rule coverage matrix with APPLIES_SUPPORTS / APPLIES_VARIANT / APPLIES_CONTRADICTS / NOT_APPLICABLE / UNKNOWN.
6. Keep every unresolved business decision tied to the existing Q ID; do not invent a replacement Q ID.
7. If the existing report itself is incomplete, add a continuation addendum under `program-enhancements/`; do not edit the copied original report.

## Completion checklist

- [ ] Full report semantically reviewed
- [ ] Reusable concepts extracted
- [ ] Machine rules updated
- [ ] Coverage matrix updated
- [ ] Questions linked
- [ ] Program enhancement addendum created if needed
- [ ] No original report modified
