# Gap / enhancement assessment — VM1BD625

- Source report: `IDMS Programs/VM1BD625.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L11: ## 1. Identity, scope and completion
- L15: | Legacy | `IDMS Programs/VM1BD625.cbl` (512 lines). K. Heyse / K. De Schepper 14/03/1997 (L13-16); J. De Schutter 08/2003 VMBD510X → VMBD510I (L20-22). `CBL NOSQL` (L1). |
- L16: | DB2 | `DB2 Manual converted Programs/VMDZ1625.cbl` (672 lines). V. Mahajan, March 2026 (seq 000500-000600). `CBL ARITH(EXTEND)`. |
- L20: | IDMS access | Subschema VMBTS06 (L51), `PROTOCOL MODE IS BATCH DEBUG` — **not AUTOSTATUS** (L35); every verb followed by `PERFORM IDMS-STATUS`. BIND ×7 + READY AR-VMBFRM3 / AR-VMBRFFB UPDATE (L204-223). No LR call although SUBSCHEMA-LR-CTRL is copied (L125). |
- L23: | Completion | All paths analysed. Open: Q-03 (decides D-01 severity), Q-17, Q-29, Q-32, Q-48, Q-51..Q-54. |
- L58: | Kind | Legacy | DB2 |
- L70: | # | Legacy | Line | DB2 | Rule |
- L139: | Aspect | DB2 | Verdict |
- L152: | Situation | Legacy | DB2 | Equal? |
- L174: | Legacy construct | IDMS meaning | DB2 |
- L195: | Aspect | Legacy | DB2 |
- L201: | End of job | commit only if updates pending, then ROLLBACK; no completion flag | final commit CO_ID_RS '1' |

## Open / referenced COBOL-team questions

- `Q-03`
- `Q-17`
- `Q-29`
- `Q-32`
- `Q-48`
- `Q-51`
- `Q-54`
- `Q-53`
- `Q-52`

## Important report findings to preserve

- L212: | D-03 | Low | seq 009400, 056000, 062600 | `MOVE 'DZBFDNTV'/'DZMBFRTV'` into WS-RECORD X(7) → 'DZBFDNT'/'DZMBFRT'; legacy showed 'VMBFORM'/'VMBFDN'/'VMBFR'; owner vs member distinction lost; same text for real SQL errors. Unique to VMDZ1625 [OBS grep]. | keep legacy record names (MSG-01, **MSG-N625-1**) |
- L213: | D-04 | Low | seq 027900-028000, 031900-032000 | DA-CREA 99999999 not mapped to 9999-12-31 (DATE-01; Q-32) → -180/-181 [INF] | full DATE-01 routine |
- L214: | D-05 | Low | 811 seq 040900; seq 024100 | restart positioning and first READ without EOF guard (template) | guard |
- L215: | D-06 | Low | seq 044200 vs 042300 | TE-CH-RS-DATA-LEN 15 at commit, 1215 at insert (template) | 1215 |
- L216: | D-07 | Low | seq 042200 | NB_DAY_RS 7 vs legacy NB-DAY-FF 10 (L235) | 10 (Q-52) |
- L217: | D-08 | Info | seq 055000, 061600 | DESC + FETCH FIRST assumes ORDER FIRST; moot if one member per form [INF] | Q-17 |
- L218: | D-09 | Info | seq 026800, 060300, 064600, 052100, 019000, 009800, 052200 | D-lines mislabelled ('212000-BEHANDEL-VMBFDN' in 211000, '212100-SELECT-BFDN'); seq 064600 D-line displays `DA_CPTA_479MBFR` (invalid COBOL name → compile error under WITH DEBUGGING MODE); unreachable STOP RUN seq 019000 (300000 ends with STOP RUN); duplicate 01 WS-DATUMVELDEN; INSERT without QUERYNO / SQL-LOCATION | cosmetic |
- L219: | L-01 | **High (legacy, restart only)** | L241-246 + L489 | restart skip loop increments WS-NB-INPUT twice per record. Even NS-REC → only NS/2 records skipped, rest re-processed, later checkpoints inflated. Odd NS-REC → never equal → reads to EOF, remaining records **never processed**; next READ after EOF (L253) → file status 46 [INF: runtime abend or silent end] | retain-as-is not possible on template; DB2 template is correct → V-02, **RST-N625-1** |
- L220: | L-02 | Low (legacy) | L451-462 | run ends with ROLLBACK (FINISH commented). With no update since the last commit, final NS-REC not saved; first-run FFRECAB STORE rolled back when zero updates [INF] | V-03 |
- L243: | T-07 | OPD 41 / 65 / 71 record | member updated (or abend) | no action, **FAIL unless Q-03 confirms** (D-01) |
- L247: | T-11 | DA-CREA 99999999 | CALC lookup | -180/-181 [INF], FAIL D-04 |

## Reusable rule IDs already present

- `LRS-09`
- `DATE-IND`
- `CPY-01`
- `PLAT-01`
- `NAME-03`
- `PLAT-02`
- `ORD-01`
- `LRM-01`
- `AUD-02`
- `RST-LR-01`
- `RST-10`
- `RST-N625-2`
- `ERR-01`
- `ERR-03`
- `ERR-N620-1`
- `DATE-04`
- `KEY-N567-1`
- `XPG-01`
- `HLP-04`
- `NAME-02`
- `HLP-10`
- `CNT-01`
- `MSG-01`
- `DATE-01`
- `HLP-06`
- `LRS-01-B`
- `LRO-01`
- `LRO-02`
- `LRS-N625-1`
- `PROC-01`
- `CMT-01`
- `RST-09`
- `MSG-N625-1`
- `RST-N625-1`
- `DSP-02`
- `DATE-05`
- `ERR-02`
- `MSG-N620-1`
- `PLAT-N620-1`
- `XPG-N575-1`
- `LRS-11`

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
