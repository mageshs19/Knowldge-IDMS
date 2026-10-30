# Gap / enhancement assessment — VM1BZ580

- Source report: `IDMS Programs/VM1BZ580.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L9: ## 1. Identity, scope and completion
- L13: | Legacy | `IDMS Programs/VM1BZ580.cbl`. J-M Boogaerts 14-11-86 (L6-L7); 90/05 commit every 100 (L13-L14); J. Clement 93/11 input VMGDIFC→VMGDIFCS (L16-L17); B. Hannes 96/10 → VMGDIFCX (L19-L20); P. D'Angelo 05/07 "MOD-CLE-EVCP SI MEP+ ET DA-CR-GDIFC =" (L22-L23). `CBL NOSQL` (L1). |
- L14: | DB2 | `DB2 Manual converted Programs/VMDZ1583.cbl`. A. Dhuri, February 2026 (seq 000031-000040). `CBL ARITH(EXTEND)`. Legacy history dropped. |
- L15: | Pairing | Legacy L10 "MAJ EVENEMENTS SUR COUPONS ENREG PAIEMENTS DE COUPONS" = DB2 seq 000080 "UPDATE EVENTS ON COUPONS REGISTRATION OF COUPON PAYMENTS". Same FD PAIEMENT-ACC/DD010 1200 bytes, same paragraphs (TRAIT-COUPONS, MOD-CLE-EVCP(-2), MOD-EVCP), same `CO-STCIRC-OORD = '9'` dispatch and cause list. **Confidence: high** [OBS]. |
- L19: | IDMS access | Subschema VMBTS09, LR VMBTL09-R01 (VMBTS09.txt L84-L91), paths OB-VMBCOUP-VMBEVCP (FIRST ×2, NEXT ×2) and MO-VMBEVCP (×2). FFRECAB DML. `COPY IDMS SUBSCHEMA-BINDS` (L182, unlike the explicit BINDs of VM1BZ140). READY AR-VMBCOUP / AR-VMBRFFB UPDATE (L183-L184). |
- L22: | Completion | All paths diffed line by line (XPG-01). Open: Q-91..Q-94 (new), Q-17, Q-29, Q-30, Q-48, Q-64. Not in workspace: VMDZ205I, SQLERRWS, SQLERROR (CPY-01 / Q-21 assumed). |
- L53: | Kind | Legacy | DB2 |
- L62: | # | Legacy verb | Line | DB2 | Rule |
- L126: | Aspect | DB2 | Verdict |
- L137: | Situation | Legacy | DB2 | Equal? |
- L155: | LR request | Path | Legacy statuses → action | DB2 |
- L172: | Aspect | Legacy | DB2 |

## Open / referenced COBOL-team questions

- `Q-91`
- `Q-94`
- `Q-17`
- `Q-29`
- `Q-30`
- `Q-48`
- `Q-64`
- `Q-21`
- `Q-92`
- `Q-93`
- `Q-25`

## Important report findings to preserve

- L188: | D-03 | Medium | 830 seq 033600-033700 | First-match search uses `ORDER BY NR_ID DESC` → links the payment to the **newest** free '0060' event; legacy takes the first in set order (ORDER not printed). Differs only when a coupon has ≥ 2 free matching events (DA_CRAEVPR, NR_CI land on another event). | ORDER BY NR_ID in set direction once Q-17/Q-92 answered (ORD-01) |
- L189: | D-04 | Low | 710 seq 015500-015700 | restart skip loop without EOF guard (legacy guarded, L301) | `UNTIL VMDZFINI-EOF` guard |
- L190: | D-05 | Low | seq 040800 vs 016800 | LEN 15 at checkpoint, 1215 at insert: KY-RESTART truncated (unused on restart) | 1215 |
- L191: | D-06 | Low | seq 007600-007800, 008370-008390 | input DA-CR-GDIFC: only 0/spaces → 0001-01-01; no 99999999 → 9999-12-31, no validity check → -180/-181 abend where legacy stores the raw value [INF] | shared DATE-01 routine (DATE-03, Q-64) |
- L192: | D-07 | Low | seq 034400-034700, 030500, 039200 | legacy DISPLAY texts '* OBTAIN  OB-VMBCOUP-VMBEVCP *' / '* MODIFY MO-VMBEVCP *' + status replaced by 'ERROR REC NUMBER'; abend via SQLERROR instead of CALL USERABEN | keep texts + SQLCODE before SQLERROR (ERR-Z250-1, MSG-N620-1) |
- L193: | D-08 | Info | 820 seq 030300 | WS-NB-EVCP-UPD-I += 1 per searched UPDATE, which may change n rows (legacy has no counter) | `ADD SQLERRD(3)` (precedent VMDZ9900/9901/9902) |
- L194: | D-09 | Info | 810, 820, 900 | 810 probe redundant (UPDATE + SQLERRD(3) suffices), its ORDER BY/FETCH FIRST meaningless; 820/840 `WHEN 100` → SQLERROR unreachable; COMMIT leaves SQL-LOCATION 802 | hygiene |
- L195: | D-10 | Info | seq 000100-000700, 012600, 022300 | cloned KASBONS header claims DZCOUPTB parent table (not used); unconditional TIMESTAMP DISPLAY; positional `VALUES (:DCLDZ01RSTV)` | cosmetic |
- L196: | L-01 | Low (legacy) | L299-L302 → L140 | if NS-REC-FF-IN > records (changed input), skip loop hits EOF and D-PROG READs again past EOF without FILE STATUS → runtime error [INF] | retain |
- L214: | T-02 | **DATE-IND '0'**, any input | system date, normal run | **abend -180 on restart SELECT [INF] (FAIL D-01)** |
- L215: | T-03 | DATE-IND '1', PARM year 99 (1999) | runs | same failure as T-02 (D-01) |
- L222: | T-10 | STCIRC 9, coupon missing or without events | USERABEN | silent continue (**FAIL D-02**) |

## Reusable rule IDs already present

- `XPG-01`
- `CPY-01`
- `DATE-IND`
- `PLAT-01`
- `NAME-03`
- `PLAT-02`
- `LRM-Z580-1`
- `LRM-01`
- `LRO-Z580-1`
- `ORD-01`
- `LRO-Z570-1`
- `RST-LR-01`
- `RST-10`
- `ERR-01`
- `DATE-04`
- `HLP-06`
- `KEY-N567-1`
- `DATE-02`
- `AUD-02`
- `AUD-N140-1`
- `CNT-01`
- `DATE-01`
- `AUD-01`
- `HLP-10`
- `MSG-N620-1`
- `HLP-Z310-1`
- `PROC-01`
- `LRO-N595-1`
- `HLP-09`
- `RST-LR-02`
- `CMT-01`
- `CMT-N590-1`
- `RST-09`
- `DATE-05`
- `LRO-N015-1`
- `DATE-03`
- `ERR-Z250-1`
- `XPG-N575-1`
- `CNT-N140-1`
- `KEY-Z190-1`
- `DATE-Z310-1`
- `ERR-Z190-1`

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
