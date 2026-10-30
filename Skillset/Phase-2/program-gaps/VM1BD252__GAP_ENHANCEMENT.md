# Gap / enhancement assessment — VM1BD252

- Source report: `IDMS Programs/VM1BD252.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L18: ## 1. Identity, scope and completion
- L22: | Legacy program | `Mainframe/workspace/IDMS Programs/VM1BD252.cbl` (330 lines; author VHEML 30/07/2003) |
- L23: | DB2 program (manual conversion, reference) | `Mainframe/workspace/DB2 Manual converted Programs/VMDZ1252.cbl` (469 lines; author JAINRG 18/12/2025) |
- L24: | Pairing evidence | Name rule `VM1BD###` → `VMDZ1###` [INF]. Same paragraph numbers (220, 510), same STOP01 text, and the same FFRECAB→DZ01RSTV template [OBS]. |
- L25: | Program type | Batch, sequential-file driven, **read-for-update (LR OBTAIN + LR MODIFY)**. No STORE or ERASE. |
- L26: | IDMS access mode | LRF `VMBTL06-R01` (subschema `VMBTS06`), plus direct DML on FFRECAB (restart) |
- L28: | Completion | All executable paths analysed. Missing dependencies are the same as VM1BD250: `VMDZ205I`, `SQLERRWS`, `SQLERROR`, `VMBDW03-R01`. |
- L38: | Step | Legacy (L89-95) | DB2 |
- L48: | OPD | Legacy paragraph | Record modified | Fields changed (from input) | DB2 | Status |
- L69: | Kind | Legacy | DB2 | Note |
- L131: | SW-VMDZ205I | legacy | Mandatory | rename |
- L133: | TELLER | legacy | Mandatory (commit interval). Reset in 830 and after restart. | keep |

## Open / referenced COBOL-team questions

- `Q-01`
- `Q-02`
- `Q-12`
- `Q-13`
- `Q-03`
- `Q-04`
- `Q-14`

## Important report findings to preserve

- L274: | D-03 | Medium | 510 date | The `99999999 → 9999-12-31` branch from VMDZ1250 is missing. A 99999999 creation date gives '99.99.9999', which causes SQLCODE -180/-181. The IF is also period-terminated (`MOVE 00010101 TO DA-CCYYMMDD.`). | Use the shared DATE-01 routine with both branches. |
- L275: | D-04 | Low | WS | SW-DZ01RSTV / FFRECAB-AANW and DA-DDMMCCYY are unused. | Omit. |
- L276: | D-05 | Info | 220 | NR-CIOFMAS-479BFAS is moved twice (510 and 220). | Harmless. |
- L280: | V-01 | Rerunning a completed run abends (same as VM1BD250 V-01). |
- L281: | V-02 | 53/65, 53/71 and 53/41 records are no longer validated against an existing form (dropped branches). |
- L282: | V-03 | DB2 sets TS_UPDATE / ID_USERID on modify. Legacy had no audit (AUD-02). |
- L290: | T-01 | 53/51 for an existing subscription, single BFAS under SIAS | modify that BFAS | same → PASS |
- L291: | T-02 | 53/51 where the same SIAS also has a 53/52 annulment BFAS with a lower NR_ID | modify the 51 row (CALC key includes OPD) | modifies the **52** row → **FAIL D-01** |
- L292: | T-03 | 53/51 where SIAS has BFAS rows for two creation dates | modify the row for the input date | modifies the oldest → **FAIL D-01** |
- L296: | T-07 | DA-CREA = 99999999 | CALC lookup works | -180 abend → **FAIL D-03** |

## Reusable rule IDs already present

- `LRS-09`
- `PLAT-01`
- `ERR-01`
- `RST-01`
- `RST-02`
- `RST-05`
- `RST-06`
- `LRO-01`
- `ERR-02`
- `LRM-01`
- `DATE-01`
- `HLP-04`
- `AUD-02`
- `RST-04`
- `LRO-02`

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
