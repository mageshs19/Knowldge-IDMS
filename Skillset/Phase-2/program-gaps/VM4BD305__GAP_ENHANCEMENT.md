# Gap / enhancement assessment — VM4BD305

- Source report: `IDMS Programs/VM4BD305.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L9: > **Pairing.** Legacy header L9-11 "RECHERCHE DES TITRES CONCERNES PAR UNE MUTATION TOTALE / … TOUS LES TITRES ACTIFS EN ENCOURS CHEZ OLD-CI / … ADAPTATION DU VM4OM170" = VMDZ4305 seq 000900-001100 (literal English translation). "TOTAL MUTATION" and "VM4OM170" occur in no other VMDZ program [OBS grep]. Same FDs (DD010 150 / DD100 120), identical WS-IN-REC / WS-OUT-REC / TAB-TOT-MUT / TAB-EVENT, same paragraph names. **Confidence: High.**
- L11: ## 1. Identity, scope and completion
- L15: | Legacy | `IDMS Programs/VM4BD305.cbl`, 427 lines. N. Joris, Sept. 1988 (L4-5). Mods: 03/2005 HERMH NS-IRMO X5 → X4 (L13-15, see WS-IN-NS-IRMO-5 L77-79); 2007/11 VHEML recompile P20 2767 (L17-18). `CBL NOCMPR2,NOFLAGMIG,OPTIMIZE,SSRANGE` (L1) [OBS] |
- L16: | DB2 | `DB2 Manual converted Programs/VMDZ4305.cbl`, 777 lines. A. Dhuri, April 2026 (seq 000500-000600). `CBL ARITH(EXTEND)` (seq 000100) — **SSRANGE dropped**. Mod history dropped; header names DZBEFFTB → DZEVEFTB (seq 001700) [OBS] |
- L19: | IDMS access | **LRF.** Subschema VMBTS07 (L55), LR VMBTL07-R01 keyword **SWEEP-VMBEFF-VMBEVEF** = `OBTAIN EACH VMBEFF WITHIN AR-VMBEFF1 ON 0307 RETURN VMBEFF-EOA` / `OBTAIN EACH VMBEVEF WITHIN VMBEFF-VMBEVEF ON 0307 RETURN VMBEVEF-EOS` (VMBTS07 L157-164; no IF EMPTY). `COPY IDMS SUBSCHEMA-BINDS`, `READY AR-VMBEFF1 RETRIEVAL` (L172-173). Read-only; no FFRECAB, no COMMIT |
- L22: | Completion | All paragraphs traced; full statement diff legacy ↔ DB2 (XPG-01). Not in workspace: SQLERRWS/SQLERROR (Q-48, Q-61), VM9BC50T / VM9SU33T sources (Q-24), NR_IDGOOD migration spec (Q-107) |
- L30: | SSRANGE | Only VM4BD305 and VM4BZ200 among all legacy programs; no VMDZ program has it [OBS grep] |
- L74: | Kind | Legacy | DB2 |
- L124: | Item | Legacy | DB2 | Verdict |
- L148: | Case | Legacy | DB2 | Verdict |
- L159: | Structure | Legacy | DB2 | Note |
- L198: | D-04 | Low | seq 000100 | SSRANGE dropped: NBR-EVENT > 30 in ECRIRE (≥ 26 loaded transfers + chained writes) and CI-EVENT(0) when no transfer date > 0 abend in legacy, but overlay storage / read garbage in DB2 | **PLAT-V4305-1**, Q-115 |

## Open / referenced COBOL-team questions

- `Q-48`
- `Q-61`
- `Q-24`
- `Q-107`
- `Q-17`
- `Q-116`
- `Q-109`
- `Q-108`
- `Q-62`
- `Q-110`
- `Q-118`
- `Q-115`
- `Q-117`

## Important report findings to preserve

- L197: | D-03 | Low | seq 027802 | DESC emulates unknown set order (Q-17): differs only with ≥ 2 0060 or 0168 events per title, or tied 0092 dates (§10) | Q-110, ORD-V4300-1 |
- L198: | D-04 | Low | seq 000100 | SSRANGE dropped: NBR-EVENT > 30 in ECRIRE (≥ 26 loaded transfers + chained writes) and CI-EVENT(0) when no transfer date > 0 abend in legacy, but overlay storage / read garbage in DB2 | **PLAT-V4305-1**, Q-115 |
- L199: | D-05 | Low (conditional, Q-109) | seq 044303-045403, 053503, 055903 | DA-UBSECIS-STOCK X(8) rebuilt from DATE: legacy spaces/invalid migrated to 0001-01-01 return '00000000' → bytes 42-49, emission-key match vs DA-UB(I), BC50I-DA-JOUISSANCE differ | DATE-N130-1 |
- L200: | D-06 | Low | seq 062303 | 1004/1005 warning DISPLAYs HELP-NR-CDSTOCK (check digit) instead of HELP-NR-STOCK (13-digit title); unique [OBS grep] | display the group (**DSP-V4305-1**) |
- L201: | D-07 | Info | various | Date/IRMO conversion repeated per mutation inside EFF-IN-TAB (seq 044103-045403; up to 1000 × 257 k) instead of once per FETCH (**HLP-V4305-1**); ≈257 k OPEN/CLOSE pairs; WITH HOLD unneeded; NR_ID fetched for sort only; WS-NB-INPUT-COUNT dead; dead WS-DATUMVELDEN fields; flag name WS-DZBFFSC1; DZBEFFC1 END-EXEC without period; mixed English/French texts; mod history dropped | cosmetic / performance |
- L202: | D-08 | Info | seq 055103, 058403 | Caller names 'VMDZ4305' to VM9BC50T/VM9SU33T (NAME-03 PASS); verify the services do not branch on caller (Q-24) | — |
- L208: | L-01 | Info | L369 | VM9BC50T error DISPLAY says 'VM4BD303' (cloned text) | 'VMDZ4305' |
- L209: | L-02 | Medium | L298-302, L311 | IND-DATE never reset per title; if no slot ≥ 3 has a date > 0, CI-OMLOOP takes a stale slot (wrong holder) or slot 0 (SSRANGE abend) | same, minus abend (D-04) |
- L210: | L-03 | Low | L319 | ECRIRE increments NBR-EVENT without bound (OCCURS 30, PIC 99) | same, minus abend |
- L212: | L-05 | Info | L331 | AM-CN-STOCK S9(13)V99 → S9(12)V9(6) drops the high-order digit | identical |
- L241: | T-11 | two 0060 events (A, then B in set order) | slot 1 = last in set order | slot 1 = lowest NR_ID (D-03) |
- L242: | T-12 | two 0092 with the same date | first in set order | highest NR_ID (D-03) |

## Reusable rule IDs already present

- `RST-08`
- `XPG-01`
- `DATE-MUT`
- `DATE-EVENT`
- `DATE-SAVED`
- `DATE-IND`
- `CPY-01`
- `PLAT-01`
- `PLAT-02`
- `LRO-V4305-1`
- `ORD-01`
- `ERR-01`
- `ERR-03`
- `HLP-06`
- `LRO-N595-1`
- `DATE-01`
- `CNT-01`
- `ERR-N130-1`
- `NAME-03`
- `MSG-01`
- `DATE-Z310-1`
- `LRO-V4300-1`
- `LRO-Z260-1`
- `ORD-V4300-1`
- `PROC-01`
- `CMT-01`
- `CMT-N590-1`
- `AUD-01`
- `HLP-V4300-1`
- `PLAT-V4305-1`
- `DATE-N130-1`
- `DSP-V4305-1`
- `HLP-V4305-1`
- `LRO-N130-1`
- `ERR-02`
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
