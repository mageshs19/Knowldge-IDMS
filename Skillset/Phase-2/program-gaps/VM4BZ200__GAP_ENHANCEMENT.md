# Gap / enhancement assessment — VM4BZ200

- Source report: `IDMS Programs/VM4BZ200.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L9: > **Pairing.** Legacy L12 "EXTRACT DES FORMULAIRES C  A ARCHIVER" = VMDZ4200 seq 000900, identical text; it is the only hit on either side, and so is "NO DATUMBESTAND -STOP PGM" (L191 / seq 027200) [OBS grep]. Same FDs DARCH DD010 20 B (COPY VMBZ270I) / FORMC DD020 350 B, same paragraph names 000000/100000/300000/400000, same PARAM-DATONLY. **Confidence: High.**
- L13: ## 1. Identity, scope and completion
- L17: | Legacy | `IDMS Programs/VM4BZ200.cbl`, 274 lines. M. De Greef (Dolmen), Jan 1987 (L7-8). Mods: 89/09 J-M Boogaerts, no more ERASE, write a file with the keys of the forms to delete (L14-15); 94/02 K. De Schepper, IDMS MANUAL, only the key of the first line (L17-18); 97/05 K. Vanheede, performance: area sweep VMBSIC + set sweep VMBFC replaced by **area sweep on VMBFC**; forms are only unloaded here, archive check moves to VM4BZ911 (L20-26); 2005/02 TAVEP, new archiving, other selection (L28-29). `CBL NOCMPR2, NOFLAGMIG, SSRANGE` (L1) [OBS] |
- L18: | DB2 | `DB2 Manual converted Programs/VMDZ4200.cbl`, 563 lines. A. Dhuri, May 2026. `CBL ARITH(EXTEND)` (seq 000100). Mod history dropped; header text "EXTRACT THE INPUT KASBONS DATA" (seq 001100) is the Dhuri extract template (also VMDZ4300/4302/4305/4420/4425/7102 [OBS grep]) and does not describe forms C |
- L21: | IDMS access | **Direct DML, no LRF.** Subschema VMBTS09 (L75), `IDMS-RECORDS MANUAL` + COPY IDMS RECORD VMBFC (L49, L138), `PROTOCOL MODE IS BATCH-AUTOSTATUS DEBUG` (L48). `BIND RUN-UNIT/VMBFC`, `READY AR-VMBFRM4 RETRIEVAL` (L201-204). **Area sweep** `OBTAIN FIRST/NEXT VMBFC WITHIN AR-VMBFRM4` + `FIND CURRENT VMBFC` (L206, L234-235). Read-only, no FFRECAB, no COMMIT |
- L25: | Completion | All paragraphs traced with full IF/MOVE diff and XPG-01 greps. Not in workspace: VMDZIBFC copybook (Q-134), SQLERRWS/SQLERROR (Q-48, Q-61), VM4BZ911 / FORMC consumer (Q-131, Q-133) |
- L58: | Kind | Legacy | DB2 |
- L115: | Item | Legacy | DB2 | Verdict |
- L143: | Case | Legacy | DB2 | Verdict |
- L156: | Structure | Legacy | DB2 | Note |
- L180: | Legacy | Lines | DB2 | Verdict |
- L217: | ID | Sev | Line | Finding | DB2 |

## Open / referenced COBOL-team questions

- `Q-134`
- `Q-48`
- `Q-61`
- `Q-131`
- `Q-133`
- `Q-62`
- `Q-115`
- `Q-132`
- `Q-107`
- `Q-21`
- `Q-104`
- `Q-95`

## Important report findings to preserve

- L204: | D-02 | Low (conditional, Q-131) | seq 006400, 031200-031600 | `MOVE DBKEY TO C-DBKEY` (L262) has no equivalent: bytes 317-320 are binary zero on every record. No in-workspace reader uses them (§10) | decide: zero, or key-based replacement downstream (HLP-W4200-1) |
- L205: | D-03 | Low (Q-134, Q-132) | seq 006200, 031200 | VMBFC FILLER X(16) (bytes 281-296) has no column; INITIALIZE skips FILLER, so bytes = VMDZIBFC VALUE or undefined WS storage; legacy copied raw bytes (CSV L54: spaces or packed zeros) | give the copybook FILLER `VALUE SPACES` or agree target bytes (HLP-W4200-1) |
- L206: | D-04 | Low (data-gated, Q-132) | seq 020600-020900, 041100-044100, 040400 | Dirty legacy data diverges: DA-CPTA spaces selected by legacy branch 1 but only via branch 2 in DB2; DA-CPTA/DA-PAY spaces written back as '00000000'; NB-QZAUT spaces (CSV L43) written as '000' | DATE-N130-1; data profiling |
- L207: | D-05 | Low | seq 028100-028700, 046700 | DA-ARCH-YMD zero/invalid → host string '00.00.0000' etc. → OPEN -180/-181 → SQLERROR abend; legacy runs (empty or string-compare result) | validate the date before OPEN with the legacy outcome, or accept (Q-132) |
- L208: | D-06 | Info | seq 001100, 009800, 016500, 023300, 026900, 046300 | template header "INPUT KASBONS DATA"; WITH HOLD unneeded; `INITIALIZE DCLDZMBFCTV` redundant; DISPLAY 'CHECK PARM DATE' re-spaced; '71O' typo; mod history dropped; SSRANGE dropped (no effect) | cosmetic |
- L209: | D-07 | Info [INF] | seq 036600-040100 | DECIMAL → S9(13)V99 packed always yields sign C/D; NB-KRDEV display overpunch C/D; legacy raw image keeps the stored nibble (may be F) | accept; T-12 |
- L210: | D-08 | Info | seq 053000, 030200 | 'TOTAL MBFC RECORDS' now counts selected rows only (= output count), not swept rows | rename or count all (LRO-W4200-1) |
- L219: | L-01 | Info | L234 | FIND CURRENT redundant (no intervening DML) | dropped |
- L220: | L-02 | Low | L191-193 | empty DARCH → STOP RUN with RC 0, FORMC never opened; next step sees no/empty file | identical |

## Reusable rule IDs already present

- `RST-08`
- `XPG-01`
- `DATE-IND`
- `DATE-01`
- `CPY-01`
- `CNT-01`
- `PLAT-01`
- `PLAT-02`
- `LRO-V4300-1`
- `LRO-W4200-1`
- `HLP-W4200-1`
- `HLP-Z310-1`
- `ERR-01`
- `ERR-03`
- `DATE-04`
- `DATE-N015-1`
- `LRO-N170-1`
- `CMT-01`
- `ERR-N130-1`
- `NAME-03`
- `MSG-01`
- `DATE-Z310-1`
- `PLAT-V4305-1`
- `DATE-N130-1`
- `PROC-01`
- `CMT-N590-1`
- `AUD-01`
- `KEY-W4200-1`
- `KEY-Z590-1`
- `DATE-V4302-1`
- `LRO-Z310-1`
- `ORD-01`
- `ORD-V4300-1`
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
