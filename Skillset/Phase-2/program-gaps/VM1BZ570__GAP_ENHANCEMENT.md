# Gap / enhancement assessment — VM1BZ570

- Source report: `IDMS Programs/VM1BZ570.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L9: > - Pairing: header "VERIFICATION DU PAIEMENT D'UN COUPON" = "COUPON PAYMENT VERIFICATION" (DB2 seq 001000). VMDZ1573 still DISPLAYs `'##&&VM1BZ570 - STOP NIVEAU CP **'` (seq 058900).
- L11: ## 1. Identity, scope and completion
- L15: | Legacy | `IDMS Programs/VM1BZ570.cbl`. J-M Boogaerts 25-10-86; 89/07 "TEST DOUBLES SUR CLE DU COUPON"; De Schepper 93/11 rewrite (COBOL II, VM9BDWA0, record 400, FORM-ACC-REMB), 94/04 (007), 94/08 (008/009), 98/02 (010), 98/07 (ZOEK-EFFECT); VHEML 2001 (BTE tolerance), 2006, 2007; HOMAJ/IELEE 2010 (GEDMI03H); HERMH 2011/11 (CI checked at DA-CREA, not today) (L28-L88). |
- L16: | DB2 | `DB2 Manual converted Programs/VMDZ1573.cbl`. V. Mahajan, 27-05-26. `CBL ARITH(EXTEND)` replaces `CBL NOSQL` (seq 000100). Header translated, legacy modification history dropped (seq 000900-002600). |
- L21: | IDMS access | Subschema VMBTS09, LR **VMBTL09-R01**, one path `OB-VMBCOUP-VMBEVCP` (FIRST ×3, NEXT ×4). AR-VMBCOUP READY RETRIEVAL (L344). Indirect access via VM9BD05T (VMBEFF/VMBEVEF). |
- L23: | Completion | Full diff of every IF/EVALUATE/MOVE/PERFORM done (XPG-01). Not in workspace: VMDZ205I, VMDZ05, SQLERRWS, SQLERROR, VM9BC50T/GEDMI03H/GE9RLEU1 sources (Q-21: layouts identical). |
- L69: | Kind | Legacy | DB2 | Note |
- L80: | # | Legacy | Line | DB2 | Verdict |
- L118: | Legacy | DB2 | Verdict |
- L139: | Aspect | DB2 | Verdict |
- L152: | Situation | Legacy | DB2 | Equal? |
- L186: | Item | Legacy | DB2 | Verdict |

## Open / referenced COBOL-team questions

- `Q-88`
- `Q-21`
- `Q-31`
- `Q-17`
- `Q-55`
- `Q-62`
- `Q-57`
- `Q-89`
- `Q-87`
- `Q-25`
- `Q-90`
- `Q-48`

## Important report findings to preserve

- L206: | D-05 | Low | 058900-059100 | STOP literal still `VM1BZ570`; DISPLAY status 'VMBEVCP-NOT-FND' is not a legacy status; `CALL 'USERABEN'` literal instead of the data-name (static link under NODYNAM [INF]). All 3 are unique among VMDZ* [OBS grep]. | 'VMDZ1573', `CALL USERABEN` (ERR-02, CALL-Z570-1) |
- L207: | D-06 | Low | 040100-040600, 029000 | FINISH became `STOP RUN` **before** `CLOSE FORM …`: CLOSE is dead (LE closes the files implicitly), and the main STOP RUN is unreachable. | STOP RUN after CLOSE (PLAT-N620-1) |
- L208: | D-07 | Info | 105500-110100 | COUNT paragraphs set no SQL-LOCATION (SQLERROR reports the stale 2100/2200/2300); `WHEN 100` after COUNT(*) is dead; abend DISPLAYs show no SQLCODE or key | MSG-N620-1 |
- L209: | D-08 | Info | 013100, 013300, 014600, 024100-025700 | dead WS (CREVPR, CRAEVPR, SW-COUP-NOT-FOUND); 17 columns fetched, 9 used; WITH HOLD unneeded | ORD-N130-1 hygiene |
- L210: | D-09 | Info | 000100, 000900-002600 | `CBL ARITH(EXTEND)` vs legacy `CBL NOSQL` (COMPUTE ROUNDED in TEST-CAPIT, L501-L511 [INF] same result for 15-digit operands); legacy modification history dropped | Q-89 |
- L211: | D-10 | Low (callee) | VMDZ905T | FETCH WHEN OTHER display-only (ERR-N130-1); '03' unreachable (LRO-N590-1). Output-neutral here: TEST-NOMINAAL tests only '02' (L545), so '03' and '00' both go to the nominal check | callee |
- L212: | L-01 | Medium (legacy) | L386-L387 | when TEST-CAPIT/TEST-NOMINAAL set status 1 (007/008/009), TRAIT overrides it to **2**: the form is **accepted** (TOONDER + FORM-OK) and carries the error code. FORM-ANOMAL only receives 001/002/003/004/019 and amount recycles. Retained verbatim (036200). | none (Q-87) |
- L213: | L-02 | Medium (legacy) | L598-L600 | VM9BD05T READ abend condition is always false (= VM1BD590 L-01) | ERR-04 |
- L214: | L-03 | Low (legacy) | L615, L726, L883 | `NO-VMBCOUP-FND` is not a path status; the real NO-VMBEVCP-FND abends via WHEN OTHER. DB2 reproduces the abend. | none (Q-57) |
- L235: | T-07 | two consecutive STCIRC 9 records, both matching | both accepted | 2nd → 019 ANOMAL (**FAIL D-02**) |
- L238: | T-10 | RANK 5, coupon 4 fully paid, coupon 5 has a free event | accepted (status 2) | 003 ANOMAL (**FAIL D-01**) |
- L240: | T-12 | free event DA-PAY > PARM date | 004; tries volgnr 2..99 → 004 ANOMAL | same if volgnrs 2..99 absent; **-502 abend** on the next record's OPEN (**FAIL D-04**) |

## Reusable rule IDs already present

- `XPG-01`
- `DATE-IND`
- `DATE-DMY8`
- `DATE-YMD8`
- `CPY-01`
- `NAME-03`
- `PLAT-01`
- `PLAT-02`
- `LRO-N015-1`
- `ERR-01`
- `HLP-06`
- `NAME-02`
- `DATE-N015-1`
- `DATE-02`
- `CNT-01`
- `LRO-N590-1`
- `ORD-N130-1`
- `ERR-CODE`
- `ORD-01`
- `LRO-Z570-1`
- `MSG-N620-1`
- `ERR-N130-1`
- `ERR-04`
- `ERR-02`
- `CMT-01`
- `CMT-N590-1`
- `AUD-01`
- `RST-08`
- `HLP-08`
- `KEY-Z570-1`
- `PLAT-N620-1`
- `DATE-01`
- `LRO-01`
- `LRO-N130-1`
- `ERR-03`
- `ERR-N620-1`
- `XPG-N575-1`
- `DSP-02`
- `RST-01`
- `ERR-CODE-GDIFC`

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
