# Gap / enhancement assessment — VM1BD565

- Source report: `IDMS Programs/VM1BD565.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L11: ## 1. Identity, scope and completion
- L15: | Legacy | `IDMS Programs/VM1BD565.cbl` (270 lines). M. Beevers 09/1986. Later changes: D'Angelo; Boogaerts 89/06 (SIGNAAL2 provisional/definitive); Clement 92/07; Pomponio 97/01; Theuwissen 97/01; **THEUJ 24/09/2003 disables the SIGNAAL2 move**. |
- L16: | DB2 | `DB2 Manual converted Programs/VMDZ1565.cbl` (731 lines). V. Mahajan 01/2026. `CBL ARITH(EXTEND)`. |
- L20: | IDMS access | LRF VMBTL07-R01. READY: AR-VMBEFF1 and AR-VMBRFFB only (PLAT-02). FFRECAB DML. |
- L22: | Completion | All paths analysed. Open: Q-17, Q-18, Q-30. |
- L43: | Kind | Legacy | DB2 |
- L52: | # | Legacy | Line | DB2 |
- L65: | Item | Legacy | DB2 | Equal? |
- L105: | Situation | Legacy | DB2 | Equal? |
- L136: | Aspect | Legacy | DB2 |
- L167: | # | Input | Legacy | DB2 |

## Open / referenced COBOL-team questions

- `Q-17`
- `Q-18`
- `Q-30`

## Important report findings to preserve

- L150: | D-02 | Low | seq 048800 | LEN 15 | 1215 |
- L151: | D-03 | Low | 810 | no EOF guard | guard |
- L152: | D-04 | Info | 11100 seq 058500 | SQL-LOCATION 11110 | 11100 |
- L153: | D-05 | Info | 12100 | DESC | Q-17 |
- L154: | D-06 | Info | 11110 | DIGITS cast | SEQ-01 |
- L155: | C-01 | High (cross) | NR_IDGOOD | display vs packed | Q-18 |
- L159: | V-01 | Completed rerun abends. |
- L160: | V-02 | Audit columns. |
- L170: | T-02 | **DATE-IND '0'**, DATE8-LS spaces, run on 2026-03-16 | event dated 2026-03-16 and restart key 2026-03-16 | restart SELECT with an invalid date → abend [INF], **FAIL D-01** |
- L171: | T-03 | DATE-IND '0', DATE8-LS = 01012020 | system date | 2020-01-01 used, **FAIL D-01** |

## Reusable rule IDs already present

- `PLAT-02`
- `DATE-IND`
- `DATE-YMD8`
- `DATE-DMY8`
- `CMT-01`
- `XPG-01`
- `CNT-01`
- `DATE-YMD`
- `DATE-DMY`
- `MSG-01`
- `HLP-06`
- `LRS-11`
- `LRO-02`
- `ORD-01`
- `LRM-01`
- `DATE-04`
- `SEQ-01`
- `DATE-05`

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
