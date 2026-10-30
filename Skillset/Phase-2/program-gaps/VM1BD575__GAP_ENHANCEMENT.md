# Gap / enhancement assessment — VM1BD575

- Source report: `IDMS Programs/VM1BD575.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L11: ## 1. Identity, scope and completion
- L15: | Legacy | `IDMS Programs/VM1BD575.cbl` (262 lines). M. Beevers 09/1986. Changes: De Schepper 92/07 (SLIK), Verbeek 96/03 (Y2K), Pomponio 97/01 (EURO2000, DATEPARM 8 pos.), De Schutter 08/2003 (project 6212 Daisy kasbons) [OBS L1-26]. |
- L16: | DB2 | `DB2 Manual converted Programs/VMDZ1575.cbl` (719 lines). V. Mahajan 02/2026. `CBL ARITH(EXTEND)` (legacy `CBL NOSQL`). |
- L20: | IDMS access | LRF `VMBTL07-R01`, subschema VMBTS07; `READY USAGE-MODE IS UPDATE` with **no area list** (all areas) [OBS L126]; direct DML on FFRECAB. |
- L22: | Completion | All paths analysed. Open: Q-17, Q-18, Q-28, Q-29, Q-30, **Q-35**. |
- L55: | Legacy statement | DB2 | Verdict |
- L70: | Kind | Legacy | DB2 |
- L125: | Item | Legacy | DB2 | Verdict |
- L153: | Situation | Legacy | DB2 | Equal? |
- L190: | Aspect | Legacy | DB2 |
- L228: | # | Input | Legacy | DB2 |

## Open / referenced COBOL-team questions

- `Q-17`
- `Q-18`
- `Q-28`
- `Q-29`
- `Q-30`
- `Q-35`
- `Q-25`

## Important report findings to preserve

- L208: | D-02 | Low | seq 047700 | TE_CH_RS_DATA LEN 15 at checkpoint vs 1215 at insert (KY-RESTART truncated) | 1215 |
- L209: | D-03 | Low | 810 seq 043900-044200 | no EOF guard during positioning (legacy has one, L141) | EOF guard |
- L210: | D-04 | Info | seq 057300-057400; 069100 | 11100 sets SQL-LOCATION 11110 and D-line '11110-SELECT-BEFF'; 12200 D-line '1220-UPDATE-EVEF' | 11100 / 12200 |
- L211: | D-05 | Info | 12100 seq 067300 | ORDER BY NR_ID DESC emulates "FIRST" member | ORD-01, Q-17 |
- L212: | D-06 | Info | 11110 seq 063000 | `RIGHT(DIGITS(...),20)` into DEC(20) | SEQ-01 |
- L213: | D-07 | Info | 12100 seq 068200-068400 | not-found text spacing changed; one DISPLAY split in three; LR-STATUS dropped | keep legacy text apart from the program name (NAME-03) |
- L214: | D-08 | Info | header seq 001300-002100; seq 025200 | header claims DZWCEFTV parent and names DZEVEFTB/DZ01RSTB; `11000-INSERT-EFF` inserts only EVEF (clone naming from VMDZ1565) | cosmetic |
- L215: | C-01 | High (cross) | NR_IDGOOD | packed 20 → display 28 | Q-18 |
- L216: | L-01 | Medium (legacy) | L161-163 | no final FFRECAB checkpoint (as VM1BD555) | DB2 template supersedes it (RST-10, Q-29) |
- L217: | L-02 | Low (legacy) | L61, L140-142 | TELLER 9(5) COMP-3 used as positioning counter: NS-REC-FF-IN ≥ 99,999 → TELLER wraps, loop runs to EOF, next READ after EOF abends [INF]. Same 9(5) in VM1BD535/546/555/595 [OBS grep] | not reproduced (CNT-01, Q-28) |
- L234: | T-05 | STCIRC '2', two 0168/0029 events under one EFF | first in set order | highest NR_ID (Q-17) |
- L235: | T-06 | **DATE-IND '0'**, DATE8-LS spaces, run 2026-03-16 | event + key 2026-03-16 | invalid DA_CR_RS → abend [INF], **FAIL D-01** |
- L236: | T-07 | DATE-IND '0', DATE8-LS 01012020 | system date | 2020-01-01 used, **FAIL D-01** |

## Reusable rule IDs already present

- `DATE-IND`
- `DATE-YMD`
- `DATE-DMY8`
- `DATE-YMD8`
- `XPG-01`
- `CNT-01`
- `CPY-01`
- `PLAT-02`
- `NAME-03`
- `ERR-01`
- `ERR-03`
- `DATE-04`
- `SEQ-01`
- `LRS-03`
- `HLP-06`
- `AUD-01`
- `AUD-02`
- `LRM-01`
- `MSG-01`
- `HLP-07`
- `DATE-DMY`
- `RST-LR-01`
- `LRS-11`
- `ERR-02`
- `HLP-04`
- `DATE-01`
- `LRO-02`
- `ORD-01`
- `PROC-01`
- `CMT-01`
- `LRS-09`
- `RST-10`
- `DATE-05`
- `XPG-N575-1`
- `RST-09`

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
