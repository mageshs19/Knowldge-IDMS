# Gap / enhancement assessment — VM7BD102

- Source report: `IDMS Programs/VM7BD102.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L9: > **Pairing.** Legacy L7-9 "ARCHIVAGE : SELECTIE VAN DEFINITIEF VERNIETIGDE EFFECTEN (DAT ARCH EN INPUT) EN EFFECTEN MET VOLGNUMMER > 01" = VMDZ7102 seq 000907-001100, verbatim. "DEFINITIEF VERNIETIGDE" occurs in exactly these two files [OBS grep]. Same FDs (DD005 20 / DD010 154), REC-EFFECTEN length, LS-PARAM, paragraph names, STOP 01 texts. **Confidence: High.**
- L11: ## 1. Identity, scope and completion
- L15: | Legacy | `IDMS Programs/VM7BD102.cbl`, 293 lines. K. De Schepper (L4). Mods: 97/02 S. Pomponio EURO2000, VMBEFF 96 bytes, PARM date 8 positions (L11-14); 2005/02 J-M Boogaerts "date archivage idem IUNS (PARM)" (L15-16). No CBL card [OBS] |
- L16: | DB2 | `DB2 Manual converted Programs/VMDZ7102.cbl`, 720 lines. Anuja Dhuri, May 2026 (seq 000507-000607). `CBL ARITH(EXTEND)` (seq 000100). Mod history dropped; header adds DZBEFFTB → DZEVEFTB, both SELECT (seq 001307-002007) [OBS] |
- L19: | IDMS access | **LRF**, subschema VMBTS07 (L61), LR VMBTL07-R01 (L113), keyword **SWEEP-VMBEFF-VMBEVEF** = `OBTAIN EACH VMBEFF WITHIN AR-VMBEFF1 ON 0307 RETURN VMBEFF-EOA` / `OBTAIN EACH VMBEVEF WITHIN VMBEFF-VMBEVEF ON 0307 RETURN VMBEVEF-EOS` (VMBTS07 L157-164). `IDMS-RECORDS MANUAL` (L36), explicit `BIND RUN-UNIT/VMBEFF/VMBEVEF` (L199-201), `READY AR-VMBEFF1 RETRIEVAL` (L202), BATCH-AUTOSTATUS (L35). **No LR-STATUS = 'LR-ERROR' test anywhere** [OBS]. Read-only, no FFRECAB, no COMMIT |
- L22: | Completion | Every paragraph traced; full statement diff legacy ↔ DB2 (XPG-01); byte map of the 154-byte record vs Schema-Listing and CSV. Not in workspace: SQLERRWS/SQLERROR (Q-48, Q-61), IDMS-STATUS copy (Q-150), DD010 consumer (Q-148), NR_IDGOOD migration spec (Q-107, Q-147) |
- L68: | Kind | Legacy | DB2 |
- L125: | Item | Legacy | DB2 | Verdict |
- L151: | Case | Legacy | DB2 | Verdict |
- L160: | Structure | Legacy | DB2 | Note |
- L205: | ID | Sev | Line | Finding | DB2 |

## Open / referenced COBOL-team questions

- `Q-48`
- `Q-61`
- `Q-150`
- `Q-148`
- `Q-107`
- `Q-147`
- `Q-17`
- `Q-116`
- `Q-129`
- `Q-27`
- `Q-109`
- `Q-149`
- `Q-25`
- `Q-62`
- `Q-108`
- `Q-47`

## Important report findings to preserve

- L195: | D-05 | Low (conditional, Q-129) | seq 010710, 806010 | NR-PA-STOCK typed 9(5) and fed by alnum MOVE: an alpha prefix (R3 view) may get its last byte zone-normalised [INF compiler]; unique to VMDZ7102 [OBS grep] | type X(5) or move the 12-byte group |
- L196: | D-06 | Low (conditional, Q-109) | seq 807510-809309, 810108-811710 | DATE → 9(8): legacy spaces/invalid migrated to 0001-01-01 come back '00000000' (bytes 79-86, 97-104); selection unaffected (§10) | DATE-N130-1 |
- L197: | D-07 | Info [INF] | seq 806410-807210 | AM-* packed values from DECIMAL carry sign C/D; legacy raw may hold F (cf. VMDZ4420 D-06) | accept / T-12 |
- L198: | D-08 | Info | seq 678808 | STOP 01 DISPLAY of NS-DBSTK S9(2) COMP-3 shows an overpunched sign ('0B' for 2) vs legacy '02' (**DSP-V7102-1**) | display via unsigned 99 helper |
- L199: | D-09 | Info | various | WITH HOLD unneeded; NR_ID fetched for sort only; INITIALIZE EFF-VMBEVEF / DCLs redundant; SQLERROR path leaves EFFECTEN open (legacy IDMS-ABORT closes it, L291); 'ARCHIVAGE'→'ARCHIVING' text; 'I' in seq area (seq I17607); cols 1-6 wrap; DZBEFFC1 END-EXEC no period; timestamp DISPLAY; mod history dropped; ≈257 k OPEN/CLOSE pairs | cosmetic / performance |
- L207: | L-01 | Info | L262-264 | EFF-TELLER incremented for selected effects with 0 events → gaps in the numbering | identical |
- L208: | L-02 | Info | L157-186 | PARM date and WS-DA-CYMD-MIN03 dead since 2005/02; LS-LENGTH unchecked; window `> 60` → 19 | identical |
- L209: | L-03 | Low | L143, L151, L253, L274 | no LR-ERROR test: loops terminate only on path statuses; correctness depends on autostatus abort (Q-150) | SQLERROR (V-03) |

## Reusable rule IDs already present

- `HLP-V7102-1`
- `RST-08`
- `XPG-01`
- `ERR-V7102-1`
- `DATE-DMY8`
- `CPY-01`
- `PLAT-01`
- `PLAT-02`
- `LRO-V4305-1`
- `ORD-01`
- `ERR-01`
- `ERR-03`
- `HLP-Z310-1`
- `DATE-04`
- `SEQ-IRMO`
- `DATE-01`
- `HLP-06`
- `DSP-V4305-1`
- `CNT-01`
- `NAME-03`
- `ORD-V7102-1`
- `ERR-N130-1`
- `DATE-Z310-1`
- `LRO-Z260-1`
- `ORD-V4300-1`
- `LRO-N595-1`
- `PROC-01`
- `CMT-N590-1`
- `AUD-01`
- `HLP-V4300-1`
- `LRO-V4300-1`
- `DATE-N130-1`
- `DSP-V7102-1`
- `SEQ-01`
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
