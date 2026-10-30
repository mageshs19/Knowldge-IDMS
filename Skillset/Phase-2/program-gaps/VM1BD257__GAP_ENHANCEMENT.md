# Gap / enhancement assessment — VM1BD257

- Source report: `IDMS Programs/VM1BD257.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L3: > **Purpose of this file.** Knowledge base for one program, written for a downstream AI or Python conversion engine. It records what the legacy program does, how the manual DB2 conversion (VMDZ1257) re-implemented it, and where the two differ.
- L13: ## 1. Identity, scope and completion
- L17: | Legacy program | `IDMS Programs/VM1BD257.cbl` (219 lines; VHEML 31/07/2003) |
- L18: | DB2 program | `DB2 Manual converted Programs/VMDZ1257.cbl` (501 lines; Vinay Mahajan 26/11/2025) |
- L19: | Program type | Batch, sequential-file driven, **update-only** (OBTAIN by CALC key + MODIFY 2 fields) |
- L20: | IDMS access mode | LRF `VMBTL09-R01`, subschema **VMBTS09**. `IDMS-RECORDS WITHIN WORKING-STORAGE`, so this program has no MANUAL copy statements (contrast VM1BD255). Plus direct DML on FFRECAB. |
- L23: | Completion | All paths analysed. Missing: `VMDZ205I`, `SQLERRWS`, `SQLERROR`. |
- L57: | Kind | Legacy | DB2 |
- L97: | Role | Legacy | DB2 | Note |
- L139: | Event | Legacy | VMDZ1257 | Equivalent? |
- L158: | Keyword | Path (VMBTS09) | Statuses | DB2 |

## Open / referenced COBOL-team questions

- `Q-16`
- `Q-02`

## Important report findings to preserve

- L181: | D-01 | Low | 800-PROCESS-COMMIT seq 025600 | `MOVE 15 TO TE-CH-RS-DATA-LEN` (the INSERT uses 1215) | 1215 |
- L182: | D-02 | Low | TREAT-PROG date | no LOW-VALUES / 99999999 handling | shared DATE-01 routine (both partners) |
- L183: | D-03 | Low | 810 | no EOF guard while positioning | STOP01 check |
- L184: | D-04 | Info | seq 021800-022200 | duplicate moves of NR-ST / NS-DB | remove |
- L185: | D-05 | Info | seq 009200 | irregular level 02 under 03 | fix levels |
- L186: | D-06 | Info | — | the restart checkpoint paragraph is named `800-PROCESS-COMMIT` (other programs use 830) | naming convention |
- L190: | V-01 | Completed rerun abends. |
- L191: | V-02 | Audit columns updated (AUD-02). |

## Reusable rule IDs already present

- `DATE-03`
- `PLAT-01`
- `LRM-01`
- `ERR-01`
- `ERR-03`
- `AUD-02`
- `LRO-01`
- `RST-01`
- `RST-02`
- `RST-07`
- `RST-03`
- `RST-06`
- `RST-04`
- `DATE-01`
- `HLP-05`

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
