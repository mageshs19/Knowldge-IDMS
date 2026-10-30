# Gap / enhancement assessment — VM4BD302

- Source report: `IDMS Programs/VM4BD302.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L9: > **Pairing.** Legacy header L7-8 "OPHALEN VAN EFFEKTEN MET EVENEMENTEN DIE TERUGBETAALD ZI[JN] 1 MAAND VOOR DE EINDVERVALDAG" = VMDZ4302 seq 000903-001003 "COLLECTION OF SECURITIES WITH REDEMPTION EVENTS … ONE MONTH PRIOR TO MATURITY". Also identical: DD010 40-byte input / DD005 90-byte output, INPUT-RECORD, VARIABLES names (SW-168, WS-DA-UE-MIN-1MAAND), CALL-VM9BC50T with key '2'. **Confidence: High.**
- L13: ## 1. Identity, scope and completion
- L17: | Legacy | `IDMS Programs/VM4BD302.cbl`, 337 lines. K. Wulteputte, Jan 1993 (L5, L25). Mods: 11/1997 + 01/1998 P. Verbeek (barema removed, EURO); 12/2004 N. Joris "adaptation de VM4OM003"; 2007/11 VHEML recompile P20 2767 (L10-22) [OBS] |
- L18: | DB2 | `DB2 Manual converted Programs/VMDZ4302.cbl`, 671 lines. A. Dhuri, April 2026. `CBL ARITH(EXTEND)`. Header lists DZWCEFTB → DZBEFFTB → DZEVEFTB, all SELECT (seq 001903-002303). Mod history dropped [OBS] |
- L21: | IDMS access | **Direct DML, no LRF**, manual status mode `PROTOCOL. MODE IS BATCH DEBUG`, `IDMS-RECORDS MANUAL` (L35-37). Subschema VMBTS07 (L58). BIND RUN-UNIT/VMBWCEF/VMBEFF/VMBEVEF + READY AR-VMBEFF1, AR-VMBWCEF RETRIEVAL, each with explicit status check → USERABEN (L180-215). `OBTAIN CALC VMBWCEF` (L243), set walks `OBTAIN FIRST/NEXT VMBEFF WITHIN VMBWCEF-VMBEFF` (L251, L277) and `VMBEVEF WITHIN VMBEFF-VMBEVEF` (L267, L319). Read-only, no FFRECAB, no COMMIT [OBS] |
- L24: | Completion | All paragraphs traced; full IF/MOVE diff legacy ↔ DB2 and DB2 ↔ sister VMDZ4300 (XPG-01). Not in workspace: SQLERRWS/SQLERROR (Q-48, Q-61), VM9BC50T source (Q-24), data-migration spec for NR_IDGOOD (Q-107) |
- L74: | Kind | Legacy | DB2 |
- L127: | Item | Legacy | DB2 | Verdict |
- L154: | Case | Legacy | DB2 | Verdict |
- L167: | Structure | Legacy | DB2 | Note |
- L216: | ID | Sev | Line | Finding | DB2 |
- L268: | **NAME-V4302-1** **NEW** | A legacy `MOVE '<literal>' TO PROGRAM-NAME` that differs from PROGRAM-ID (here 'VM9BD302') is not carried over: always use the DB2 program-ID constant; list the mismatch as a legacy defect. | all |

## Open / referenced COBOL-team questions

- `Q-48`
- `Q-61`
- `Q-24`
- `Q-107`
- `Q-17`
- `Q-111`
- `Q-113`
- `Q-62`
- `Q-114`
- `Q-110`
- `Q-112`
- `Q-86`

## Important report findings to preserve

- L206: | D-02 | Low | seq 048903-049103 | Added `= 00010101` guard (not in legacy, §1). Preserves legacy `> LAATSTE-DA` semantics only if zero transfer dates were migrated as 00010101; executes for **every** event type → zoned compare of non-0092 NR_IDGOOD bytes 9-16 (data-exception risk if non-numeric) [INF] | move inside the 0092 branch; keep only if Q-107 confirms the encoding |
- L207: | D-03 | Medium | seq 023980-024010 | DZBEFFC1 replaces an index-set walk with no ORDER BY → record order within an issue undefined; parallel-run byte compare of DD005 fails even with identical content. Unique to VMDZ4302 (only cursor on the WCEF FK) [OBS grep] | ORDER BY the 4 KY-EFFECT cols if the index is sorted (Q-111), else sign-off; LRO-V4302-1 |
- L208: | D-04 | Low | seq 024027 | DESC emulates an unknown set order (Q-17); affects UIT-NR-CI only in the §10 residual cases | Q-110, ORD-V4300-1 |
- L209: | D-05 | Low | seq 039404-040003 | Forward key-date block on unchecked VM9BC50T output: non-numeric or invalid date (e.g. MM 13) → DATE host var -180/-181 → SQLERROR abend, where legacy got 0326 + DISPLAY and continued. Spaces/zero → 0001-01-01 matches legacy only if migrated VMBWCEF spaces/zero keys became 0001-01-01 | Q-112; DATE-N130-1 |
- L210: | D-06 | Low | seq 130400-131100 | Not-found SYSOUT changed: legacy dumps the 40-byte VMBWCEF key record + 'ERROR-STATUS 0326' + blank line; DB2 prints an English text + 3 key lines (MSG-N620-1 deviation; SYSOUT only) | keep legacy lines, add SQLCODE |
- L211: | D-07 | Info | various | WITH HOLD unneeded; NR_ID fetched only for sort; 600-GET-TIMESTAMP DISPLAY-only; dead DA-YYMMDD/DA-DDMMCCYY; `02` level after `03`; WS-DZBFFSC1 typo; DZBEFFC1 END-EXEC no period; USERABEN unreferenced; seq wrap after 990003; mod history dropped; ≈257 k DZEVEFC1 OPEN/CLOSE pairs (index on FK assumed, cf. Q-86) | cosmetic / performance |
- L212: | D-08 | Info | seq 047303, 039903 | DATE-Z310-1 PASS but fragile: NEXT-EVEF zeroes DA-DD-MM-CCYY (kills '.') and restores it only through the full 10-byte DATE MOVE (seq 047603); VERWERK-EMISSIONS's MOVE CORR into it (seq 039903) relies on separators left by the previous paragraph (EUR format) | DATE-V4302-1 |
- L218: | L-01 | Low | L179 | `MOVE 'VM9BD302' TO PROGRAM-NAME` — literal ≠ PROGRAM-ID VM4BD302 (other legacy hits self-named [OBS grep]); run-unit statistics under a wrong name | 'VMDZ4302' (NAME-V4302-1) |
- L219: | L-02 | Medium | L254, L268 | Manual mode: any non-0000 status (deadlock, 0966, …) ends a walk silently → truncated extract with RC 0; L245-249 only DISPLAYs non-0326 errors | abend via SQLERROR (V-03) |
- L220: | L-03 | Low | L321-337 | VM9BC50T return code never tested (VM4BD300 L238 does) → unknown issue gives 0326 DISPLAY | identical |
- L221: | L-04 | Info | L240 | BC50O-NS-SEQ-IRMO 9(5) → NS-IRMO-STOCK 9(4) drops the high digit | identical |
- L223: | L-06 | Info | L270-271 | AM S9(13)V99 → S9(12)V9(6) high digit; LAATSTE-CI X6 → 9(6) | identical |
- L248: | T-08 | two past 0060, no 0092 | CI of first in set order | CI of highest NR_ID (D-04) |

## Reusable rule IDs already present

- `RST-08`
- `XPG-01`
- `DATE-IND`
- `SEQ-IRMO`
- `PLAT-01`
- `PLAT-02`
- `LRO-N130-1`
- `KEY-N567-1`
- `LRO-V4302-1`
- `ERR-V4302-1`
- `ORD-01`
- `ERR-03`
- `DATE-04`
- `DATE-01`
- `DATE-N130-1`
- `HLP-06`
- `CNT-01`
- `NAME-03`
- `ERR-N130-1`
- `ERR-N620-1`
- `MSG-01`
- `LRO-V4300-1`
- `ORD-V4300-1`
- `PROC-01`
- `CMT-N590-1`
- `AUD-01`
- `HLP-V4300-1`
- `MSG-N620-1`
- `DATE-Z310-1`
- `DATE-V4302-1`
- `NAME-V4302-1`
- `CPY-01`
- `KEY-Z590-1`
- `ORD-N130-1`
- `ERR-01`
- `DSP-02`
- `CMT-01`
- `XPG-N575-1`

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
