# Gap / enhancement assessment — VM1BD595

- Source report: `IDMS Programs/VM1BD595.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L7: > - No direct legacy sister: VM1BD595 is the only legacy program with VERWERK-41/43 + MOD-EVEF-NEW and event code 1818 used this way [OBS grep]. DB2 paragraph numbering is cloned from VMDZ1565/1575 (11100/11110/12100/12200), and the WCEF chain is cloned from VMDZ1555 (QUERYNO 656).
- L11: ## 1. Identity, scope and completion
- L15: | Legacy | `IDMS Programs/VM1BD595.cbl` (364 lines). M. Beevers 09/1986. Changes: Boogaerts 89/12 (PARM date as event date), Clement 92/07 (SLIK), Verbeek 96/03 (Y2K), Pomponio 97/01 (EURO2000), Boogaerts 2003/07 (6212 integration). `CBL NOSQL`. |
- L16: | DB2 | `DB2 Manual converted Programs/VMDZ1595.cbl` (1041 lines). V. Mahajan 02/2026. `CBL ARITH(EXTEND)`. |
- L20: | IDMS access | LRF `VMBTL07-R01` (subschema VMBTS07; elements VMBSIAS, VMBFAS, VMBWCEF, VMBEFF, VMBEVEF). `READY USAGE-MODE IS UPDATE` with no area list (PLAT-02). Direct DML on FFRECAB. |
- L22: | Completion | All paths analysed. Open: Q-17, Q-18, Q-19, Q-28, Q-29, Q-30, **Q-43**, **Q-44**. |
- L49: | CT-OPD | STCIRC | CT-SL | Legacy | DB2 |
- L62: | Kind | Legacy | DB2 |
- L74: | # | Legacy verb | Line | DB2 |
- L118: | Item | Legacy | DB2 | Verdict |
- L147: | Situation | Legacy | DB2 | Equal? |
- L190: | Aspect | Legacy | DB2 |

## Open / referenced COBOL-team questions

- `Q-17`
- `Q-18`
- `Q-19`
- `Q-28`
- `Q-29`
- `Q-30`
- `Q-43`
- `Q-44`
- `Q-21`
- `Q-02`
- `Q-25`

## Important report findings to preserve

- L208: | D-04 | Low | seq 004900-005400 | All 3 STOP literals keep 'VM1BD595'. Only VMDZ1595 has no renamed STOP literal (1555/1573 are mixed) [OBS grep] | MSG-01 |
- L209: | D-05 | Low | seq 102600-103300, 089400, 100900 | -803 on BEFF displays STOP02 (legacy STOP01); chain EVEF error shows STOP02; 13120 shows none | ERR-02 |
- L210: | D-06 | Medium | seq 033700-034000, 036400-036700, 052900-053200 | DA-UB 99999999 not mapped to 9999-12-31; group source instead of `-R` | DATE-01, HLP-04, Q-19 |
- L211: | D-07 | Low | seq 071800 | commit-time LEN 15 vs insert 1215 | template defect |
- L212: | D-08 | Low | seq 068000-068400 | restart positioning without EOF guard | template defect |
- L213: | D-09 | Info | seq 081500 | SQL-LOCATION 11110 in 11100 (same in VMDZ1565/1575) | diagnostics |
- L214: | D-10 | Info | seq 091600 | DESC emulates set order | ORD-01, Q-17 |
- L215: | D-11 | Info | seq 087200 | DIGITS cast of sequence; NS_IDMSKEY 0 | SEQ-01 |
- L216: | C-01 | High (cross) | NR_IDGOOD | display 28 vs packed 20 | Q-18 |
- L217: | L-01 | Medium (legacy) | L171-173 | no final FFRECAB checkpoint (as VM1BD555) | RST-10, Q-29 |
- L218: | L-02 | Medium (legacy) | L114 | inverted window `< 60 → 19`: 2000-2059 become 19YY. Unique among legacy programs (others `> 60`) [OBS grep] | keep; Q-44 / Q-30 |
- L219: | L-03 | Medium (legacy) [INF] | L202, L340-350 | branch STCIRC = '1': new EFF stored with X'40' in COMP-3 AM-CND/AM-CN/AM-INTER and blank TPROD-EX (MOVE SPACES, never filled). DB2 cannot store this; it stores 0.00 | HLP-N595-1; Q-43 |
- L220: | L-04 | Low (legacy) | L63, L142-145 | VARYING TELLER 9(5) vs NS-REC-FF-IN 9(7): above 99,999 checkpointed records the index wraps and the rest of the file is skipped [INF] | DB2 9(15) is fine; Q-28 |
- L240: | T-06 | OPD 41, STCIRC 9, CT-SL 0, old EFF AM-CND 1000,00, old event dated 2026-01-10 | new EFF AM-CND 1000,00; new 0060 event dated 2026-01-10 with old CI [INF] | AM_CNDSTK 0, event dated run date, input CI | **FAIL D-03** |
- L241: | T-07 | OPD 41, STCIRC 9, old EFF has two 0168/1818 events | first in set order updated | highest NR_ID updated | Q-17 |
- L243: | T-09 | DATE-IND '0', run 2026-03-16, DATE8-LS spaces | date 1926-03-16 (L-02) | invalid DA_CR_RS → SQLERROR [INF] | **FAIL D-01/D-02** |
- L244: | T-10 | DA-UB 99999999, new title | stored 99999999 | DATE '9999-99-99' → -180/-181 [INF] | **FAIL D-06** |

## Reusable rule IDs already present

- `PLAT-02`
- `DATE-IND`
- `DATE-DMY8`
- `DATE-YMD8`
- `DSP-02`
- `CPY-01`
- `PLAT-01`
- `DATE-YMD`
- `DATE-04`
- `RST-10`
- `LRS-11`
- `LRO-02`
- `ORD-01`
- `LRM-01`
- `LRS-10`
- `ERR-01`
- `HLP-06`
- `HLP-10`
- `SEQ-040IRMO`
- `DATE-01`
- `AUD-01`
- `AUD-02`
- `SEQ-01`
- `CNT-01`
- `HLP-07`
- `MSG-01`
- `RST-LR-01`
- `ERR-03`
- `HLP-04`
- `LRO-N595-1`
- `XPG-01`
- `PROC-01`
- `RST-07`
- `DATE-05`
- `ERR-02`
- `HLP-N595-1`
- `NAME-03`
- `HLP-09`
- `ERR-04`

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
