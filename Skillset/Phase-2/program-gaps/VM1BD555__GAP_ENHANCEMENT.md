# Gap / enhancement assessment — VM1BD555

- Source report: `IDMS Programs/VM1BD555.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L13: ## 1. Identity, scope and completion
- L17: | Legacy program | `IDMS Programs/VM1BD555.cbl` (337 lines). Author M. Beevers, 09/1986. Changes: 1992 SLIK, 1996 Y2K, 1997 EURO2000, 2001 E833/E836, 2003 Daisy kasbons. |
- L18: | DB2 program | `DB2 Manual converted Programs/VMDZ1555.cbl` (899 lines). V. Mahajan, 01/2026. `CBL ARITH(EXTEND)`. |
- L22: | IDMS access | LRF `VMBTL07-R01` (subschema VMBTS07). `READY` of 3 areas (PLAT-02). Direct DML on FFRECAB. |
- L24: | Completion | All paths analysed. Open: Q-17, Q-18, Q-19, Q-29. |
- L64: | Kind | Legacy | DB2 |
- L74: | # | Legacy | Line | DB2 |
- L89: | Item | Legacy | DB2 | Equal? |
- L120: | Situation | Legacy | DB2 | Equal? |
- L151: | Aspect | Legacy | DB2 |
- L159: - **RST-10 NEW:** checkpoint and restart mechanics always follow the DB2 restart template (DZ01RSTV, final commit, completion flag). This applies even where the legacy omitted a step. The "retain legacy" rule (Q-25) applies to **business** logic, not to restart plumbing. Confirm via **Q-29**.
- L189: | # | Input | Legacy | DB2 |

## Open / referenced COBOL-team questions

- `Q-17`
- `Q-18`
- `Q-19`
- `Q-29`
- `Q-25`

## Important report findings to preserve

- L169: | L-01 | Medium (legacy) | L167-169 | no final FFRECAB checkpoint | DB2 template supersedes it (RST-10, Q-29) |
- L170: | D-01 | Info | 1210 | ORDER BY DESC | Q-17 |
- L171: | D-02 | Low | 800-PROCESS-COMMIT seq 058000 | LEN 15 | 1215 |
- L172: | D-03 | Low | 810 | no EOF guard | guard |
- L173: | D-04 | Info | 1111 seq 078800 | SQL-LOCATION 1110 instead of 1111 | diagnostics only |
- L174: | D-05 | Low | WS seq 005100-005500 | STOP literals inconsistent (STOP03 names VM1BD555; STOP02 typo) | **MSG-01 NEW** |
- L175: | D-06 | Medium | chain path | DA-UB 99999999 not mapped | DATE-01 (Q-19) |
- L176: | D-07 | Info | INSERTs | DIGITS cast | SEQ-01 |
- L177: | C-01 | High (cross) | NR_IDGOOD | display vs packed | Q-18 |

## Reusable rule IDs already present

- `PLAT-02`
- `DATE-DMY8`
- `DATE-IND`
- `DATE-YMD8`
- `XPG-01`
- `HLP-10`
- `LRS-11`
- `CNT-01`
- `HLP-06`
- `LRS-10`
- `LRO-02`
- `ORD-01`
- `LRM-01`
- `RST-10`
- `MSG-01`
- `DATE-01`
- `SEQ-01`
- `DSP-02`

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
