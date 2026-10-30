# Gap / enhancement assessment — VM1BZ015

- Source report: `IDMS Programs/VM1BZ015.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L11: ## 1. Identity, scope and completion
- L15: | Legacy | `IDMS Programs/VM1BZ015.cbl` (292 lines). J. Theuwissen (Dolmen), 26-09-2003. `CBL NOSQL`. |
- L16: | DB2 | `DB2 Manual converted Programs/VMDZ1015.cbl` (637 lines). V. Mahajan, April 2026. `CBL ARITH(EXTEND)`. |
- L20: | IDMS access | Subschema **VMBTS09**, LR **VMBTL09-R01**, path `OB-VMBCOUP-VMBEVCP` only. `READY AR-VMBCOUP USAGE-MODE IS RETRIEVAL` (L135). |
- L23: | Completion | All paths analysed. Open: Q-17-style order (Q-55), Q-48, Q-55..Q-58. |
- L68: | Kind | Legacy | DB2 |
- L82: | # | Legacy | Line | DB2 | Rule |
- L148: | Aspect | DB2 | Verdict |
- L160: | Situation | Legacy | DB2 | Equal? |
- L181: | Legacy status | Meaning | DB2 |
- L238: | # | Input / DB state | Legacy | DB2 |

## Open / referenced COBOL-team questions

- `Q-17`
- `Q-55`
- `Q-48`
- `Q-58`
- `Q-31`
- `Q-56`
- `Q-57`
- `Q-22`
- `Q-47`
- `Q-21`
- `Q-02`

## Important report findings to preserve

- L217: | D-05 | Low | COUNT-COUP/EVCP seq 052600-057100 | no `MOVE … TO SQL-LOCATION`; both say 'ERROR WHILE SELECT' → SQLERROR shows stale location | set 460/484 |
- L218: | D-06 | Low [INF] | seq 049000 | NR-USER-COUPON X(8) ← NR_USERID CHAR(8); legacy moves NR-RK-USER-ID X(5) + 3 spaces. Differs if migrated FILLER bytes are not blank | move first 5 bytes (Q-56) |
- L219: | D-07 | Low | seq 025200-025800, 030200-030800 | NS-DB-STOCK-FORM-AS (group) → NS-DB-TEMP 9(2) → COMP-3: non-numeric input gives invalid packed / -302 [INF]; legacy just gets VMBCOUP-NOT-FND | retain; document |
- L220: | D-08 | Low | seq 032600-033100, 033700-034200 | messages replaced ('NO MORE VMBEVCP RECORDS'); legacy markers '1-*-'/'2-*-'/'3-*-' and LR-STATUS lost | MSG-N620-1 |
- L221: | D-09 | Info | seq 016600, 022800, 005000 | WITH HOLD unneeded; timestamp helper + CS-PROGRAM unused; 2nd walk omits `INITIALIZE DCLDZEVCPTV` (harmless) | cosmetic |
- L222: | L-01 | Info (legacy) | L160, L231 | NO-VMBEVCP-FND not handled → abend; L231 is unreachable anyway (after the P200 loop only NO-MORE or error) | retain |
- L223: | L-02 | Info (legacy) | L114-125, L65 | DATE-IND / DATE-YMD8 computed, never used; IND unused | retain (dead) |
- L224: | L-03 | Low (legacy) | L238 | WS-NS-ID-COUPON 9(3) `ADD 1` wraps 999 → 000 without SIZE ERROR; same in DB2 seq 037500 | retain |
- L225: | L-04 | Info (legacy) | L171-176 | NR-STNEW test lists ZEROES, 0 and '0000000000000' (redundant) and LOW-VALUES on a 9(13) | retained verbatim (OK) |
- L232: | V-04 | O-FILE record order within a coupon follows NR_ID DESC (Q-55). |
- L244: | T-05 | coupon r missing, OPD 41, NR-STNEW coupon r present | new-stock records written | **none (D-01 FAIL)** |
- L246: | T-07 | coupon r ok, r+1 present without events, r+2 ok | abend at r+1 | continues, extracts r+2 (**D-03 FAIL**) |
- L247: | T-08 | FETCH negative SQLCODE (e.g. -904) | abend | **endless loop (D-02 FAIL)** |

## Reusable rule IDs already present

- `XPG-01`
- `RST-08`
- `CPY-N015-1`
- `DATE-IND`
- `DATE-PARM`
- `DATE-YMD8`
- `CPY-01`
- `SEQ-040IRMO`
- `PLAT-01`
- `PLAT-02`
- `LRO-N015-1`
- `LRO-N590-1`
- `ERR-01`
- `HLP-06`
- `KEY-N567-1`
- `DATE-N015-1`
- `ORD-01`
- `DATE-YMD6`
- `DATE-04`
- `CNT-01`
- `HLP-08`
- `LRO-02`
- `MSG-N620-1`
- `PROC-01`
- `CMT-N590-1`
- `DSP-N015-1`
- `ERR-03`
- `ERR-N620-1`
- `NAME-03`
- `CMT-01`
- `XPG-N575-1`
- `LRO-N130-1`
- `ERR-N130-1`
- `DATE-01`
- `DATE-N130-1`

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
