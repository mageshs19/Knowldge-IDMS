# Gap / enhancement assessment — VM1BZ190

- Source report: `IDMS Programs/VM1BZ190.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L14: ## 1. Identity, scope and completion
- L18: | Legacy | `IDMS Programs/VM1BZ190.cbl` (285 lines). J-M Boogaerts 09-03-87. Changes: De Schepper 93/12 + Hannes 96/10 (copybook renames VMBACOUP → VMBASLIK → VMBASLKX, no longer referenced); De Schepper 98/02 "CO-TST-COUP INVULLEN" (L17-18); Hugues 11/2000 "PROJET E836" (L19-20, BEF→EUR conversion [INF]); Verstraeten 05/2003 R2; Boogaerts 12/2004 "CORRECTIONS NS-DB" (L23-24). |
- L19: | DB2 | `DB2 Manual converted Programs/VMDZ1190.cbl` (291 lines). JAINRG 06-04-26. `CBL ARITH(EXTEND)` (seq 000100), legacy `CBL NOSQL` (L1). History dropped. |
- L23: | IDMS access | Subschema **VMBTS07** (L75), LR **VMBTL07-R01** (L156), path **ALL-VMBEVEF-BY-VMBEFF** (L238). READY AR-VMBEFF1 **RETRIEVAL** (L267). No FFRECAB, no direct DML, no update. |
- L26: | Completion | All paths analysed; full IF/MOVE/PERFORM diff done (XPG-01). Not in workspace: VMDZ510I (Q-21: identical to VMBD510I), SQLERRWS, SQLERROR. Open: Q-71..Q-74, Q-69. |
- L69: | Kind | Legacy | DB2 |
- L84: | # | Legacy verb | Line | DB2 | Rule |
- L140: | Aspect | DB2 | Verdict |
- L153: | Situation | Legacy | DB2 | Equal? |
- L173: | LR request | Path (VMBTS07.txt L124-136) | Legacy statuses | DB2 |
- L229: | # | Input / DB state | Legacy | DB2 |
- L242: | T-12 | full production file: byte compare MEPCPT 1500 bytes legacy vs DB2 | baseline | must match except V-01 rows (sizes D-01, Q-72) |

## Open / referenced COBOL-team questions

- `Q-21`
- `Q-71`
- `Q-74`
- `Q-69`
- `Q-18`
- `Q-17`
- `Q-22`
- `Q-48`
- `Q-72`
- `Q-73`

## Important report findings to preserve

- L209: | D-03 | Low | seq 034002 | `INITIALIZE VMDZ510I` (1500-byte FD record area) before each READ: CPU per record; touches the record area before the first READ [INF, QSAM locate mode]. Not shared by VMDZ4310: there `INITIALIZE VMDZ510I` clears the WS output record as legacy does (corrected by the VM4BD310 analysis, HLP-V4310-1). | remove or move to WS |
- L210: | D-04 | Info | seq 024402 | singleton SELECT without FETCH FIRST 1 ROW ONLY (LRO-01) | safe if unique (Q-69) |
- L211: | D-05 | Info | seq 020402, 036003-036050, 016303, 001302-001500 | SQL-LOCATION unused; timestamp only displayed; `DISPLAY` of signed COMP-3 WS-TOTAL-INPUT shows overpunched last digit; header cloned ("KASBONS"); paragraph 1100 after 1300; CALL-GE9RLEU1 not renumbered | cosmetic |
- L212: | D-06 | Info | seq 018002 | `MOVE NR-ST-COUP TO HELP-NR-ID-STOCK-CD` is a numeric move (legacy L236 is a group move): non-numeric input key may be normalised or S0C7 on NR_CDSTK DEC(1) [INF] | accept (HLP-06) |
- L213: | L-01 | Medium (legacy) | L239-242, L187 | NO-VMBEVEF-FND treated as found; LRF does not refresh program storage on a non-LR-FOUND return [INF] → AM-CN-STOCK of the **previous** found stock, or uninitialised packed (IDMS-RECORDS MANUAL) on the first call → wrong nominal / S0C7 / GE9RLEU1 2BB | retain; DB2 differs (V-01) |
- L214: | L-02 | Low (legacy) | L239 | only one LR-STATUS literal tested; NO-MORE-VMBEVEF unreachable on FIRST [INF] | retain |
- L215: | L-03 | Info (legacy) | L251-257, L92-109 | PARM/ACCEPT-DATE computed, never used; L-PARAM unchecked; dead WS groups | retain (Q-74) |
- L219: | V-01 | Stock with VMBEFF but no VMBEVEF: DB2 copies the real nominal; legacy copies unrefreshed LR storage (L-01). Needs business sign-off (Q-71). |
- L232: | T-02 | 3 consecutive records same NR-ST/NS-DB, all AM-CND-COUP 0 | all 3 nominal + 'R' | rec 1 nominal; rec 2-3 **0 + 'R'**, FAIL D-01 |
- L239: | T-09 | DB2 -911 / -904 on SELECT | abort | continues, no nominal, RC 0, FAIL D-02 |

## Reusable rule IDs already present

- `KEY-NEW`
- `XPG-01`
- `CPY-01`
- `DATE-IND`
- `MSG-01`
- `KEY-OLD`
- `PLAT-01`
- `NAME-03`
- `PLAT-02`
- `LRO-01`
- `LRO-Z190-1`
- `ERR-Z190-1`
- `ERR-01`
- `DATE-04`
- `NAME-02`
- `HLP-06`
- `LRO-N170-1`
- `AUD-01`
- `CNT-01`
- `ORD-01`
- `PROC-01`
- `HLP-09`
- `CMT-01`
- `CMT-N590-1`
- `KEY-Z190-1`
- `HLP-V4310-1`
- `PLAT-Z190-1`
- `LRO-02`
- `ERR-N620-1`
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
