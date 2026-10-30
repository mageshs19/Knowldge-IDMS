# Gap / enhancement assessment — VM4BZ250

- Source report: `IDMS Programs/VM4BZ250.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L13: ## 1. Identity, scope and completion
- L17: | Legacy | `IDMS Programs/VM4BZ250.cbl`, 474 lines. Author Marleen De Greef (Dolmen), Jan 87. Changes: J. Clement 93/10 (INFILE 160→400, LINE-NR 9→9(5), amounts with decimals) and 94/03 (BCI4/SLIK); B. Hannes 96/11 (amounts S9(13)V99 COMP-3); K. Vanheede 97/03 (INFILE 320, new layout); H. Hugues 11/2000 (E836); P. Tavernier 03/2005 ("NIEUWE ARCHIVERING - IUNS") (L10-23) [OBS]. |
- L18: | DB2 | `DB2 Manual converted Programs/VMDZ4250.cbl`, 474 lines, JAINRG. Seq 002310-002320: "04/2026 JAINRG : IDMS TO DB2 MIGRATION / VM4BZ250 -> VMDZ4250" (physical line 25). No CBL card, EXEC SQL, SQLCA or DCLGEN [OBS]. |
- L19: | Pairing | The header "MICROFICHES RECORDS DELETES DANS DB FORMULAIRES C" is identical (L8 = seq 000800). The explicit mapping is on DB2 line 25, and the line counts and diff match. **Confidence: CONFIRMED (very high).** |
- L23: | IDMS access | **None.** Only declarations exist: `IDMS-CONTROL SECTION` / `PROTOCOL. MODE IS BATCH-AUTOSTATUS DEBUG IDMS-RECORDS MANUAL` (L48-52), `SCHEMA SECTION` / `DB VMBTS09 WITHIN VMBTSCH` (L82-85), and **one** `COPY IDMS RECORD VMBFC.` used as a layout (L96). There is no BIND, READY, DML, FINISH, SUBSCHEMA-CTRL, IDMS-STATUS, IDMS-ABORT or DECLARATIVES [OBS full read]. |
- L25: | Completion | Full read of both files plus a cols 7-72 diff (§11). Upstream producers checked: VM4BZ200 / VMDZ4200. Not in workspace: **VMDZIBFC** (Q-104) and the job that builds the 1050-byte DD010 (Q-136). |
- L59: | Kind | Legacy | DB2 | Note |
- L75: | # | Legacy | Line | DB2 | Verdict |
- L118: | Item | Legacy | DB2 | Verdict |
- L141: | Situation | Legacy | DB2 | Equal? |
- L170: | Item | Legacy | DB2 | Verdict |

## Open / referenced COBOL-team questions

- `Q-104`
- `Q-136`
- `Q-106`
- `Q-21`
- `Q-137`
- `Q-17`
- `Q-22`
- `Q-105`
- `Q-135`
- `Q-103`
- `Q-25`

## Important report findings to preserve

- L121: | E-INITIALIZATION / `INITIALIZE VMBFC` | — | seq 036102, 044220, 047320-047321 | **D-01**: neutral, not legacy (HLP-V4230-1, HLP-V4310-1 class b) |
- L197: | D-03 | Info | seq 009900 | The microfiche header now prints "VMDZ4250" (bytes 20-27 of LA01). It is the only output difference. | accept (Q-103 analogue) |
- L198: | D-04 | Info | VMDZ4200 seq 006400 | C-DBKEY is never set, so I-DB-KEY = 0 in the DB2 chain. It is unused here, but VM4BZ260 L197 `OBTAIN VMBFC DB-KEY FC-DBKEY` shows that the DB-KEY was meaningful in the family. | Q-137 |
- L199: | L-01 | Info (legacy) | L349-352 | Empty file: header page without the LA-END trailer. | retain |
- L200: | L-02 | Info (legacy) | L370-371, L385, L391-394, L411, L428 | Truncation: NR-CIO and NR-CIW 9(8) → 9(6); CT-OPG/OPD → 99 (sign lost); NB-KRDEV 5 → 2 decimals; NR-SEQ binary → unsigned X(4). **L-03**: AM-CND-GDIFC is moved twice (L397, L404; duplicate "OPVULLEN LIJN 12" block). | retain |
- L201: | L-04 | Info (legacy) | L126-127, L132-144, L175-183 | LA05 has a duplicate data-name LA05-K022 and no K102. LA06 and LA10 are 132 bytes and LA10 has no leading blank, so with NOADV its first '-' falls on the carriage-control byte [INF]. | retain |
- L202: | L-05 | Info (legacy) | L310-315, L319, L66-67, L363-364, L443-444 | Dead items: DA-UB-FORM-AS, USERABEN, I-DB-KEY, I-SW-ARCHIV. `MOVE I-VMBFC TO VMBFC` also runs after AT END (stale buffer); this is harmless because the loop ends. | retain |
- L203: | L-07 | Info (legacy) | L429 | The 10-byte DA-UBSEC date overwrites the '/' fillers of LA14-KDAT, so it prints in its source format. | retain |

## Reusable rule IDs already present

- `DATE-IND`
- `PLAT-V4230-1`
- `SEQ-040IRMO`
- `CPY-V4230-1`
- `PLAT-01`
- `DATE-N015-1`
- `HLP-V4230-1`
- `HLP-V4310-1`
- `NAME-03`
- `NAME-V4230-1`
- `DATE-04`
- `DATE-05`
- `HLP-08`
- `RST-08`
- `ORD-01`
- `MSG-01`
- `ERR-02`
- `CMT-W4250-1`
- `CMT-01`
- `CMT-N590-1`
- `XPG-01`
- `DSP-Z250-1`
- `AUD-01`
- `CNT-01`
- `HLP-W4250-1`
- `CPY-W4250-1`
- `PLAT-02`

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
