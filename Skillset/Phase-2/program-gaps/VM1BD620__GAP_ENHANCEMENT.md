# Gap / enhancement assessment — VM1BD620

- Source report: `IDMS Programs/VM1BD620.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L11: ## 1. Identity, scope and completion
- L15: | Legacy | `IDMS Programs/VM1BD620.cbl` (247 lines). K. De Schepper; changes Thyssen (stock form vs security), Pomponio EURO2000 (8-pos PARM date), De Schepper (stock correction), J. De Schutter 08/2003 (VMBD510X → VMBD205I). `CBL NOSQL`. |
- L16: | DB2 | `DB2 Manual converted Programs/VMDZ1620.cbl` (617 lines). A. Dhuri, March 2026. `CBL ARITH(EXTEND)`. |
- L20: | IDMS access | Subschema VMBTS06, LR `VMBTL06-R01` paths `OB-DUP-VMBFAS` and `MODIFY-VMBFAS`; direct DML on FFRECAB (restart). READY AR-VMBFRM1 + AR-VMBRFFB UPDATE (L104-105). |
- L23: | Completion | All paths analysed. Open: Q-02 (SQLERROR), Q-29, Q-47, Q-48. |
- L54: | Kind | Legacy | DB2 |
- L66: | # | Legacy | Line | DB2 | Rule |
- L126: | Aspect | DB2 | Verdict |
- L139: | Situation | Legacy | DB2 | Equal? |
- L160: | LR request | Path (VMBTS06) | Legacy statuses | DB2 |
- L180: | Aspect | Legacy | DB2 |
- L218: | # | Input / DB state | Legacy | DB2 |

## Open / referenced COBOL-team questions

- `Q-02`
- `Q-29`
- `Q-47`
- `Q-48`

## Important report findings to preserve

- L197: | D-02 | Low | seq 023804-024304 | DA-CR key conversion lacks the DATE-01 `99999999 → 9999-12-31` branch: a 99999999 creation date gives '99.99.9999' → -180/-181 at OPEN (cf. VM1BD252 D-03) | full DATE-01 routine |
- L198: | D-03 | Low | 710 seq 039902; BEG-PROG seq 022500 | restart positioning without EOF guard (template); legacy is guarded | guard both reads |
- L199: | D-04 | Low | 900 seq 060102 vs 720 seq 041202 | TE-CH-RS-DATA-LEN 15 at commit, 1215 at insert (template) | 1215 |
- L200: | D-05 | Low | STOP-01 seq 057902-058505 | message translated ('FORMULIER NIET GEVONDEN' → 'FORM NOT FOUND'); LR-STATUS line replaced by NR_ID, no SQLCODE shown | keep legacy text, rename program only (MSG-N620-1) |
- L201: | D-06 | Info | seq 025704-025904 | post-loop STOP-01 guard is unreachable (FETCH 100 already stops) | drop or keep; no effect if SQLERROR abends |
- L202: | D-07 | Info | seq 020500 | legacy `GOBACK` (L93) → `STOP RUN`. Same effect for a JCL main program; VMDZ7200/7220/4230 keep GOBACK | keep GOBACK (PLAT-N620-1) |
- L203: | D-08 | Info | seq 017803, 051003, 049204, 054903 | WITH HOLD unneeded; 3 unused fetch columns; D-line typos '81O-OPEN', '840-UPDATE-DZFASCTV' cloned from VMDZ7240 | cosmetic |
- L204: | L-01 | Info (legacy) | L122-126, L225-228 | LR-ERROR also reported as "FORMULIER NIET GEVONDEN" | retain |
- L205: | L-02 | Low (legacy) | L98-101, L136 | PARM date never validated; garbage/blank date is stored in DA-CPTA-FORM-AS | retain; see V-04 |
- L221: | T-02 | non-stock, 2 duplicates | oldest (first in CALC dup chain) updated | lowest NR_ID updated, PASS if Q-47 holds |
- L229: | T-10 | DA-CREA = 99999999 | CALC lookup | -181 abend, **FAIL D-02** |
- L232: | T-13 | restart count > file records | clean end | read past EOF [INF], **FAIL D-03** |

## Reusable rule IDs already present

- `XPG-01`
- `DATE-DMY8`
- `DATE-IND`
- `DATE-YMD8`
- `CPY-01`
- `PLAT-01`
- `LRO-N620-1`
- `LRM-01`
- `AUD-02`
- `RST-LR-01`
- `RST-10`
- `ERR-01`
- `DATE-01`
- `HLP-04`
- `NAME-02`
- `DATE-YMD`
- `DATE-DMY`
- `CNT-01`
- `HLP-06`
- `ERR-03`
- `PROC-01`
- `DSP-02`
- `LRO-02`
- `CMT-01`
- `DATE-04`
- `ERR-02`
- `ERR-N620-1`
- `MSG-N620-1`
- `PLAT-N620-1`
- `PLAT-02`
- `NAME-03`
- `LRO-01`

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
