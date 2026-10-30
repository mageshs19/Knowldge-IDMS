# Gap / enhancement assessment — VM1BD590

- Source report: `IDMS Programs/VM1BD590.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L13: ## 1. Identity, scope and completion
- L17: | Legacy | `IDMS Programs/VM1BD590.cbl` (668 lines). M. Beevers 09/1986; Boogaerts 87-91; Wulteputte 91/07; Clement 92/94; Verbeek 96; Pomponio 97 (EURO2000, PARM 8 pos.); De Schepper 98; Boogaerts 2003 (integration); HOMAJ/IELEE 2010 (GEDMI03H, project 3312 DMS). |
- L18: | DB2 | `DB2 Manual converted Programs/VMDZ1590.cbl` (674 lines). JAINRG 2026/03 (seq 007310-007370). `CBL NOSQL` kept. |
- L22: | IDMS access | No DML in the program. Declaratives only (L91-93). All DB access through **VM9BD05T** (CALL-01). |
- L24: | Completion | Full line-by-line diff done (comments excluded). Not in workspace: VMDZ205I, VMDZ510B, VMDZ05, GEDMI03I/O, VM9BC50T source (Q-21: layouts identical). |
- L59: | Kind | Legacy | DB2 | Note |
- L72: | # | Legacy | Line | DB2 | Verdict |
- L105: | Item | Legacy | DB2 | Verdict |
- L122: | Aspect | Legacy | DB2 |
- L135: | Situation | Legacy | DB2 | Equal? |
- L175: | Item | Legacy | DB2 | Verdict |
- L188: | Aspect | Legacy | DB2 |

## Open / referenced COBOL-team questions

- `Q-21`
- `Q-27`
- `Q-20`
- `Q-17`
- `Q-39`
- `Q-26`
- `Q-40`

## Important report findings to preserve

- L202: | D-03 | Low | seq 028600-029400, 031200-031800 | VMDZ905T OPEN/CLOSE calls and RC checks commented. Neutral today (callee no-op) but deviates from sister VMDZ1510/1573 and would miss a restored OPEN validation (Q-26). | keep calls (CALL-03) |
- L203: | D-04 | Medium (callee) | VMDZ905T seq 066600-068100 | COUNT(*) never gives 100 → legacy '03' (EFF without events) becomes '00'. Also affects VMDZ1510. | test `WS-COUNT-EVEF = 0` → '03' (LRO-N590-1); Q-40 |
- L204: | D-05 | Info | seq 007340, 007360 | change log says `VMBD205I -> VMBD205I` and `VMDZ905T -> VMDZ905T` (should be VMDZ205I and VM9BD05T → VMDZ905T) | comment only |
- L205: | D-06 | Info | seq 039200-043100 | CONTR-110 and BC50 WS are dead code in DB2 but still renamed ('VMDZ1590') | resolved by D-02 fix |
- L206: | D-07 | Low (callee) | VMDZ905T seq 073100 | FETCH `WHEN OTHER` without SQLERROR/EOC → possible loop (X-01, VM1BD510 D-03) | callee |
- L207: | L-01 | Medium (legacy) | L520-522, L577-579 | abend condition is always false; technical READ errors pass silently (= VM1BD510 D-01) | keep verbatim (ERR-04) |
- L208: | L-02 | Info (legacy) | L550, L330-356 | paragraph name and header table advertise 412/414/431/432 (and 240/310-320/416); only 411 and 413 are coded | none |
- L209: | L-03 | Info (legacy) | L447-463, L482-498 | CONTR-210 and CONTR-220 share one GEDMI03H cache key (GEDM-OLD-CI); cache is defeated whenever CIO ≠ CIW (performance only); RC test outside the IF reuses the cached result by design | none |
- L224: | T-03 | Old NR-ST-FORM-AS not in DB | ANOMALIE 411 sev 2; not routed | routed to 4 outputs, no anomaly — **FAIL D-01** |
- L225: | T-04 | Old security destroyed (event 0168), STCIRC '1' | 413 reject | routed — **FAIL D-01** |
- L226: | T-05 | New NR-STNEW already in DB, STCIRC '1' | 410 signal + routed | routed without 410 — **FAIL D-01** |
- L227: | T-06 | NS-CPAID-GDIFRV < NX-CPAID | 711 reject | routed — **FAIL D-01** |
- L228: | T-07 | NS-CPAID + 1 < NX-CPCRE / CPAID > NX-CPAID with STCIRC '9' | 720 reject / 712 signal | no anomaly — **FAIL D-01** |
- L229: | T-08 | Issue unknown to VM9BC50T | USERABEN | continues — **FAIL D-02** |
- L234: | T-13 | After D-01 fix: EFF row without EVEF, STCIRC '1' | RETKODE '03': no 410/7XX | '00': 410 + 7XX evaluated — **FAIL D-04** |

## Reusable rule IDs already present

- `PLAT-01`
- `RST-08`
- `HLP-08`
- `DATE-IND`
- `DATE-YMD8`
- `CPY-01`
- `HLP-06`
- `NAME-03`
- `ERR-CODE`
- `DATE-YMD`
- `DATE-04`
- `DATE-05`
- `CNT-01`
- `ORD-01`
- `ERR-04`
- `MSG-01`
- `DATE-01`
- `LRO-N590-1`
- `CMT-01`
- `CMT-N590-1`
- `AUD-01`
- `XPG-01`
- `RST-01`

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
