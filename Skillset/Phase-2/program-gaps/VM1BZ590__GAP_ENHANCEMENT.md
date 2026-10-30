# Gap / enhancement assessment — VM1BZ590

- Source report: `IDMS Programs/VM1BZ590.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L11: ## 1. Identity, scope and completion
- L15: | Legacy | `IDMS Programs/VM1BZ590.cbl` (305 lines). J-M Boogaerts 14-11-86; Boogaerts 90/05 (commit every 100), J. Clement 93/11 (VMGDIFC → VMGDIFCS + archive test), K. De Schepper 95/09 (also update NS-DB "volgnummer effect"), P. Verbeek 96/03 (Y2K), B. Hannes 96/10 (VMGDIFCS → VMGDIFCX) (L13-27). `CBL NOSQL`. |
- L16: | DB2 | `DB2 Manual converted Programs/VMDZ1593.cbl` (579 lines). Anuja Dhuri, February 2026 (seq 000031-000040). `CBL ARITH(EXTEND)`. Legacy history dropped. |
- L17: | Pairing | Legacy header "BCI COUPONS : MAJ DATE DE COMPTABILISATION DANS LE FORM. C" (L10) = DB2 header "BCI COUPONS: UPDATE ACCOUNTING DATE IN FORM C" (seq 000090); same skeleton (D-PROG / TRAIT / TRAIT-SUIT / TRAIT-EX / ACCEPT-DATE / LECT-FORMC / FILL-KY-VMBFC), Dutch archive comment L179-181 translated at seq 008512-008514, identical skip DISPLAY with `'PROD: 1002'` (L186 / seq 008523) [OBS]. **Confidence: High.** Number rule BZ590 → VMDZ1593 is not derivable (VMDZ1590 = VM1BD590) → pair by header (as VM1BZ250 → VMDZ1251). |
- L21: | IDMS access | Subschema VMBTS09, LR VMBTL09-R01 paths OB-VMBFC (VMBTS09.txt L210-215) and MO-VMBFC (L137-142); direct DML on FFRECAB (OBTAIN CALC / STORE / MODIFY / COMMIT / FINISH). READY AR-VMBFRM4, AR-VMBRFFB UPDATE (L257-258). |
- L24: | Completion | All paths analysed with full IF/MOVE diff (XPG-01). Not in workspace: VMDZ205I (assumed = VMBD205I layout, user decision), SQLERRWS, SQLERROR (Q-48). New questions Q-95..Q-98. |
- L55: | Kind | Legacy | DB2 |
- L67: | # | Legacy | Line | DB2 | Rule |
- L116: | Aspect | DB2 | Verdict |
- L127: | Situation | Legacy | DB2 | Equal? |
- L142: | LR request | Path (VMBTS09.txt) | Legacy statuses | DB2 |
- L153: | Legacy | Lines | DB2 | Verdict |

## Open / referenced COBOL-team questions

- `Q-48`
- `Q-95`
- `Q-98`
- `Q-76`
- `Q-29`
- `Q-97`
- `Q-96`

## Important report findings to preserve

- L177: | D-01 | Medium (conditional, Q-48) | seq 008531-008550 | Form not found with CT-OPD 96 and not old enough: legacy CALL USERABEN (L196); DB2 PERFORM SQLERROR while SQLCODE = +100. If SQLERROR returns on +100, the record is silently skipped and the run ends RC 0. Same pattern as VMDZ1620 D-01; sister VMDZ1583 (VM1BZ580 D-02) and VMDZ4260 seq 039200 even continue without SQLERROR. | DISPLAY legacy text + PERFORM 900-CALL-USERABEN (ERR-N620-1) |
- L178: | D-02 | Low (data-gated, Q-95) | seq 021200-021700, 023700-024200 | CT_RKTGDSC_479MBFC missing from probe and UPDATE WHERE. Legacy CALC key includes CT-RK-TGDSV = SPACES (L157), so only blank-RK rows match; DB2 matches any RK (would update a '1002' row legacy cannot find; -811 if two rows differ only by RK). Sister VMDZ1257 includes it (seq 047700). | add `AND CT_RKTGDSC_479MBFC = :DCLDZMBFCTV.CT-RKTGDSC-479MBFC` (spaces from seq 008361) (KEY-Z590-1) |
- L179: | D-03 | Low | seq 008522, 008531, 025100 | Messages changed: '* OB-VMBFC *' LR-STATUS → '* SELECT-VMBFC *' SQLCODE (signed binary display) on skip; '* OB-VMBFC *' → 'NO DATA FOUND FOR SELECT DZMBFCTV'; '* MO-VMBFC *' dropped on UPDATE failure | keep legacy texts with SQLCODE (MSG-N620-1, ERR-Z250-1) |
- L180: | D-04 | Low | seq 008811-008850 | DATE-01 incomplete: no `MOVE ZEROES` first (harmless, full 9(8) move) and no `99999999 → 99991231` branch | complete DATE-01 |
- L181: | D-05 | Info | seq 008505-008529 | 400-TRAIT-SUIT is PERFORMed but exits with `GO TO 200-TRAIT-EX` (outside its range); works on IBM COBOL (pending return never reached) but non-structured | set a skip flag and fall back to 200-TRAIT (PLAT-Z590-1) |
- L182: | D-06 | Info | seq 000500, 002000-004400, 018800-019500, 026600 | header cites DZBSICTB (not accessed); dead DA-YYMMDD/DA-DDMMCCYY; INSERT without QUERYNO; LEN 15 vs 1215; KY-RESTART written but truncated by LEN 15 | cosmetic |
- L183: | L-01 | Info (legacy) | L157, L174, L274 | key part CT-RK-TGDSV relies on INITIALIZE (TRAIT-SUIT has none; works because OBTAIN NOT-FND leaves VMBFC unchanged [INF]); '1002' MOVE commented | retain |
- L184: | L-02 | Info (legacy) | L242-251 | month −2 keeps the day (20260430 → 20260230): numeric compare only, harmless; no PARM validation; year window `> 60` | retain (Q-97) |

## Reusable rule IDs already present

- `XPG-01`
- `DATE-IND`
- `CPY-01`
- `PLAT-01`
- `PLAT-02`
- `LRO-01`
- `KEY-Z590-1`
- `LRM-01`
- `AUD-02`
- `LRS-Z590-1`
- `DSP-Z590-1`
- `RST-01`
- `RST-02`
- `RST-03`
- `RST-LR-01`
- `RST-10`
- `ERR-01`
- `CMT-01`
- `LRO-N170-1`
- `CNT-01`
- `DATE-04`
- `DATE-01`
- `ERR-03`
- `RST-LR-02`
- `PROC-01`
- `LRS-07`
- `CMT-N590-1`
- `ERR-N620-1`
- `MSG-N620-1`
- `ERR-Z250-1`
- `PLAT-Z590-1`
- `NAME-02`
- `NAME-03`
- `HLP-04`
- `LRM-Z580-1`
- `XPG-Z620-1`
- `KEY-N567-1`
- `PLAT-Z190-1`

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
