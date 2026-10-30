# Gap / enhancement assessment — VM1BD250

- Source report: `IDMS Programs/VM1BD250.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L14: ## 1. Identity, scope and completion
- L18: | Legacy program | `Mainframe/workspace/IDMS Programs/VM1BD250.cbl` (833 lines; SHA-256 f32e30fa…25183; UTF-8) |
- L19: | DB2 program (manual conversion, reference) | `Mainframe/workspace/DB2 Manual converted Programs/VMDZ1250.cbl` (1599 lines; SHA-256 a833dd1b…8d0e9; author Vinay Mahajan 09-12-25) |
- L20: | Pairing evidence | Name rule `VM1BD###` → `VMDZ1###` [INF]. Same comments (`JEROD 11/11/2003`, `VOOR ELKE EERSTE LIJN VAN BLOK…`), the same dispatch table and the same paragraph numbering [OBS]. Collision risk: `VM1BZ250` would map to the same name under a naive rule (Q-09). |
- L21: | Program type | Batch, sequential-file driven, **insert-only** (no read-for-update, no cursors, no delete) |
- L22: | IDMS access mode | LRF (logical record `VMBTL06-R01`, subschema `VMBTS06` within `VMBTSCH`). Plus one **direct DML** record: FFRECAB (restart). |
- L24: | Completion | Analysis complete for all executable paths. Dependencies not supplied: `VMDZ205I`, `SQLERRWS`, `SQLERROR`, `VMBDW03-R01` (see §3). |
- L47: | Step | Legacy | DB2 |
- L101: | Kind | Legacy | DB2 | Status |
- L141: | 10 | `FINISH` (implicit commit) | final `PERFORM 800-PROCESS-COMMIT` with CO-ID-RS='1' | RST-05, RST-06 | Variant (completion flag) |
- L164: | Legacy | DB2 |
- L219: | SW-VMDZ205I / 88 EOF, NOT-EOF | legacy | input EOF | **Mandatory** | rename only |

## Open / referenced COBOL-team questions

- `Q-09`
- `Q-07`
- `Q-03`
- `Q-11`
- `Q-10`
- `Q-08`
- `Q-04`
- `Q-05`
- `Q-06`
- `Q-01`
- `Q-21`
- `Q-02`
- `Q-12`

## Important report findings to preserve

- L331: | C-250-01 | Owner SI* insert, tolerate duplicate | 252-275 (221) | 375-385, 1129-1146 |
- L332: | C-250-02 | Form insert, duplicate fatal | 400 + 210/240/300 | 794-815, 1109-1127 |
- L333: | C-250-03 | Form insert, duplicate tolerated (280) | 443-483 | 520-524 (defective) |
- L334: | C-250-04 | Single-parent child + sequence key (BFAS) | 613-782 | 817-991, 1148-1344 |
- L335: | C-250-05 | Two-parent child FORM+SI (BFDN) | 300-336 | 427-497, 1365-1429 |
- L336: | C-250-06 | Two-parent child FORM+SI (MBFR) | 488-535 | 530-666, 1450-1538 |
- L337: | C-250-07 | Single-parent child, business key, diagnostic DISPLAY (BFAR) | 537-602 | 669-791, 1559-1589 |
- L338: | C-250-08 | Block header via switch + per-line detail by currency | 397-441 | 507-518 |
- L403: | D-03 | Low | WS L61-62, L97, L101 | Unused SW-DZ01RSTV, DA-YYMMDD, DA-DDMMCCYY | Remove. |
- L404: | D-04 | Low | WS | Level-number inconsistency (`02 DA-DD-MM-CCYY` after `03` items) | Use a consistent level. |
- L415: | V-04 | The child surrogate key now comes from a sequence. On a duplicate business key, a child row (BFAS/BFDN/MBFR) no longer fails (legacy LR-ERROR on 1205 only if the record had a CALC/duplicates-not-allowed key; [UNK]). |
- L439: | T-06 | Exchange block of 3 lines (same REFORD) | 1× FORM 0221 (+SITE+FTE), 3× FTEL | 3× FORM 0221 attempts → -803 or extra rows → **FAIL D-01** |
- L440: | T-07 | Two consecutive blocks with different REFORD | 2 headers | 2+ headers (all lines) → **FAIL D-01** |
- L441: | T-08 | Replacement 53/41 for an existing form | continue | SQLERROR abend → **FAIL D-02** |

## Reusable rule IDs already present

- `PLAT-01`
- `NAME-01`
- `PLAT-02`
- `ERR-01`
- `RST-01`
- `RST-04`
- `RST-02`
- `RST-03`
- `RST-05`
- `RST-06`
- `LRS-01-B`
- `LRS-01-C`
- `LRS-01-A`
- `LRS-02`
- `LRS-09`
- `LRS-05`
- `DATE-01`
- `AUD-01`
- `DATE-02`
- `NAME-02`
- `LRS-04`
- `HLP-04`
- `LRS-01`
- `RST-07`
- `LRS-03`

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
