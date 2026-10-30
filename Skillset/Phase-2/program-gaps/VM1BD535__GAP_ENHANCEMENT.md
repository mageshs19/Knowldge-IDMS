# Gap / enhancement assessment — VM1BD535

- Source report: `IDMS Programs/VM1BD535.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L3: > **Purpose of this file.** Knowledge base for one program, written for a downstream AI or Python conversion engine. It records what the legacy program does, how the manual DB2 conversion (VMDZ1535) re-implemented it, and where the two differ.
- L13: ## 1. Identity, scope and completion
- L17: | Legacy program | `IDMS Programs/VM1BD535.cbl` (272 lines; M. Beevers 09/1986; changes 1989 BCI3, 1992 SLIK, 1997 EURO2000, 08/2003 project 6212) |
- L18: | DB2 program | `DB2 Manual converted Programs/VMDZ1535.cbl` (842 lines) |
- L19: | Program type | Batch, sequential-file driven, **two-way dispatch** on `CO-STCIRC-OORD`: (a) create a security (WCEF → EFF → EVEF chain) with a "creation for withdrawal" event; (b) find + modify that event. |
- L20: | IDMS access mode | LRF `VMBTL07-R01`, subschema **VMBTS07**. `READY USAGE-MODE IS UPDATE`. Plus direct DML on FFRECAB. |
- L23: | Completion | All paths analysed. Still open: SQLERROR content (Q-02), set order (Q-17), NR_IDGOOD format (Q-18), DA-UB 99999999 (Q-19). |
- L37: | `CO-STCIRC-OORD` | Legacy | DB2 |
- L76: | Kind | Legacy | DB2 | Note |
- L89: | # | Legacy | Line | Disposition | DB2 |
- L128: | Item | Legacy | DB2 | Verdict |
- L156: | Situation | Legacy | DB2 | Equivalent? |

## Open / referenced COBOL-team questions

- `Q-02`
- `Q-17`
- `Q-18`
- `Q-19`
- `Q-21`
- `Q-27`

## Important report findings to preserve

- L209: | D-03 | Medium | 1100 (×3 date blocks) | DA-UB 99999999 → '99.99.9999' → -180/-181 (same as VM1BD515 D-02, Q-19) | DATE-01 with the 99999999 branch |
- L210: | D-04 | Low | 810 | no EOF guard during positioning (legacy also unclean) | STOP01-style guard (RST template) |
- L211: | D-05 | Low | 1210 WHEN 100, 1200 seq 043800, 1220 seq 083000-083100 | missing key in the not-found message; `DISPLAY 'ID :'`, 'REC NO', 'TOTAL UPDATES' **for every update** (SYSOUT volume) | key in the error path only |
- L212: | D-06 | Medium (decision) | 1210 | DESC vs legacy set order (Q-17, ORD-01) | keep DESC pending Q-17 |
- L213: | D-07 | Low | 800-PROCESS-COMMIT seq 056100 | LEN 15 vs 1215 | 1215 |
- L214: | D-08 | Info | 130 | `RIGHT(DIGITS(NEXT VALUE …),20)` → DECIMAL (implicit cast) | `NEXT VALUE FOR DZEVEFSQ` |
- L215: | D-09 | Info | WS | DA-YYMMDD, DA-DDMMCCYY unused; QUERYNO 761 (update) < 764 (select) | cosmetic |
- L216: | C-01 | High (cross-program) | NR_IDGOOD | packed 20 → display 28 | Q-18 |
- L231: | T-02 | '1', CO-COUP = ' ', NS-IDCP = 10, AM-INTER = 5 | EFF coupons 0 / 0 / 0, AM-INTER 0 | 10 / 9 / 10, AM-INTER 5 → **FAIL D-01** |
- L232: | T-03 | '1', CO-COUP = '0', NS-IDCP = 0 | CPAID = 1 [INF] | CPAID = 0 → **FAIL D-02** |
- L237: | T-08 | DA-UB = 99999999 | stored | -180 → **FAIL D-03** |

## Reusable rule IDs already present

- `SEQ-040IRMO`
- `SEQ-01`
- `DATE-01`
- `HLP-06`
- `LRM-01`
- `AUD-02`
- `AUD-01`
- `HLP-07`
- `LRO-02`
- `LRS-10`
- `ORD-01`
- `XPG-01`
- `ARI-01`

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
