# Gap / enhancement assessment — VM1BZ170

- Source report: `IDMS Programs/VM1BZ170.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L12: ## 1. Identity, scope and completion
- L16: | Legacy | `IDMS Programs/VM1BZ170.cbl` (209 lines). P. Aelvoet (Dolmen) 30-10-86. Later changes: Boogaerts 89/02 (USER-ID X(8)); D'Angelo 89/09 "COMMIT TOUS LES 50 MODIFY" (L9); Hannes 96/10 EURO VMBZCOUP → VMBDCOUX; Verstraeten 03/05 "MODIFICATIONS R2" (L16-18). |
- L17: | DB2 | `DB2 Manual converted Programs/VMDZ1170.cbl` (512 lines). V. Mahajan 01/2026. `CBL ARITH(EXTEND)`. |
- L21: | IDMS access | Subschema **VMBTS07** (L51), LR `VMBTL07-R01` paths `OB-VMBEFF` and `MO-VMBEFF`. Direct DML on FFRECAB (restart). READY AR-VMBEFF1 + AR-VMBRFFB UPDATE (L125-126). |
- L24: | Completion | All paths analysed. Open: Q-67..Q-70, Q-48, Q-29. |
- L69: | Kind | Legacy | DB2 |
- L82: | # | Legacy verb | Line | DB2 | Rule |
- L142: | Aspect | DB2 | Verdict |
- L155: | Situation | Legacy | DB2 | Equal? |
- L176: | LR request | Path (VMBTS07) | Legacy statuses | DB2 |
- L200: | Aspect | Legacy | DB2 |
- L240: | # | Input / DB state | Legacy | DB2 |

## Open / referenced COBOL-team questions

- `Q-67`
- `Q-70`
- `Q-48`
- `Q-29`
- `Q-68`
- `Q-69`
- `Q-21`

## Important report findings to preserve

- L220: | D-04 | Low | seq 033700 vs 031300 | TE-CH-RS-DATA-LEN 15 at commit, 143 at insert. KY-RESTART is truncated; only NB-READ is read back, so there is no functional effect. | 143 |
- L221: | D-05 | Info | seq 044800 | singleton SELECT without FETCH FIRST 1 ROW ONLY (LRO-01) | safe if unique (Q-69) |
- L222: | D-06 | Info | seq 048000, 046200, 001100-001700 | SQL-LOCATION 1100 in paragraph 1110. 700-* paragraphs set no location. Paragraph name typo `1100-UPDTAE-BEFF`. Header text cloned ("KASBONS", TB names). | cosmetic |
- L223: | D-07 | Info | seq 004800, 006700, 007700-009000, 021000 | dead MAX-TS-TIMESTAMP, DA-YYMMDD, DA-DDMMCCYY; redundant NS-DB-TEMP and INITIALIZE HELP-NR-ID-STOCK-CD | cosmetic |
- L224: | D-08 | Info | seq 050000 | UPDATE SQLCODE 100 goes to SQLERROR (Q-48) | ERR-N620-1 note |
- L225: | L-01 | Low (legacy) | L188, L70, L48 | Commit happens only after 50 MODIFYs. A long run with few updates never checkpoints before EOF. NBR-REC-READED S9(7) / NS-REC-FF-IN 9(7) truncate above 9,999,999 records per interval [INF, volume UNK]. | retain |
- L226: | L-02 | Info (legacy) | L92-97 | L-PARAM is never checked. A short PARM gives a garbage FFRECAB key or date. | retain |
- L227: | L-03 | Info (legacy) | L112-114 | 2-digit year window (< 60 → 20xx) is valid until 2059 | retain (DATE-04) |
- L243: | T-02 | NX 007, input rank 005 | no change | **NX → 5, FAIL D-01** |
- L244: | T-03 | NX 007, input rank 007 | no change, NBR-MODIFY unchanged | re-update + audit + count, **FAIL D-01** |
- L245: | T-04 | two records, same stock, ranks 009 then 008 | NX 9 | **NX 8, FAIL D-01** |
- L248: | T-08 | restart, file 1 record shorter than count | USERABEN + message | RC 0, CO_ID_RS '1', **FAIL D-03** |
- L249: | T-09 | restart, file ≥ 2 records short | USERABEN + message | status 46 abend [INF], **FAIL D-03** (diagnostics) |
- L252: | T-13 | two runs same day, PROG-VERSION A and B | independent FFRECAB rows | one row; second run abends or mis-positions, **FAIL D-02** (Q-67) |

## Reusable rule IDs already present

- `XPG-01`
- `DATE-IND`
- `DATE-WS`
- `CPY-01`
- `PLAT-01`
- `PLAT-02`
- `LRO-01`
- `LRO-N170-1`
- `ERR-03`
- `LRM-01`
- `AUD-02`
- `RST-LR-01`
- `CNT-N170-1`
- `RST-10`
- `ERR-01`
- `DATE-04`
- `NAME-02`
- `HLP-06`
- `CNT-01`
- `RST-07`
- `HLP-04`
- `AUD-01`
- `MSG-01`
- `PROC-01`
- `RST-LR-02`
- `LRS-11`
- `CMT-01`
- `CMT-N590-1`
- `RST-N170-1`
- `RST-09`
- `ERR-N170-1`
- `ERR-02`
- `ERR-N620-1`
- `NAME-03`
- `DATE-05`
- `XPG-N575-1`

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
