# Gap / enhancement assessment — VM4BD300

- Source report: `IDMS Programs/VM4BD300.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L9: > **Pairing.** Legacy header L6 "DETERMINATION DES TITRES EN CIRCULATION" = VMDZ4300 seq 000804 "DETERMINATION OF SECURITIES IN CIRCULATION" (only VMDZ hit for "DETERMINATION" [OBS grep]). The pair also shares FD UITBST DD005 90 bytes, the UITREC layout, PARAM-DATONLY, and CALL-VM9BC50T with key '3'. **Confidence: High.**
- L13: ## 1. Identity, scope and completion
- L17: | Legacy | `IDMS Programs/VM4BD300.cbl`, 256 lines. M. Beevers (Data Process), May 1989. Mods: 01/1998 P. Verbeek EURO; 12/2004 N. Joris: internal code looked up by the new kasbon key, "adaptation du VM9OM002" (L14-16); 2007/11 VHEML recompile P20 2767 (L18-19) [OBS] |
- L18: | DB2 | `DB2 Manual converted Programs/VMDZ4300.cbl`, 575 lines. A. Dhuri, April 2026. `CBL ARITH(EXTEND)`. Legacy mod history dropped; header names DZBEFFTB (parent) → DZEVEFTB (child) (seq 002304) [OBS] |
- L21: | IDMS access | **Direct DML, no LRF.** Subschema VMBTS07 (L43). `BIND RUN-UNIT/VMBEFF/VMBEVEF`, `READY AR-VMBEFF1 RETRIEVAL` (L127-130). **Area sweep** `OBTAIN FIRST/NEXT VMBEFF WITHIN AR-VMBEFF1` + `FIND CURRENT VMBEFF` (L133, L171-172). Set walk `OBTAIN FIRST/NEXT VMBEVEF WITHIN VMBEFF-VMBEVEF` (L150, L214). `PROTOCOL MODE IS BATCH-AUTOSTATUS DEBUG` (L29). Read-only; no FFRECAB, no COMMIT [OBS] |
- L24: | Completion | All paragraphs traced, with a full IF/MOVE diff against the sister VMDZ4302 (XPG-01). Not in workspace: SQLERRWS/SQLERROR (Q-48, Q-61), VM9BC50T source (Q-24), the data-migration spec for NR_IDGOOD (Q-107) |
- L77: | Kind | Legacy | DB2 |
- L129: | Item | Legacy | DB2 | Verdict |
- L157: | Case | Legacy | DB2 | Verdict |
- L169: | Structure | Legacy | DB2 | Note |
- L217: | ID | Sev | Line | Finding | DB2 |

## Open / referenced COBOL-team questions

- `Q-48`
- `Q-61`
- `Q-24`
- `Q-107`
- `Q-17`
- `Q-31`
- `Q-109`
- `Q-108`
- `Q-62`
- `Q-110`
- `Q-86`
- `Q-59`

## Important report findings to preserve

- L209: | D-03 | Low | seq 023104 | DESC emulates an unknown set order (Q-17). Changes UIT-NR-CI only with ≥ 2 past 0060 and no qualifying 0092, or equal 0092 transfer dates (§10) | Q-17, Q-110, ORD-V4300-1 |
- L210: | D-04 | Low | seq 031307-031309 | Added `IF HULP-DA-UB-TRANSF = 00010101 → 0` (not in legacy; also VMDZ4302 seq 048903, unique to these two [OBS grep]). Harmless if no real date 0001-01-01, but executed for **every** event type, so non-numeric NR_IDGOOD content of non-0092 events goes into a zoned numeric compare (legacy compares only on 0092) [INF data-exception risk] | move the guard inside the 0092 branch; keep only if Q-107 confirms the 00010101 encoding |
- L211: | D-05 | Low (conditional, Q-109) | seq 037104-038004 | BC50I-DA-JOUISSANCE rebuilt from DATE: legacy X(8) spaces/invalid migrated to 0001-01-01 come back as '00000000' (DATE-N130-1); VM9BC50T may then return RC ≠ 0 → USERABEN abend where legacy behaviour differs | DATE-N130-1 |
- L212: | D-06 | Info | various | WITH HOLD unneeded on both cursors; NR_ID fetched only for sort; 600-GET-TIMESTAMP DISPLAY-only; dead DA-YYMMDD/DA-DDMMCCYY; `02` level quirk; flag name WS-DZBFFSC1; DZBEFFC1 END-EXEC without period; mod history dropped; ≈257 k OPEN/CLOSE pairs (index on DZEVEFTV FK assumed, cf. Q-86) | cosmetic / performance |
- L213: | D-07 | Info | seq 036004, 039104 | BC50I-NM-CALLER and DISPLAY prefix 'VMDZ4300' (NAME-03 PASS); verify VM9BC50T does not branch on caller name (Q-24) | — |
- L219: | L-01 | Info | L182, L190 vs L203 | 0168/0060 tests compare **groups** (alphanumeric) DA-CR-EVENT-PROD vs DATE-YMD8; 0092 compares numerically with DATE-YMD8-9 | numeric everywhere (V-04); same result for digit dates |
- L220: | L-02 | Info | L163-164 | AM-CN-STOCK S9(13)V99 → S9(12)V9(6) drops the high-order digit; LAATSTE-CI X(6) → 9(6) | identical statements |
- L221: | L-03 | Info | L113, L101-105, L247 | no check on L-PARAM (without PARM, DATE-IND/DATE6-LS read undefined storage); century window < 80; USERABEN with UITBST open and no FINISH | identical |
- L248: | T-09 | two past 0060, no 0092 | CI of first in set order | CI of highest NR_ID (D-03) |

## Reusable rule IDs already present

- `RST-08`
- `XPG-01`
- `DATE-IND`
- `DATE-YMD`
- `DATE-DMY`
- `DATE-YMD8`
- `DATE-YMD8-9`
- `PLAT-01`
- `PLAT-02`
- `LRO-V4300-1`
- `LRO-N130-1`
- `ORD-01`
- `ERR-01`
- `ERR-03`
- `DATE-04`
- `DATE-01`
- `DSP-02`
- `HLP-06`
- `CNT-01`
- `ERR-N130-1`
- `ERR-02`
- `MSG-N620-1`
- `NAME-03`
- `MSG-01`
- `DATE-Z310-1`
- `ORD-V4300-1`
- `PROC-01`
- `CMT-N590-1`
- `CMT-01`
- `AUD-01`
- `HLP-V4300-1`
- `DATE-N130-1`
- `CPY-01`
- `HLP-Z310-1`
- `LRO-Z310-1`
- `ORD-N130-1`
- `ERR-N620-1`
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
