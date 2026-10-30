# Gap / enhancement assessment — VM1BD546

- Source report: `IDMS Programs/VM1BD546.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L3: > **Purpose of this file.** Knowledge base for one program, written for a downstream AI or Python conversion engine. It records what the legacy program does, how the manual DB2 conversion (VMDZ1546) re-implemented it, and where the two differ.
- L13: ## 1. Identity, scope and completion
- L17: | Legacy program | `IDMS Programs/VM1BD546.cbl` (371 lines; P. Aelvoet 01/1987; changes 1987, 1989 "PARM date as event date for final destruction", 1996 Y2K, 1997 EURO2000, 03/10 integration) |
- L18: | DB2 program | `DB2 Manual converted Programs/VMDZ1546.cbl` (1047 lines) |
- L19: | Program type | Batch, sequential-file driven, **four-way dispatch** on `CT-LINE-TE` (1 = remise / deposit, other = ordre / order) × `CO-STCIRC-OORD` (1 = store, other = modify). Remark: "UPDATE DATABASE TERUGTREKKINGEN" (withdrawals). |
- L20: | IDMS access mode | LRF `VMBTL07-R01`, subschema VMBTS07. READY of 3 named areas (AR-VMBRFFB, AR-VMBWCEF, AR-VMBEFF1) in UPDATE. Plus direct DML on FFRECAB. |
- L23: | Completion | All paths analysed. Open: Q-02, Q-17, Q-18, Q-19, Q-27, Q-28. |
- L41: | CT-LINE-TE | CO-STCIRC-OORD | Legacy | Event | LR | DB2 |
- L60: | Kind | Legacy | DB2 |
- L71: | # | Legacy | Line | DB2 |
- L91: | Item | Legacy | DB2 | Equal? |
- L103: | Item | Legacy | DB2 | Verdict |

## Open / referenced COBOL-team questions

- `Q-02`
- `Q-17`
- `Q-18`
- `Q-19`
- `Q-27`
- `Q-28`
- `Q-21`

## Important report findings to preserve

- L172: | D-01 | — | 2321 | **No defect:** the coupon condition is correctly kept (compare VMDZ1535 D-01). | — |
- L173: | D-02 | Medium | 2321 seq 088900 | SUBTRACT GIVING into signed S9(3) COMP-3: NS-IDCP = 0 stores **−1** in NX_CPAIDSK (legacy stores 1). A negative "coupons paid" count can break downstream readers. | ARI-01 unsigned helper; Q-27 |
- L174: | D-03 | Medium | 2300 / 2320 date blocks | DA-UB 99999999 not handled (Q-19) | DATE-01 full |
- L175: | D-04 | Medium (volume) | WS seq 006800 | WS-NB-INPUT-UPD-I 9(5) wraps at 99,999 records, so restart positioning is wrong for larger files. The legacy limit is 9(7). | at least 9(7) to match legacy NS-REC-FF-IN (Q-28: expected volumes) |
- L176: | D-05 | Low | 8100 | no EOF guard during positioning | STOP01-style guard |
- L177: | D-06 | Low | 8300 seq 113900 | LEN 15 | 1215 |
- L178: | D-07 | Low | 2100 | 22-column SELECT for an existence probe | minimal probe |
- L179: | D-08 | Info | 2110 / 2330 | `RIGHT(DIGITS(NEXT VALUE …),20)` | `NEXT VALUE FOR` |
- L181: | C-01 | High (cross) | NR_IDGOOD | packed → display | Q-18 |
- L198: | T-04 | LINE-TE 2, STCIRC 1, CO-COUP '1', NS-IDCP 0 | CPAID 1 [INF] | CPAID −1 → **FAIL D-02** |
- L202: | T-08 | 150,000 input records, abend at 120,000 | resume at 120,001 | count wrapped → wrong resume point → **FAIL D-04** |

## Reusable rule IDs already present

- `DATE-IND`
- `DATE-YMD`
- `DATE-DMY8`
- `DATE-YMD8`
- `DATE-04`
- `PLAT-02`
- `HLP-06`
- `DATE-01`
- `AUD-01`
- `AUD-02`
- `ARI-01`
- `LRM-01`
- `HLP-10`
- `LRS-10`
- `LRS-11`
- `LRO-02`
- `ORD-01`
- `RST-09`
- `CNT-01`

## Concepts this program must contribute to

- LRF
- Restart
- Cursor_SQL
- Error_Handling
- Field_Mapping
- Storage
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
