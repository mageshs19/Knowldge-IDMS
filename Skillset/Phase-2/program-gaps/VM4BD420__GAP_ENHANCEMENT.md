# Gap / enhancement assessment — VM4BD420

- Source report: `IDMS Programs/VM4BD420.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L9: > **Pairing.** Legacy L10 "INFORMATORISCHE KASBON 2." = VMDZ4420 seq 000100 "INFORMATIONAL KASBON 2." (Dutch → English). It is the only hit for that header on either side [OBS grep "KASBON 2|INFORMATIONAL KASBON|INFORMATORISCHE"]. Sub-headers also match: L14 "VERGELIJKING DATABASE EN INVENTARIS" = seq 000140 "COMPARISON DATABASE AND INVENTORY"; L17 "TWEEDE PROGRAMMA" = seq 000170 "SECOND PROGRAM". The FD (DD005, 50 bytes), the UITRECORD, PARAM-DATONLY and the ESDATMAS prologue are also identical. **Confidence: High.**
- L13: ## 1. Identity, scope and completion
- L17: | Legacy | `IDMS Programs/VM4BD420.cbl`, 228 lines. M. Beevers (Data Process), January 1988. Mods: 06/92 K. De Schepper PR 436451, "values still in stock must not be taken into the output" (L22-24), plus PARMDATE and a test on DA-CR-EVENT-PROD (L26-27); 03/97 Euro/Y2K (L29-32); 03/98 project 5421, pass the creation CI on to the next step (L34-36); 2004/12 J-M Boogaerts, "reprendre n° de titre en output (12 pos de libres)" (L37-38) [OBS] |
- L18: | DB2 | `DB2 Manual converted Programs/VMDZ4420.cbl`, 499 lines. A. Dhuri, April 2026. `CBL ARITH(EXTEND)`. Legacy mod history dropped. The header names DZBEFFTB (parent) → DZEVEFTB (child), both SELECT only (seq 000220-000290) [OBS] |
- L21: | IDMS access | **Direct DML, no LRF** (the VMBTS07 LR path SWEEP-VMBEFF-VMBEVEF exists, VMBTS07.txt L157-164, but is not used). Subschema VMBTS07 (L71). `PROTOCOL MODE IS BATCH DEBUG` (**not** AUTOSTATUS), so status is checked explicitly with `PERFORM IDMS-STATUS` (L49). **Area sweep** `OBTAIN FIRST/NEXT VMBEFF WITHIN AR-VMBEFF1` + `FIND CURRENT VMBEFF` (L161, L186-188). Set walk over `VMBEFF-VMBEVEF` (L180, L211). Read-only, no FFRECAB, no COMMIT [OBS] |
- L24: | Completion | All paragraphs traced. Full IF/MOVE diff done against the legacy and against the sister VMDZ4300 (XPG-01). Not in workspace: SQLERRWS/SQLERROR (Q-48, Q-61), ESDATMAS source, the NR_IDGOOD migration spec (Q-107), the DD005 consumer (Q-127) |
- L70: | Kind | Legacy | DB2 |
- L126: | Item | Legacy | DB2 | Verdict |
- L154: | Case | Legacy | DB2 | Verdict |
- L167: | Structure | Legacy | DB2 | Note |
- L216: | ID | Sev | Line | Finding | DB2 |

## Open / referenced COBOL-team questions

- `Q-48`
- `Q-61`
- `Q-107`
- `Q-127`
- `Q-17`
- `Q-109`
- `Q-129`
- `Q-62`
- `Q-110`
- `Q-86`
- `Q-128`
- `Q-25`

## Important report findings to preserve

- L207: | D-03 | Low | seq 009100 | DESC emulates an unknown set order (Q-17). It changes UIT-NR-CIO-CRE only when there are 2 or more past 0060 events with different NR-ID-GOOD (§10 d) | Q-17, Q-110, ORD-V4420-1 |
- L208: | D-04 | Low (conditional, Q-109) | seq 010239-010701 | UIT-DA-UBSEC is rebuilt from a DATE. A legacy X(8) of spaces/invalid that was migrated to 0001-01-01 comes back as '00000000' (DATE-N130-1). Output bytes 31-38 then differ | DATE-N130-1, Q-109 |
- L209: | D-05 | Info | various | WITH HOLD not needed on both cursors; NR_ID fetched only for the sort; 600-GET-TIMESTAMP DISPLAY only; `02` level quirk; flag name WS-DZBFFSC1; DZBEFFC1 END-EXEC without period; INITIALIZE DCLDZBEFFTV / DCLDZEVEFTV redundant; outer `IF NOT SW-STATUS-D` redundant; mod history dropped; about 257 k OPEN/CLOSE pairs (FK index assumed, cf. Q-86) | cosmetic / performance |
- L210: | D-06 | Info [INF] | seq 010232-010233 | The legacy packed-to-packed MOVE of the same PIC may keep a stored X'F' sign; a DB2 DECIMAL always returns X'C'/X'D'. Bytes 1-16 can differ in the sign nibble only | T-14; accept |
- L218: | L-01 | Low | L193-205 | The 0217 'S' state (PR 436451 "stock must not be output", L22-24) never prevents a write: a later past 0060 overwrites 'S' with 'C', and an earlier 'C' blocks 'S'. A bon with both events is written [INF] | identical (seq 010193-010206); Q-128 |
- L219: | L-02 | Info | L194 | `WS-STATUS NOT = 'D'` is dead: 'D' ends the walk at once (L201) | identical |
- L220: | L-03 | Info | L196 | With several past 0060 events, the last one in set order wins (silent overwrite) | ordered by DESC (D-03) |
- L221: | L-04 | Info | L119-130, L110 | DATE8-LS century discarded (via DATE6, ESDATMAS re-derives it); ACCEPT window `> 60` → 19; L-PARAM not checked | identical |
- L222: | L-05 | Info | L216 | WS-NR-CIO-CRE 9(8) → UIT 9(6): high-order digits truncated | identical |
- L240: | T-01 | bon, one 0060 ≤ R | 1 record, CI = low 6 digits of the 0060 CI | same (if Q-107 OK) |
- L246: | T-07 | two past 0060 with different CI | CI of the last in set order | CI of the lowest NR_ID (D-03) |

## Reusable rule IDs already present

- `RST-08`
- `XPG-01`
- `DATE-IND`
- `PLAT-01`
- `PLAT-02`
- `LRO-V4300-1`
- `LRO-N130-1`
- `ORD-01`
- `ERR-01`
- `ERR-03`
- `ERR-V4420-1`
- `DATE-04`
- `KEY-Z570-1`
- `DATE-01`
- `DSP-02`
- `CNT-01`
- `NAME-03`
- `CPY-01`
- `ERR-N130-1`
- `MSG-N620-1`
- `DATE-Z310-1`
- `LRO-Z310-1`
- `DSP-Z250-1`
- `ORD-V4420-1`
- `ORD-V4300-1`
- `DATE-N130-1`
- `PROC-01`
- `CMT-N590-1`
- `CMT-01`
- `AUD-01`
- `HLP-V4300-1`
- `HLP-Z310-1`
- `ORD-N130-1`
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
