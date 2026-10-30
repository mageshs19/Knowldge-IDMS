# Gap / enhancement assessment — VM4BD310

- Source report: `IDMS Programs/VM4BD310.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L12: ## 1. Identity, scope and completion
- L16: | Legacy | `IDMS Programs/VM4BD310.cbl`, 337 lines. VHEML 2006/03 (L6). One change: TERMA 11/03/2009 P27, new input zone OLD-CI moved to NR-CIINPTR-OORD (L15-17, L89, L312) [OBS] |
- L17: | DB2 | `DB2 Manual converted Programs/VMDZ4310.cbl`, 512 lines. JAINRG 2026/04 (seq 000600). `CBL ARITH(EXTEND)` replaces `CBL NOSQL`. History dropped [OBS] |
- L18: | Pairing | Legacy header "OPZOEKEN GEGEVENS MAANDELIJKSE MUTATIES VIA ACCESS IDMS DB OMLOOP/CIRCULATIE" (L8-9) = DB2 "EXTRACTING EVENTS DATA FOR MONTHLY CHANGES … DZBEFFTB & DZEVEFTB" (seq 001111-001114); only VMDZ hit for "MONTHLY" [OBS grep]. Same FDs (DD010 X(21), DD100 X(1500)), same paragraph names, same `'CIR '` literal (unique to VMDZ4310 [OBS grep]). **Confidence: High** |
- L21: | IDMS access | LRF only: subschema VMBTS07 (L45), LR VMBTL07-R01 path **ALL-VMBEVEF-BY-VMBEFF** (L188, L202). Explicit BIND RUN-UNIT/VMBEFF/VMBEVEF and READY AR-VMBEFF1 RETRIEVAL with `ON ANY-ERROR-STATUS PERFORM IDMS-STATUS` (L137-152). Read-only, no FFRECAB, no COMMIT |
- L24: | Completion | All paragraphs traced; full IF/EVALUATE/MOVE/STRING/PERFORM diff done (XPG-01) incl. sister VMDZ1190. Not in workspace: SQLERRWS, SQLERROR (Q-48), USERABEN, data-migration spec for NR_IDGOOD (Q-107) |
- L78: | Kind | Legacy | DB2 |
- L93: | # | Legacy verb | Line | DB2 | Rule / verdict |
- L151: | Aspect | DB2 | Verdict |
- L163: | Situation | Legacy | DB2 | Equal? |
- L182: | Request | Path (VMBTS07.txt L124-136) | Legacy statuses | DB2 |
- L199: | Live legacy statement commented in DB2 | **none** [OBS full diff]; CMT-N590-1 PASS |

## Open / referenced COBOL-team questions

- `Q-48`
- `Q-107`
- `Q-21`
- `Q-17`
- `Q-18`
- `Q-69`
- `Q-22`
- `Q-123`
- `Q-125`
- `Q-109`
- `Q-126`
- `Q-74`
- `Q-124`

## Important report findings to preserve

- L215: | D-02 | Medium (conditional; High if Q-107 = raw copy) | seq 007000-007600, 026533-026551 | Form key from NR_IDGOOD CHAR(28) via a DISPLAY 8/8/6/3/3 overlay; legacy unpacks X(20) COMP-3. Correct only if migration unpacked to 28 digits (DCLGEN CHAR(28) vs CSV L360 CHAR(20)). Raw copy → CT-OPD ≠ 00 → USERABEN on the first record (loud) | confirm Q-107 / Q-18 (HLP-V4300-1) |
- L216: | D-03 | Medium (conditional, Q-123) | seq 023604-023605 | Legacy takes the **first** 0092 in set order; DB2 the highest NR_ID. Differs only for bons with ≥ 2 transfer events (form key, CI, event date, CT-OPD all change) | ORD-01 / Q-17 / Q-123 |
- L217: | D-04 | Low | seq 023554-023564, 024300-025300 | +100 routed to SQLERROR (Q-48); legacy texts 'VMBEFF NOT FOUND', 'VMBEVEF NOT FOUND', 'NO MORE VMBEVEF' and the KY-EFFECT dump replaced; empty set vs no-0092 indistinguishable; abend code SQLERROR vs USERABEN | keep legacy texts (MSG-N620-1, MSG-V4310-1, Q-125) |
- L218: | D-05 | Low (conditional, Q-109) | seq 037503-038605 | DA-UB-FORM-AS rebuilt from DATE: legacy X(8) spaces/invalid loaded as 0001-01-01 come back '00000000' | DATE-N130-1 |
- L219: | D-06 | Info | seq 023523/023528, 023515/023577, 023460, 001111 | NX_CPCRESK selected twice; DZBEFFTV without FETCH FIRST (LRO-01); SQL-LOCATION 2101/2100 inverted; '# TREATED    = ' spacing differs from legacy '# TREATED  = ' (L168); timestamp/TOTAL INPUTS displays; "KASBONS" header; dead WS-DATUMVELDEN parts | cosmetic |
- L220: | D-07 | Info | seq 038690 | `INITIALIZE WS-MUTATIES` before each READ INTO: harmless. Not the VMDZ1190 FD-record pattern (correction of VM1BZ190 report D-03 cross-reference) | none (HLP-V4310-1) |
- L221: | D-08 | Info | seq 023506, 023511 | X13 → 9(13) and X2 → DEC(2) are numeric moves (legacy: alnum group / zoned). Non-numeric input → S0C7 [INF] where legacy gets VMBEFF-NOT-FND + USERABEN; both abend | accept (HLP-06), Q-126 |
- L222: | L-01 | Low (legacy) | L94, L335-337 | CS-VM4BD310 never moved to PROGRAM-NAME → IDMS-STATUS abort text without program name [INF] | retain; DB2 sets it |
- L232: | V-05 | Paragraphs renumbered 1000/1100/1200/2000-2300/3000, flow identical (BIZ-FLOW-01); `CBL NOSQL` → `ARITH(EXTEND)` without effect (no COMPUTE) |
- L240: | T-01 | bon, NX-CPCRE = 0, AM-CND-STOCK 1000,00, first event 0092 | AM-CND-FORM-AS 1000,00 | **0, FAIL D-01** |
- L243: | T-04 | two 0092 events | first in set order | highest NR_ID (D-03) |

## Reusable rule IDs already present

- `RST-08`
- `XPG-01`
- `KEY-Z190-1`
- `ERR-Z190-1`
- `ERR-03`
- `HLP-V4310-1`
- `SEQ-040IRMO`
- `CPY-01`
- `ORD-01`
- `PLAT-01`
- `PLAT-02`
- `LRO-01`
- `LRO-N170-1`
- `ERR-01`
- `LRO-02`
- `MSG-V4310-1`
- `NAME-02`
- `HLP-06`
- `DATE-01`
- `DATE-N130-1`
- `AUD-01`
- `CNT-01`
- `DATE-X`
- `NAME-03`
- `ERR-02`
- `DATE-Z310-1`
- `PROC-01`
- `LRO-Z190-1`
- `CMT-01`
- `CMT-N590-1`
- `LRO-V4310-1`
- `HLP-V4300-1`
- `MSG-N620-1`
- `DATE-04`
- `XPG-N575-1`
- `ERR-N130-1`
- `DSP-Z250-1`

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
