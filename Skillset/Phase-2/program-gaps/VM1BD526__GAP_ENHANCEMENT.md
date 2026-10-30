# Gap / enhancement assessment — VM1BD526

- Source report: `IDMS Programs/VM1BD526.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L3: > **Purpose of this file.** Knowledge base for one program, written for a downstream AI or Python conversion engine. It records what the legacy program does, how the manual DB2 conversion (VMDZ1526) re-implemented it, and where the two differ.
- L13: ## 1. Identity, scope and completion
- L17: | Legacy program | `IDMS Programs/VM1BD526.cbl` (256 lines; E. De Rijcke 1986; last change 09/2003, integration project 6212 "Daisy Securities Kasbons") |
- L18: | DB2 program | `DB2 Manual converted Programs/VMDZ1526.cbl` (627 lines; G. Jain, 05-01-26) |
- L19: | Program type | Batch, sequential-file driven, **two-way dispatch** on `CO-STCIRC-OORD`: (a) INSERT one event under an existing stock line; (b) find + modify that event. |
- L20: | IDMS access mode | LRF `VMBTL07-R01`, subschema **VMBTS07** (`Schema/VMBTS07.txt`). `READY USAGE-MODE IS UPDATE` (all areas, L117). Plus direct DML on FFRECAB. |
- L23: | Completion | All paths analysed. Still open: SQLERROR content (Q-02) and the VMBEFF-VMBEVEF set order (Q-17). |
- L36: | `CO-STCIRC-OORD` | Legacy | DB2 |
- L73: | Kind | Legacy | DB2 | Note |
- L88: | # | Legacy | Line | Disposition | DB2 equivalent |
- L127: | Item | Legacy | DB2 | Verdict |
- L155: | Situation | Legacy | DB2 | Equivalent? |

## Open / referenced COBOL-team questions

- `Q-02`
- `Q-17`
- `Q-21`
- `Q-18`

## Important report findings to preserve

- L213: | D-01 | Medium (decision) | 221 seq 056211 | `ORDER BY NR_ID_479EVEF DESC` vs legacy "first in set order". Same issue as VM1BD515 D-01. Several 0168/0219 events per stock line are possible (each '1' input adds one). | Q-17. Keep DESC (team convention) until answered. |
- L214: | D-02 | Low | 211 seq 044900-050500 | Selects 22 columns into DCLDZBEFFTV for a pure existence check. | `SELECT 1 … FETCH FIRST 1 ROW ONLY` or keep (harmless) |
- L215: | D-03 | Low | 830 seq 035000 | LEN 15 on UPDATE vs 1215 on INSERT (template defect) | 1215 |
- L216: | D-04 | Low | 221 WHEN 100 | No stock key in the message (legacy showed NR-ST / NS-DB / LR-STATUS). | add NR-ST-FORM-AS / NS-DB-STOCK-FORM-AS to the DISPLAY |
- L217: | D-05 | Info | WS seq 005000-005200 | `SW-DZEVEFC1` declared, no cursor exists | omit |
- L218: | D-06 | Info | 260 | `RIGHT(DIGITS(NEXT VALUE …),20)` into DECIMAL(20) (implicit cast) | `NEXT VALUE FOR DZEVEFSQ` |
- L219: | D-07 | Info | 210 seq 022400-022504, 025001-025005 | stock-key split coded twice (BEFF DCL and EVEF DCL); HELP INITIALIZE repeated | cosmetic |
- L220: | C-01 | High (cross-program) | NR_IDGOOD | 20-byte packed → 28-character display (same as VM1BD515 C-01) | Q-18 |

## Reusable rule IDs already present

- `SEQ-01`
- `PLAT-01`
- `HLP-06`
- `DATE-YMD8`
- `DATE-01`
- `HLP-07`
- `AUD-01`
- `LRM-01`
- `AUD-02`
- `DATE-YMD`
- `HLP-09`
- `LRO-02`
- `LRS-11`
- `PROC-01`
- `ORD-01`

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
