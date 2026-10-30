# Gap / enhancement assessment — VM1BZ130

- Source report: `IDMS Programs/VM1BZ130.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L13: ## 1. Identity, scope and completion
- L17: | Legacy | `IDMS Programs/VM1BZ130.cbl` (261 lines). P. Aelvoet (Dolmen) 15-10-86. Changes: Boogaerts 90/02 (early repayments, code 91); De Schepper 93/09 (IDMS-RECORDS MANUAL); Hannes 96/10 (EURO, MMBZCOUP → VMBZCOUX); **Verstraeten 03/05 "R2"**: W-CV relaid out and the 99 rule changed (L13-21, L110-117, L181-183, L227-230). |
- L18: | DB2 | `DB2 Manual converted Programs/VMDZ1130.cbl` (462 lines). V. Mahajan, April 2026. `CBL ARITH(EXTEND)` (seq 000100). The header drops the legacy modification history. |
- L22: | IDMS access | Subschema **VMBTS09**. LR **VMBTL09-R01**, path `OB-VMBCOUP-VMBEVCP` (FIRST/NEXT). Single area AR-VMBCOUP, READY **RETRIEVAL** (L147). No FFRECAB, no direct DML. |
- L25: | Completion | All paths analysed, with a full IF/MOVE diff (XPG-01). Not in workspace: VMDZMEPI, SQLERRWS, SQLERROR (CPY-01 / Q-21, Q-61). New open questions: Q-59..Q-62. |
- L78: | Kind | Legacy | DB2 |
- L91: | # | Legacy | Line | DB2 | Rule |
- L149: | Aspect | DB2 | Verdict |
- L161: | Situation | Legacy | DB2 | Equal? |
- L180: | LR request | Path (VMBTS09.txt L152-163) | Legacy statuses | DB2 |
- L192: | Legacy | Lines | DB2 | Verdict |
- L206: There is no restart in the legacy program: no FFRECAB, no COMMIT, a RETRIEVAL run-unit [OBS L147, L167]. DB2 correctly omits the DZ01RSTV template. The team-wide template facts (V-01 rerun abend, LEN 1215/15, NB-READ positioning, CNT-01) do **not** apply. Rerun = full rerun from record 1, and the outputs are recreated (JCL out of scope). Both versions are idempotent.

## Open / referenced COBOL-team questions

- `Q-21`
- `Q-61`
- `Q-59`
- `Q-62`
- `Q-31`
- `Q-17`
- `Q-60`
- `Q-48`

## Important report findings to preserve

- L215: | D-02 | Medium (conditional, Q-59) | seq 025700-027100 | The legacy compares the raw X(8) DA-UBSECIS-STOCK with the input DA-UB-FORM-AS. DB2 rebuilds it from a DATE. A legacy value of spaces (or any non-date) that was migrated to 0001-01-01 comes back as '00000000' → op-97 MEP routed to DD040 (reject) instead of DD030. | reverse mapping must restore the legacy storage form (**DATE-N130-1**) |
- L216: | D-03 | Low | seq 024800-027000 with SQLCODE 100 | After INITIALIZE, DA_UBSECSK = spaces → WHEN OTHER moves PIC 9 fields that contain spaces → W-CV3 undefined [INF] | guard the conversion on SQLCODE 0 |
- L217: | D-04 | Low | SELECT-COUP seq 034900-037600 | no `MOVE … TO SQL-LOCATION`; SQLERROR reports the previous location (2300); message has no key | set the location; DISPLAY the key |
- L218: | D-05 | Info | seq 014900-018200 | 24 columns fetched, 3 used; needless ORDER BY DESC and WITH HOLD (compare VMDZ4425, 2 columns) | select the 3 columns (ORD-N130-1) |
- L219: | D-06 | Info | seq 010000, 011200-012000, 013000, 025800, 039000 | unused USERABEN; dead date helpers; `02` level under `03` siblings (template); `MOVE '00.00.0000' TO DA-CCYYMMDD-R` truncates 10→8 (overwritten anyway); OPEN `WHEN 100` unreachable; cols 1-6 seq 027400 duplicated (physical L275-276), later seqs off by 100 | cosmetic / renumber |
- L220: | D-07 | Info | seq 019100, 021500 | STOP RUN inside F-TRAIT, so the main-line STOP RUN is unreachable. The legacy modification history was dropped from the header. | keep the legacy structure |
- L221: | D-08 | Info | seq 043700 | WS-KY-COUPON shows only the 13-digit stock number, not NS-DB / NS-ID | display all 4 key cols |
- L222: | L-01 | Low (legacy) | L179-183 | on VMBCOUP-NOT-FND, W-MT/W-CV take stale values from the previous coupon (first coupon: AM 0 per L154, GR-IDISSU-STOCK uninitialised) [INF] | retain; flag (Q-60) |
- L246: | T-07 | as T-05, DA-UBSECIS-STOCK = spaces in IDMS, input DA-UB = spaces | DD030 | DD040 (**FAIL D-02** if migrated to 0001-01-01) |
- L252: | T-13 | FETCH returns −911 | abend (autostatus analogue) | loop / no abend (**FAIL D-01**) |

## Reusable rule IDs already present

- `XPG-01`
- `CPY-01`
- `SEQ-IRMO`
- `DSP-02`
- `SEQ-040IRMO`
- `PLAT-01`
- `PLAT-02`
- `LRO-01`
- `LRO-N130-1`
- `ERR-01`
- `HLP-06`
- `NAME-02`
- `DATE-01`
- `SEQ-01`
- `CNT-01`
- `ORD-01`
- `ORD-N130-1`
- `MSG-01`
- `PROC-01`
- `LRO-02`
- `LRO-N595-1`
- `CMT-01`
- `CMT-N590-1`
- `ERR-03`
- `ERR-N130-1`
- `DATE-N130-1`
- `NAME-03`
- `DATE-03`
- `XPG-N575-1`
- `AUD-01`
- `DATE-04`

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
