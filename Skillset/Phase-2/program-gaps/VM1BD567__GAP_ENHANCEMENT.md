# Gap / enhancement assessment — VM1BD567

- Source report: `IDMS Programs/VM1BD567.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L11: ## 1. Identity, scope and completion
- L15: | Legacy | `IDMS Programs/VM1BD567.cbl` (180 lines). P. D'Angelo 08/1988; commits M. Beevers; Clement 07/92 (SLIK); Pomponio 01/97 (EURO2000, 8-pos PARM date); De Schutter 08/2003 (Daisy kasbons, VMBD510X → VMBD205I) [OBS L5-26]. |
- L16: | DB2 | `DB2 Manual converted Programs/VMDZ1567.cbl` (457 lines). V. Mahajan 02/2026. `CBL ARITH(EXTEND)` [OBS seq 000100-000600]. |
- L20: | IDMS access | **Direct DML, no LRF** (first such business record in the series): subschema VMBTS06 (`USAGE IS MIXED` [OBS VMBTS06.txt L4]), `READY USAGE-MODE IS UPDATE` (all areas) [OBS L105]. FFRECAB direct DML for restart. PROTOCOL BATCH-AUTOSTATUS [OBS L39]. |
- L22: | Completion | All paths analysed. Open: Q-29 (restart template vs legacy), Q-31, Q-32. |
- L50: | Kind | Legacy | DB2 |
- L135: | Situation | Legacy | DB2 | Equal? |
- L176: | Aspect | Legacy | DB2 |
- L196: | D-02 | Low | 710 seq 029700-030000; seq 018000 | positioning reads NB-READ times without EOF guard; first READ not guarded (legacy L132 is) → READ after EOF = runtime abend [INF] | guard as legacy |
- L216: | # | Input / setup | Legacy | DB2 | Result |

## Open / referenced COBOL-team questions

- `Q-29`
- `Q-31`
- `Q-32`
- `Q-21`

## Important report findings to preserve

- L195: | D-01 | Low | 800-PROCESS-COMMIT seq 033500 | `MOVE 15 TO TE-CH-RS-DATA-LEN` (INSERT uses 1215) | 1215 (template) |
- L196: | D-02 | Low | 710 seq 029700-030000; seq 018000 | positioning reads NB-READ times without EOF guard; first READ not guarded (legacy L132 is) → READ after EOF = runtime abend [INF] | guard as legacy |
- L197: | D-03 | Low | seq 020300-020400 | DA-CREA 99999999 not mapped to 9999-12-31 (DATE-01) → '99.99.9999' host value → -180/-181 → abend [INF]; legacy would find the record | shared DATE-01 routine for writer (VMDZ1250) and updater (DATE-03); Q-32 |
- L198: | D-04 | Info | seq 044700 | not-found (+100) only displays record number, no key columns | optional key DISPLAY (LRS-02 note) |
- L199: | D-05 | Info | seq 010300 | `02 DA-DD-MM-CCYY` after `03` items (same as VMDZ1257 D-05) | consistent levels |
- L200: | D-06 | Info | seq 001500-002000, 028900, 030800 | header cites DZBFARTB / DZSIARTV / DZ01RSTB; D-line names 810/820 vs paragraphs 710/720 | cosmetic |
- L201: | D-07 | Info | seq 005900 | WS-TELLER 9(9) COMP-3 vs template 9(7) | harmless (CNT-01 satisfied) |
- L205: | V-01 | Completed rerun abends (legacy reran idempotently). |
- L221: | T-04 | DA-CREA 99999999, migrated row | found, updated | -180/-181 abend [INF] | FAIL D-03 |
- L227: | T-10 | restart row NB-READ 300, file has 250 | guarded | READ past EOF → abend [INF] | FAIL D-02 |

## Reusable rule IDs already present

- `LRM-01`
- `DATE-DMY8`
- `DATE-IND`
- `DATE-YMD8`
- `PLAT-01`
- `PLAT-02`
- `RST-01`
- `RST-02`
- `RST-07`
- `AUD-02`
- `RST-03`
- `RST-05`
- `RST-LR-01`
- `RST-06`
- `ERR-01`
- `KEY-N567-1`
- `DATE-01`
- `DATE-03`
- `NAME-02`
- `HLP-10`
- `SEQ-01`
- `DATE-YMD`
- `DATE-DMY`
- `NAME-03`
- `CNT-01`
- `HLP-06`
- `RST-10`
- `ERR-03`
- `HLP-04`
- `PROC-01`
- `CMT-01`
- `HLP-05`
- `RST-N567-1`
- `LRS-02`
- `XPG-01`
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
