# Gap / enhancement assessment — VM4BZ260

- Source report: `IDMS Programs/VM4BZ260.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L9: > **Pairing.** Legacy L8-9 "ARCHIVAGE D.B. FORMULAIRES C : ERASE DES FORM C ARCHIVES (PAR CI/DI)" = VMDZ4260 seq 001100-001200 "D.B. ARCHIVING FORMS C: DELETION OF ARCHIVED FORMS C (PAR CI/DI)" (exact translation, "(PAR CI/DI)" kept verbatim). The pair also shares FD FCARCH DD010 35 bytes, the REC-FCARCH layout incl. FC-DBKEY, PARAM-DATONLY and the D-PROG / TRAIT / READ-FCARCH / F-PROG skeleton. Number rule holds (BZ260 → 4260; VMDZ1263 = VM1BZ260). **Confidence: High.**
- L11: ## 1. Identity, scope and completion
- L15: | Legacy | `IDMS Programs/VM4BZ260.cbl`, 339 lines. J-M Boogaerts 89/05; Thyssen 92/10 (FFRECAB restart); De Schepper 94/03 "ERASE per form line, line by line; **VMBSIC stays on the DB**"; Tavernier 05/03 "new archiving" (L6-17) [OBS] |
- L16: | DB2 | `DB2 Manual converted Programs/VMDZ4260.cbl`, 490 lines. A. Dhuri, March 2026. `CBL ARITH(EXTEND)`. Restart skeleton later cloned into VMDZ4306 [OBS VM4BD306 report] |
- L20: | IDMS access | **Direct DML only** (no LR call although VMBTS09 has ER-VMBFC). `PROTOCOL MODE IS BATCH DEBUG`, `IDMS-RECORDS MANUAL` (L28-29, no AUTOSTATUS → explicit `PERFORM IDMS-STATUS`); `DB VMBTS09` (L45); BIND RUN-UNIT / VMBFC / VMBSIC / FFRECAB (L146-153); READY AR-VMBFRM4, AR-VMBRFFB UPDATE (L154-157) |
- L23: | Completion | All 339 legacy lines and all DB2 paragraphs traced; full IF/MOVE/PERFORM diff (XPG-01). Not in workspace: FCARCH builder step (35-byte file from VM4BZ200 350-byte FORMC), SQLERROR/SQLERRWS. New questions Q-139..Q-142 |
- L60: | Kind | Legacy | DB2 |
- L109: | 77 HERSTART-SW, GEVONDEN-SW (L50-53) | removed (SQLCODE 0/100 in 700) | OK; GEVONDEN-SW dead in legacy |
- L124: | Aspect | Legacy | DB2 | Verdict |
- L134: | Situation | Legacy | DB2 | Equal? |
- L153: | Element | Legacy | DB2 |
- L174: | Aspect | Legacy | DB2 |

## Open / referenced COBOL-team questions

- `Q-139`
- `Q-142`
- `Q-140`
- `Q-48`
- `Q-141`
- `Q-17`
- `Q-29`

## Important report findings to preserve

- L195: | D-02 | Low | seq 029700 | NB_DAY_RS 7 vs legacy NB-DAY-FF 5 (L181; only legacy with 5 [OBS grep]). Other conversions carry non-7 legacy values (VMDZ1250/1252/1526 15, VMDZ7245 90) | 5 (Q-142) |
- L196: | D-03 | Low | seq 039200-039370, 042200-042410 | 3 legacy messages 'VMBFC ci di da NIET GEVONDEN (1/2/3)' merged into 'ERROR REC NUMBER' + 'NO DATA FOUND FOR SELECT DZMBFCTV' + signed packed / DD.MM.CCYY values; word "ERROR" on a normal case (MSG-N620-1). Distinct causes not separable without extra probes | keep one legacy text 'VMBFC … NIET GEVONDEN' (cause indistinguishable by design) |
- L197: | D-04 | Low | seq 044700 vs 029800 | TE-CH-RS-DATA-LEN 15 at commit, 50 at insert: KY-RESTART truncated, NB-READ intact → no functional effect (shared template) | 50 |
- L198: | D-05 | Info | seq 037900-038700 | probe SELECT redundant (DELETE alone gives 0/+100); ORDER BY on equality column NR_ID_479MBFC cloned from VMDZ4200 cursor; 2 SQL per input | fold into DELETE (DML-W4260-1, LRM-01-b analog) |
- L199: | D-06 | Info | seq 042100, 023700 | WS-NB-MBFC-DEL-I counts statements (forms) not rows (no SQLERRD(3), cf. VMDZ9900 seq 036303); not restored on restart | label or ADD SQLERRD(3) |
- L200: | D-07 | Info | seq 042200-042410 | DELETE +100 after probe 0 → message 'NOT FOUND (2)' reuses legacy "(2)" with another meaning; unreachable [INF] | cosmetic |
- L206: | L-01 | Low | L60, L195, L214, L224 | COMMIT-TELLER counts inputs **and** erases; checkpoint test only inside VERNIETIG → a run of not-found inputs never commits; S9(3) COMP-3 wraps after 999 without SIZE ERROR [INF]. Restart stays correct (absolute TELLER-INPUT − 1) | template per-100-input cadence (RST-10) |
- L207: | L-02 | Info | L227, L218-221 | checkpoint = TELLER-INPUT − 1 forces reprocessing of the in-flight form; by design, relies on ZOEK fallback | not needed (RST-W4260-1) |
- L208: | L-03 | Info | L38, L41, L65-74 | FD 35 bytes vs REC-FCARCH 40: FC-DA-CPTA-HIGH half beyond the record (spaces); unused | identical |

## Reusable rule IDs already present

- `LRS-08`
- `XPG-01`
- `DATE-IND`
- `DATE-YMD`
- `DATE-DMY`
- `DATE-YMD8`
- `KEY-VMBFC`
- `DATE-01`
- `PLAT-01`
- `PLAT-02`
- `RST-01`
- `RST-02`
- `RST-07`
- `RST-04`
- `LRO-01`
- `KEY-W4260-1`
- `RST-03`
- `RST-05`
- `RST-LR-01`
- `RST-W4260-1`
- `RST-06`
- `RST-10`
- `ERR-01`
- `ERR-03`
- `DATE-04`
- `AUD-01`
- `LRO-N170-1`
- `CNT-01`
- `DATE-DMY8`
- `DATE-V4302-1`
- `ERR-02`
- `NAME-03`
- `XPG-Z620-1`
- `DATE-Z310-1`
- `PROC-01`
- `CMT-01`
- `CMT-N590-1`
- `DATE-05`
- `ERR-N170-1`
- `RST-09`
- `RST-V4306-2`
- `RST-N567-1`
- `RST-N625-1`
- `RST-Z620-1`
- `KEY-Z590-1`
- `MSG-N620-1`
- `LRM-01`
- `XPG-N575-1`
- `DSP-Z250-1`
- `ERR-N130-1`
- `RST-V4306-1`
- `ORD-01`

## Concepts this program must contribute to

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
