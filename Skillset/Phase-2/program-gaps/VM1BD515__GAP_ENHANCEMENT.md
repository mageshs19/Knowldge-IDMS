# Gap / enhancement assessment — VM1BD515

- Source report: `IDMS Programs/VM1BD515.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L3: > **Purpose of this file.** Knowledge base for one program, written for a downstream AI or Python conversion engine. It records what the legacy program does, how the manual DB2 conversion (VMDZ1515) re-implemented it, and where the two differ.
- L13: ## 1. Identity, scope and completion
- L17: | Legacy program | `IDMS Programs/VM1BD515.cbl` (319 lines; M. Beevers 1986, last change 2003/07 "6112 intégration") |
- L18: | DB2 program | `DB2 Manual converted Programs/VMDZ1515.cbl` (833 lines; Vinay Mahajan, January 2026) |
- L19: | Program type | Batch, sequential-file driven, **two-way dispatch** on `CO-STCIRC-OORD`: (a) store an owner chain of 3 records; (b) find + modify a member |
- L20: | IDMS access mode | LRF `VMBTL07-R01`, subschema **VMBTS07**. Records in WORKING-STORAGE. READY ... PROTECTED UPDATE on AR-VMBWCEF, AR-VMBEFF1, AR-VMBRFFB. Plus direct DML on FFRECAB. |
- L22: | Completion | All paths analysed. Missing: `VMDZ205I`, `SQLERRWS`, `SQLERROR`; the set order of VMBEFF-VMBEVEF (it is not in the subschema). |
- L92: | Kind | Legacy | DB2 |
- L156: | Legacy | Source | DB2 | Note |
- L165: | Legacy | Source | DB2 | Note |
- L181: | Legacy | Source | DB2 | Note |
- L197: | Legacy | HULP-NR-ID-GOOD = 4 COMP-3 fields + FILLER XX = 20 bytes (binary packed) moved into NR-ID-GOOD X(20) |

## Open / referenced COBOL-team questions

- `Q-17`
- `Q-18`
- `Q-19`
- `Q-02`

## Important report findings to preserve

- L330: | D-01 | **Medium (decision needed)** | 1210-SELECT-EVEF seq 078800 | Legacy takes the **first** matching EVEF in VMBEFF-VMBEVEF set order. DB2 takes `ORDER BY NR_ID DESC` (the most recent). They are equivalent only if the set order is FIRST/LIFO **and** migrated NR_ID values follow set order. Several 0060/0029 events per EFF are normal: each '1' record on an existing EFF adds one. | Confirm the set order (Q-17). For order LAST/NEXT use `ORDER BY NR_ID ASC`. Migration must assign NR_ID in set order (or order by NS_IDMSKEY for migrated rows). |
- L331: | D-02 | Medium | 1100 date conversion (×3) | DA-UB-FORM-AS (maturity date) has no 99999999 / LOW-VALUES handling. Perpetual securities would fail with -180/-181 [INF]. It is also part of the WCEF PK and the BEFF FK, so DATE-03 symmetry with readers applies. | shared DATE-01 routine with the 99999999 → 9999-12-31 branch |
- L332: | D-03 | Low | 810 | No EOF guard during positioning (the legacy has one). | STOP01-style check |
- L333: | D-04 | Low | 800-PROCESS-COMMIT seq 055400 | LEN 15 on UPDATE vs 1215 on INSERT | 1215 |
- L334: | D-05 | Low | 1210 WHEN 100, 1220 WHEN OTHER | no record-number DISPLAY; 1220 DISPLAYs 'REC NO' + 'TOTAL UPDATES' **for every update** (SYSOUT volume) | remove the per-row DISPLAY; add the record number on the error path |
- L335: | D-06 | Info | 130 | `RIGHT(DIGITS(NEXT VALUE …),20)` → DECIMAL column (implicit cast) | `NEXT VALUE FOR DZEVEFSQ` |
- L336: | D-07 | Info | 1100 | the DA-UB conversion is repeated 3 times; STOP02 text typo; `SQL-LOCATION` set to inconsistent values (601100 / 120 / 130) | cosmetic |
- L337: | C-01 | **High (cross-program)** | NR_IDGOOD | Format changed from 20-byte packed to 28-character display; the CSV says CHAR(20). | Q-18 |

## Reusable rule IDs already present

- `SEQ-040IRMO`
- `PLAT-01`
- `LRS-02`
- `LRS-10`
- `LRS-05`
- `SEQ-01`
- `ERR-01`
- `ERR-03`
- `LRO-02`
- `LRM-01`
- `AUD-02`
- `RST-01`
- `RST-02`
- `RST-07`
- `RST-03`
- `RST-06`
- `DATE-01`
- `HLP-06`
- `LRS-03`
- `NAME-02`
- `AUD-01`
- `DATE-YMD8`
- `HLP-07`
- `ERR-02`
- `HLP-05`
- `DATE-03`

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
