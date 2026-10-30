# Gap / enhancement assessment — VM4BD306

- Source report: `IDMS Programs/VM4BD306.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L9: > **Pairing.** Legacy L4-5 "STOCKAGE DES MUTATIONS / ADAPTATION DU VM4OM190" = VMDZ4306 seq 000900 "STORAGE OF MUTATIONS ADAPTATION OF THE VM4OM190" (exact translation; VM4OM190 occurs in no other VMDZ [OBS grep]). The pair also shares FD IKB DD010 120 bytes, the WS-IN-REC layout, the paragraph names STOCKAGE/LECTURE, and the legacy comments "NA 99 OPERATIES EEN COMMIT" and "LEZEN VAN DE EERSTE TE VERWERKEN RECORD" (seq 021000, 014600). **Confidence: High.**
- L11: ## 1. Identity, scope and completion
- L15: | Legacy | `IDMS Programs/VM4BD306.cbl`, 250 lines. No author or mod history; only "ADAPTATION DU VM4OM190" (L5) [OBS] |
- L16: | DB2 | `DB2 Manual converted Programs/VMDZ4306.cbl`, 589 lines. A. Dhuri, March 2026. `CBL ARITH(EXTEND)`. Restart skeleton (700/710/720, 801/802/803, 900) cloned from **VMDZ4260** (same paragraph numbers, same 710 logic, LEN 50 there); EVEF INSERT column list as VMDZ1515/1555/1565 [OBS grep] |
- L20: | IDMS access | **LRF** `STORE VMBTL07-R01 WHERE ST-VMBEVEF` (L210) on subschema VMBTS07 (L31); direct DML on FFRECAB (OBTAIN CALC, STORE, FIND CURRENT, MODIFY, COMMIT, L132-234). `COPY IDMS SUBSCHEMA-BINDS` + `READY USAGE-MODE IS UPDATE` (all areas) (L122-123); `PROTOCOL BATCH-AUTOSTATUS DEBUG`, `IDMS-RECORDS WITHIN WORKING-STORAGE` (L17-18) |
- L24: | Completion | All 250 legacy lines and all DB2 paragraphs traced; full IF/MOVE diff (XPG-01). Not in workspace: SQLERROR/SQLERRWS (Q-48), IKB producer, NR_IDGOOD migration spec (Q-107). New questions Q-119..Q-122 |
- L59: | Kind | Legacy | DB2 |
- L131: | Aspect | DB2 | Verdict |
- L141: | Situation | Legacy | DB2 | Equal? |
- L158: | Element | Legacy | DB2 |
- L176: | Aspect | Legacy | DB2 |
- L206: | ID | Sev | Line | Finding | DB2 |

## Open / referenced COBOL-team questions

- `Q-48`
- `Q-107`
- `Q-119`
- `Q-122`
- `Q-17`
- `Q-121`
- `Q-29`
- `Q-25`
- `Q-120`
- `Q-110`
- `Q-18`

## Important report findings to preserve

- L197: | D-03 | Low | seq 014900, 026400-026600 | Legacy restart sanity abend L159-174 dropped (ERR-N170-1; dropped-branch pattern as VMDZ1625). Short input → READ after EOF → runtime status-46 abend [INF] instead of the explicit message. Exactly N records → OK in both. No VMDZ ports this check [OBS grep "MOINS D": legacy VM1BZ170/VM4BD306 only] | after the skip loop: `IF VMDZIKB-EOF` → legacy DISPLAYs + USERABEN; guard the loop |
- L198: | D-04 | Low | seq 045000 vs 027700 | TE-CH-RS-DATA-LEN 15 at commit, 135 at insert: KY-RESTART truncated, NB-READ intact → no functional effect. Template shared by 22 VMDZ [OBS grep] | 135 |
- L199: | D-05 | Low [INF] | seq 018700, 018860 | Key bytes moved to packed hosts (X2 → S9(2) COMP-3, byte 13 via 9(1)) are converted; legacy compares raw CALC bytes. Non-numeric input (e.g. NR-SUITE spaces) → legacy NOT-FND abend, DB2 may probe NS_DBSTK 0 and insert under another stock | data question Q-119; optional `IS NUMERIC` guard → legacy NOT-FND path |
- L200: | D-06 | Info | seq 001100-001900, 006622-006700, 012300, 019100, 019403, 019408, 019440, 046900, 017000-017100 | cloned header; dead DA-YYMMDD/DA-DDMMCCYY; redundant MOVE ZEROES/INITIALIZE; `D`-line period (§11); 'REPRISE AU RECORD'/'DEBUT NORMAL' DISPLAYs dropped, final DISPLAY texts changed | cosmetic |
- L201: | D-07 | Info | seq 036000-036400 | probe SELECT INTO the WHERE host variable; no FETCH FIRST (unique key) | note (LRO-01) |
- L202: | D-08 | Info | seq 041300 | event order = NR_ID (sequence) vs legacy set order (Q-17); visible only to VM4BD300 on equal 0092 transfer dates | Q-121 |
- L208: | L-01 | Info | L82 | FIN-IKB PIC 9 without VALUE: the restart branch tests E-O-IKB before any READ; relies on initial storage ≠ '1' | explicit SET (fixed by template) |
- L209: | L-02 | Info | L211-214 | LR-ERROR branch most likely unreachable under BATCH-AUTOSTATUS (abort via IDMS-STATUS first) [INF] | WHEN OTHER reachable (correct) |
- L211: | L-04 | Low | L129-131, L210 | Not idempotent: a restart under a different run date (DATE-IND '0' after midnight) re-stores all committed 0092 events; VIA record, no duplicate control | identical (RST-V4306-2) |
- L234: | T-07 | restart, file 1 record shorter than checkpoint | explicit message + USERABEN | status-46 abend [INF], **FAIL message (D-03)** |
- L242: | T-15 | two 0092 same DA-MUT for one bon, then VM4BD300 | CI per set order | CI of highest NR_ID (D-08, Q-121) |

## Reusable rule IDs already present

- `LRS-11`
- `XPG-01`
- `DATE-IND`
- `DATE-WS`
- `PLAT-01`
- `PLAT-02`
- `RST-01`
- `RST-02`
- `RST-07`
- `RST-04`
- `LRS-03`
- `LRS-04`
- `SEQ-01`
- `ERR-01`
- `ERR-Z250-1`
- `ERR-02`
- `RST-03`
- `RST-05`
- `RST-LR-01`
- `RST-06`
- `RST-10`
- `ERR-03`
- `DATE-04`
- `NAME-02`
- `DATE-01`
- `HLP-V4306-1`
- `HLP-06`
- `AUD-01`
- `HLP-V4306-2`
- `RST-V4306-1`
- `CNT-01`
- `NAME-03`
- `XPG-Z620-1`
- `MSG-01`
- `DATE-Z310-1`
- `HLP-09`
- `DSP-Z250-1`
- `ORD-01`
- `ORD-V4300-1`
- `PROC-01`
- `RST-LR-02`
- `CMT-N590-1`
- `DATE-05`
- `RST-09`
- `RST-V4306-2`
- `MSG-N620-1`
- `HLP-V4300-1`
- `ERR-N170-1`
- `LRO-01`
- `HLP-07`
- `DATE-03`
- `RST-N567-1`
- `RST-N625-1`
- `RST-Z620-1`
- `CNT-N140-1`
- `CMT-01`
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
