# Gap / enhancement assessment — VM1BZ260

- Source report: `IDMS Programs/VM1BZ260.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L10: ## 1. Identity, scope and completion
- L14: | Legacy | `IDMS Programs/VM1BZ260.cbl` (363 lines). P. Aelvoet (Dolmen) 17-11-86. Changes: Boogaerts 87/10, 88/02 (MEP+ file test), 88/06 (cancel all coupons from the first attached one); De Schepper 92/07; Hannes 96/10 (VMBD510Z→VMBD205X, VMBZCOUP→VMBZCOUX); Hugues 11/2000 (E836); Verstraeten 03/05 R2 (L10-23). `CBL NOSQL` (L1). |
- L15: | DB2 | `DB2 Manual converted Programs/VMDZ1263.cbl` (509 lines). V. Mahajan, no date. `CBL ARITH(EXTEND)`. Modification history dropped. |
- L19: | IDMS access | Subschema VMBTS09, LR VMBTL09-R01, path `OB-VMBCOUP-VMBEVCP` FIRST/NEXT (VMBTS09.txt L152-163). READY AR-VMBCOUP **RETRIEVAL** (L192). No FFRECAB, no update DML. |
- L23: | Completion | All paths analysed, with a full IF/MOVE diff against VM1BZ260 and VM1BZ250/VMDZ1251 (XPG-01). Not in workspace: VMDZ205I, VMDZMEPI, VMDZ05, SQLERRWS, SQLERROR, VMDZ905T source in this folder only (CPY-01 / Q-21, Q-61). New open questions: Q-79..Q-82. |
- L70: | Kind | Legacy | DB2 |
- L80: | # | Legacy | Line | DB2 | Rule |
- L134: | Aspect | DB2 | Verdict |
- L145: | Situation | Legacy | DB2 | Equal? |
- L161: | LR request | Path (VMBTS09.txt) | Legacy statuses used | DB2 |
- L182: | Item | Legacy | DB2 | Verdict |
- L192: There is no restart in the legacy program: no FFRECAB, no COMMIT, RETRIEVAL only (L192, L184). DB2 correctly has no DZ01RSTV template, so the team template facts (USERABEN on CO_ID_RS '1', LEN 15/143/1215, NB-READ skip loop, COMMIT every 100, CNT-01) do not apply. A rerun is a full rerun and recreates DD020 (JCL out of scope). Both versions are idempotent for the same input and DB state.

## Open / referenced COBOL-team questions

- `Q-21`
- `Q-61`
- `Q-79`
- `Q-82`
- `Q-31`
- `Q-65`
- `Q-17`
- `Q-62`
- `Q-48`
- `Q-40`
- `Q-60`
- `Q-80`
- `Q-25`
- `Q-81`

## Important report findings to preserve

- L199: | D-02 | Low | seq 016200, 022000, 038200 | DISPLAY prefix '##&&**VM1DZ260**' (neither legacy VM1BZ260 nor VMDZ1263). Unique to VMDZ1263 [OBS grep] | '##&&VMDZ1263 - …' (MSG-01) |
- L200: | D-03 | Info | seq 039800-044700 | SQL-LOCATION not set in SELECT-COUP / COUNT-EVCP; identical 'ERROR WHILE SELECT' text; no key DISPLAY | set location; display WS-KY-COUPON + NS-DB + TELLER |
- L201: | D-04 | Info | seq 012200-013300, 040000, 043900-044100, 045900 | redundant COUNT-EVCP (the first FETCH answers it), redundant NR_IDSTOCK in the SELECT, unneeded WITH HOLD and ORDER BY DESC, unreachable COUNT/OPEN `WHEN 100` | performance (ORD-N130-1, Q-82) |
- L202: | D-05 | Info | seq 034900-035000 | unconditional `MOVE AM-CNS-FORM-AS TO AM-CNS-COUPON` before the BTE IF (residue of VMDZ1251 seq 032100); both branches overwrite it | remove (harmless) |
- L203: | D-06 | Info | seq 007100, 009000, 019500, 037800 | SW004 / SAVECOUPON dead (also dead in legacy); `MOVE 0 TO TELLER`; commented debris; history header dropped; cols 1-6 seq duplicated | cosmetic |
- L204: | D-07 | Low | legacy L252-253, L354-358 | STOP1 and its texts ('##$$VM1BZ260   STOP1', 'NOT-FOUND  BIJ DE EERSTE LEZING ', LR-STATUS) dropped → generic 'ERROR WHILE SELECT' + SQLERROR. STOP1 is probably pre-empted by AUTOSTATUS [INF], but the team rule keeps the texts. Same in VMDZ1251 (VM1BZ250 D-02) | DISPLAY '##$$VMDZ1263   STOP1' + legacy text + SQLCODE before SQLERROR (ERR-Z250-1, MSG-N620-1) |
- L205: | L-01 | Low (legacy) | L303-306 | NR-ID-040SECU / NS-SEQ-040IRMO / DA-UB-FORM-AS come from VMBZMEP = the **current** DD015 record. That record matches the coupon only when TELLER1 was seeded by a match. Otherwise it is the next MEP+ record (another coupon), or the last record read before EOF (only NR-ST is set to the sentinel). Retained in DB2 (seq 033200-033700) | retain; Q-80 |
- L206: | L-02 | Low (legacy) | L275-278, L284-291 | On NO-VMBEVCP-FND the walk runs once on the stale VMBEVCP area (previous coupon's last event). Termination depends on how LRF answers OBTAIN NEXT after a non-iterated path [UNK]; a non-'NO-MORE-VMBEVCP' answer means an endless loop | retain/flag; Q-79 |
- L230: | T-08 | coupon exists, **empty** event set, MEP+ match | AM = AM-INTGR (+ stale pass) | AM = MEP+ amount → **FAIL D-01** |
- L237: | T-15 | VMDZ905T OPEN fails | DISPLAY 'VM1BZ260' + USERABEN | DISPLAY 'VM1DZ260' (D-02) + USERABEN |

## Reusable rule IDs already present

- `XPG-01`
- `CPY-01`
- `SEQ-040IRMO`
- `DATE-IND`
- `DATE-PARM`
- `DATE-YMD`
- `DATE-DMY`
- `DATE-Y`
- `DATE-Y1`
- `PLAT-01`
- `PLAT-02`
- `LRO-01`
- `LRO-N130-1`
- `LRO-N590-1`
- `ERR-01`
- `LRS-Z250-1`
- `DSP-Z250-1`
- `DATE-04`
- `HLP-06`
- `KEY-N567-1`
- `DSP-02`
- `LRS-03`
- `SEQ-01`
- `LRO-N170-1`
- `CNT-01`
- `ORD-N130-1`
- `ORD-01`
- `ERR-Z250-1`
- `ERR-N130-1`
- `MSG-01`
- `PROC-01`
- `CMT-01`
- `CMT-N590-1`
- `DSP-N015-1`
- `MSG-N620-1`
- `NAME-03`
- `LRO-N015-1`
- `RST-08`
- `XPG-N575-1`
- `AUD-01`
- `LRO-02`
- `DATE-05`
- `XPG-Z260-1`
- `LRO-Z260-1`

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
