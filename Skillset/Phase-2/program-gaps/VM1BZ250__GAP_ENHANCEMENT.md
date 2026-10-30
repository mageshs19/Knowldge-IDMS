# Gap / enhancement assessment — VM1BZ250

- Source report: `IDMS Programs/VM1BZ250.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L10: ## 1. Identity, scope and completion
- L14: | Legacy | `IDMS Programs/VM1BZ250.cbl` (306 lines). P. Aelvoet (Dolmen); Boogaerts 87/10, 88/02 (MEP+ file test), 89/05; De Schepper 92/07 (SLIK), 93/09 (IDMS RECORDS MANUAL); Hannes 96/10 (VMBD510Z → VMBD205X, VMBZCOUP → VMBZCOUX); Verstraeten 03/05 R2 (L7-22). `CBL NOSQL` (L1). |
- L15: | DB2 | `DB2 Manual converted Programs/VMDZ1251.cbl` (451 lines). V. Mahajan, undated. `CBL ARITH(EXTEND)`. Header keeps only the function text; history dropped (seq 000700-001400). |
- L16: | Pairing | Identical header "CREATION DES MEP NEGATIVES POUR ANNULATIONS / DE SOUSCRIPTIONS" (L19-20 = seq 001100-001200) and identical paragraph skeleton [OBS]. **VMDZ1250 is NOT this program**: it is the conversion of VM1BD250 ("STOCKAGE FORMULAIRES VMBD : EFFECTEN", VM1BD250 L15; VMDZ1250 header "INSERT THE INPUT KASBONS DATA … 9 KASBONS TABLE", seq 001200-001500, Mahajan 09-12-25) [OBS]. The number rule VM1Bxnnn → VMDZ1nnn is ambiguous when BD and BZ share a number (also BZ260 → VMDZ1263, no VMDZ1260) → the engine must pair by header/skeleton, not by number [INF]. |
- L20: | IDMS access | Subschema VMBTS09, LR VMBTL09-R01, path `OB-VMBCOUP-VMBEVCP` FIRST/NEXT (VMBTS09.txt L152-163). READY AR-VMBCOUP **RETRIEVAL** (L171). No FFRECAB, no direct DML. |
- L23: | Completion | All paths analysed with full IF/MOVE diff (XPG-01). Not in workspace: VMDZ205I, VMDZMEPI, SQLERRWS, SQLERROR (CPY-01 / Q-61). New questions Q-75..Q-78. |
- L66: | Kind | Legacy | DB2 |
- L77: | # | Legacy | Line | DB2 | Rule |
- L134: | Aspect | DB2 | Verdict |
- L145: | Situation | Legacy | DB2 | Equal? |
- L162: | LR request | Path (VMBTS09.txt) | Legacy statuses | DB2 |
- L183: | Legacy | Lines | DB2 | Verdict |

## Open / referenced COBOL-team questions

- `Q-61`
- `Q-75`
- `Q-78`
- `Q-65`
- `Q-62`
- `Q-48`
- `Q-60`
- `Q-22`
- `Q-77`
- `Q-76`
- `Q-17`
- `Q-25`

## Important report findings to preserve

- L199: | D-01 | Low (conditional, Q-60) | seq 026500-027300 | Two legacy IFs (`NOT-FND/NO-EVCP AND TELLER1 = 0 → 9999`; `LR-FOUND → walk`) merged into IF/ELSE. ELSE also runs when the owner is missing and TELLER1 = 1: orphan DZEVCPTV rows are counted and AM-IND ← AM-INTCOUP = 0 (DCL INITIALIZEd, seq 022000). Legacy never walks without owner. Same condition in VMDZ1263 (seq 029100) [OBS]. | `IF SW-COUP-FOUND = 1 AND WS-COUNT-EVCP > 0` around OPEN…CLOSE, as a separate IF (LRO-N130-1, DSP-Z250-1) |
- L200: | D-02 | Low | 300-PROCESS / SELECT-COUP seq 035800-036000 | STOP1 removed: markers `'##$$VM1BZ250   STOP1'`, `'NOT-FOUND  BIJ DE EERSTE LEZING '` and status lost; generic 'ERROR WHILE SELECT'. VMDZ1310 keeps STOP01/02 renamed (seq 046100, 046500) (ERR-02); VMDZ1263 also drops STOP1 [OBS grep]. | DISPLAY `'##$$VMDZ1251   STOP1'` + legacy text + SQLCODE before SQLERROR (ERR-Z250-1, MSG-N620-1, Q-77) |
- L201: | D-03 | Low [INF] | seq 023200-023700 | NS-DB-STOCK-FORM-AS group → NS-DB-TEMP 9(2) → COMP-3: spaces/non-digits give an invalid packed host value (-302 or data exception); legacy just gets VMBCOUP-NOT-FND. Same as VM1BZ015 D-07. | retain; document (Q-76) |
- L202: | D-04 | Low | seq 033800-038700, 042400 | SELECT-COUP and COUNT-EVCP set no SQL-LOCATION and share the text 'ERROR WHILE SELECT'; FETCH OTHER has no DISPLAY; no key DISPLAY anywhere | set 331/355 locations, distinct texts, DISPLAY WS-KY-COUPON + NS-DB + TELLER (ERR-01) |
- L203: | D-05 | Info | seq 012200-013300, 024400, 040000, 038100, 034100 | ORDER BY DESC + WITH HOLD needless (ORD-N130-1); COUNT(*) redundant with the first FETCH; OPEN `WHEN 100` and COUNT `WHEN 100` unreachable; NR_IDSTOCK selected into its own key host var | simplify (optional) |
- L204: | D-06 | Info | seq 000700-001400, 018100, 026500-027800 | legacy history/R2 note dropped; duplicated seq 018100 + redundant `MOVE 0 TO TELLER`; `ELSE NEXT SENTENCE` inside a sentence that also holds an END-IF block (works, fragile for an engine: NEXT SENTENCE jumps past the whole sentence to `ADD 1` seq 027900) | cosmetic; engine must keep sentence boundaries verbatim |
- L205: | L-01 | Info (legacy) | L246 | `TELLER1 NOT EQUAL 0` also writes a negative MEP when the balance is negative (more non-positive events than free positive events) | retain (Q-75) |
- L206: | L-02 | Info (legacy) | L219-220, L258 | STOP1 likely unreachable under BATCH-AUTOSTATUS (LR-ERROR sets ERROR-STATUS → IDMS-STATUS abort first) [INF]; OBTAIN NEXT has no LR-ERROR test | retain |
- L229: | T-08 | as T-07 with orphan DZEVCPTV rows (2 cause-10) | TELLER1 1 → MEP, MEP+ amount | TELLER1 −1 → MEP with **AM 0** (**FAIL D-01** if no RI) |

## Reusable rule IDs already present

- `XPG-01`
- `CPY-01`
- `DATE-IND`
- `DATE-PARM`
- `LRS-Z250-1`
- `DATE-YMD`
- `DATE-DMY`
- `DATE-Y`
- `DATE-Y1`
- `DSP-02`
- `CPY-N015-1`
- `PLAT-01`
- `NAME-03`
- `PLAT-02`
- `LRO-01`
- `LRO-N130-1`
- `LRO-N590-1`
- `ERR-01`
- `ERR-03`
- `PLAT-N620-1`
- `DATE-04`
- `HLP-06`
- `KEY-N567-1`
- `SEQ-01`
- `ORD-N130-1`
- `LRO-N170-1`
- `SEQ-040IRMO`
- `CNT-01`
- `HLP-08`
- `ERR-N130-1`
- `ERR-N620-1`
- `PROC-01`
- `LRO-N595-1`
- `HLP-09`
- `DSP-Z250-1`
- `CMT-01`
- `CMT-N590-1`
- `RST-08`
- `ERR-02`
- `ERR-Z250-1`
- `MSG-N620-1`
- `LRO-N015-1`
- `XPG-N575-1`
- `AUD-01`
- `DATE-01`
- `ORD-01`

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
