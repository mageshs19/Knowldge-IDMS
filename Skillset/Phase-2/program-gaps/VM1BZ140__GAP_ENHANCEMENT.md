# Gap / enhancement assessment — VM1BZ140

- Source report: `IDMS Programs/VM1BZ140.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L9: ## 1. Identity, scope and completion
- L13: | Legacy | `IDMS Programs/VM1BZ140.cbl` (263 lines). P. Aelvoet (Dolmen); Boogaerts 89/02 (user-id X(8)), 90/05 (commit every 100); De Schepper 93/09 (IDMS RECORDS MANUAL), 95/06 (AR-VMBRFFB UPDATE); B. Hannes 96/10 (EURO: VMBZCOUP→VMBZCOUX); Boogaerts 2003/02 (manual MEP + → update amount in VMBCOUP); Verstraeten 03/05 (R2 new internal key) (L8-25). `CBL NOCMPR2, NOFLAGMIG`. |
- L14: | DB2 | `DB2 Manual converted Programs/VMDZ1140.cbl` (723 lines). V. Mahajan, January 2026. `CBL ARITH(EXTEND)`. |
- L18: | IDMS access | Subschema VMBTS09, LR VMBTL09-R01 paths OB-VMBCOUP, ST-VMBCOUP-VMBEVCP, ST-VMBEVCP, MO-VMBCOUP; FFRECAB direct DML (restart). READY AR-VMBCOUP PROTECTED UPDATE, AR-VMBRFFB UPDATE (L154-155). |
- L21: | Completion | All paths analysed. Open: Q-63..Q-66 (new), Q-17, Q-29, Q-30, Q-48. |
- L65: | Kind | Legacy | DB2 |
- L75: | # | Legacy verb | Line | DB2 | Rule |
- L147: | Aspect | DB2 | Verdict |
- L157: | Situation | Legacy | DB2 | Equal? |
- L174: | LR request | Path (VMBTS09.txt) | Legacy statuses | DB2 |
- L191: | Aspect | Legacy | DB2 |
- L228: | # | Input / DB state | Legacy | DB2 |

## Open / referenced COBOL-team questions

- `Q-63`
- `Q-66`
- `Q-17`
- `Q-29`
- `Q-30`
- `Q-48`
- `Q-21`
- `Q-31`
- `Q-64`
- `Q-65`
- `Q-32`
- `Q-25`

## Important report findings to preserve

- L206: | D-02 | Low | 1300 seq 069400-070200; overwrite at seq 057900 | ID-USERID-479COUP is set to CS-PROGRAM (seq 031700) **before** 1000, whose `SELECT INTO` overwrites it; the UPDATE writes back the old user id. Only TS_UPDATE is refreshed (AUD-02 violated). | `MOVE CS-PROGRAM TO ID-USERID-479COUP` in 1300 (AUD-N140-1) |
- L207: | D-03 | Low | 810 seq 040000-040300 | restart skip loop without EOF guard (legacy guarded, L249) | `UNTIL VMDZMEPI-EOF` guard |
- L208: | D-04 | Low | seq 043800 vs 041400 | LEN 15 at commit, 143 at insert: KY-RESTART truncated (unused on restart). Same in VMDZ1170 (seq 033700) | 143 |
- L209: | D-05 | Low | seq 022600, 024400, 029200 | Date mapping handles only 0/spaces → 0001-01-01; no 99999999 → 9999-12-31, no validity check. Legacy stores raw X(8); invalid values → -180/-181 abend [INF] | shared DATE-01 routine (DATE-03, Q-64) |
- L210: | D-06 | Info | 1000, 700-*, COMMIT | SQL-LOCATION not set → stale diagnostics | set per paragraph |
- L211: | D-07 | Info | seq 071400 | 1300 WHEN OTHER lacks 'ERROR REC NUMBER' DISPLAY (ERR-01) | add DISPLAY |
- L212: | D-08 | Info | seq 001100-001800, 006900, 036800 | cloned "KASBONS"/DZCOUPTB/DZ01RSTB header text, WS-INPUT-KASBONS name, unconditional TIMESTAMP DISPLAY, positional `VALUES (:DCLDZCOUPTV)` | cosmetic / explicit column list |
- L213: | L-01 | Low (legacy) | L165, L192, L248 | TELLER not restored on restart → NS-ID-EVPR restarts at 1; duplicates the sequence of events committed before the abend on the same run date | retain (Q-66) |
- L232: | T-03 | existing coupon, CT-OP 99 | +EVCP, AM-INTGR ← AM-IND | +EVCP, AM updated, ID_USERID unchanged → **FAIL D-02** (audit only) |
- L235: | T-06 | 250 records, one run | NS-ID-EVPR 1..250 | 1..100, 1..100, 1..50 → **FAIL D-01** |

## Reusable rule IDs already present

- `CPY-01`
- `DATE-IND`
- `DSP-02`
- `PLAT-01`
- `PLAT-02`
- `LRO-01`
- `LRS-N140-1`
- `SEQ-01`
- `LRM-01`
- `AUD-02`
- `RST-LR-01`
- `RST-10`
- `ERR-01`
- `DATE-04`
- `HLP-06`
- `KEY-N567-1`
- `DATE-01`
- `SEQ-040IRMO`
- `AUD-01`
- `CNT-N140-1`
- `CNT-01`
- `HLP-10`
- `ERR-03`
- `MSG-N620-1`
- `ORD-01`
- `PROC-01`
- `LRO-N595-1`
- `HLP-09`
- `RST-LR-02`
- `CMT-01`
- `CMT-N590-1`
- `RST-09`
- `AUD-N140-1`
- `DATE-03`
- `DATE-05`
- `NAME-03`
- `XPG-01`
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
