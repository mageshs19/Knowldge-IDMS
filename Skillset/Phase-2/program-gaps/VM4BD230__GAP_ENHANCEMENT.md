# Gap / enhancement assessment — VM4BD230

- Source report: `IDMS Programs/VM4BD230.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L14: ## 1. Identity, scope and completion
- L18: | Legacy | `IDMS Programs/VM4BD230.cbl`, 3095 lines, author Gyde Filip. Modification history: Boogaerts 88/90; De Schepper 92-97 (SLIK, FFRECAB split 94/07, TOB, TFE, AM-BASE); Verbeek 96 (putkosten); Pomponio 97 (EURO2000, PARM 8 pos.); Seculier 2001 (E833/E836); Leonet 2001 (AM-FLK 253); Boogaerts 2005/02 (IUNS archiving, L48); TAVEP 21.05.07 (CO-OPD 90/94) [OBS]. |
- L19: | DB2 | `DB2 Manual converted Programs/VMDZ4230.cbl`, 3098 lines, JAINRG. Seq 005103-005403 say: "MODIFIED BY JAINRG FOR IDMS TO DB2 MIGRATION PROJECT / 2026/04 VM4BD230 -> VMDZ4230 / JAINRG13042026 -> AS NO DATA IS THERE HENCE DECIDED NOT TO MIGRATE TO DB2". `CBL NOSQL` is kept (seq 000100). There is no EXEC SQL, no SQLCA and no DCLGEN [OBS]. |
- L23: | IDMS access | **None.** The program has declaratives only: IDMS-CONTROL / `PROTOCOL. MODE IS BATCH DEBUG` / `IDMS-RECORDS MANUAL` (L65-67) and `SCHEMA SECTION` / `DB VMBTS08 WITHIN VMBTSCH` (L87-88). There are 9 `COPY IDMS <record>` statements used as **layouts only** (L168-190). No BIND, READY, OBTAIN, FIND, GET, STORE, MODIFY, ERASE, FINISH or COMMIT, and no SUBSCHEMA-CTRL copy [OBS grep]. |
- L25: | Completion | Full ordered diff (`git diff --no-index`, cols 7-72) done; all 10 difference groups are listed in §11. The VMDZI* copybooks are **not in the workspace** [UNK] (Q-104). |
- L72: | Kind | Legacy | DB2 | Note |
- L85: | # | Legacy | Line | DB2 | Verdict |
- L118: | Item | Legacy | DB2 | Verdict |
- L133: | Aspect | Legacy | DB2 |
- L143: | Situation | Legacy | DB2 | Equal? |
- L173: | Item | Legacy | DB2 | Verdict |
- L189: | Aspect | Legacy | DB2 |

## Open / referenced COBOL-team questions

- `Q-104`
- `Q-106`
- `Q-17`
- `Q-105`
- `Q-103`
- `Q-25`
- `Q-21`
- `Q-27`

## Important report findings to preserve

- L202: | D-02 | Info | seq 016603-018803 | The VMDZI* copybooks are not in the workspace, so the 1200-byte overlay cannot be verified. | verify (Q-104) |
- L203: | D-03 | Info | seq 019803 | The report header now prints "VMDZ4230", so the printed output differs from legacy in the title line (expected under NAME-03). Microfiche indexing may depend on it. | accept or confirm (Q-103) |
- L204: | D-04 | Info | 28 lines (§11) | Empty `*` comment lines became blank lines. No compile or runtime effect. | engine: keep comments verbatim |
- L205: | D-05 | Info | seq 005403 | The rationale "no data … not migrated to DB2" is ambiguous. The program never had DB access; the file still exists. | Q-103 |
- L206: | L-01 | Info (legacy) | L1457, L2984-3092 | IMP-ORDER moves packed signed 074SORD amounts into unsigned WS-NIET-COMP fields, so negatives print without sign. | retain |
- L207: | L-02 | Info (legacy) | L2164, L2212 | CTRL increments do not match the written lines: FAS writes 29 lines and adds 28; FTE writes 7 and adds 9 [INF from line count]. Thresholds differ per type (>52 L1627/1678/1725, >50 L1776/2170, >38 L1865, >35 L2000, >40 L2986). Pagination is cosmetic only. | retain |
- L208: | L-03 | Info (legacy) | WS (§6) | 10+ unused items, including FFRECAB restart residue. | retain |
- L209: | L-04 | Info (legacy) | L1735, L1739 | DDT75569 "SWAP ID1/ID2": `MOVE NR-ID2 TO RET2-NR-ID` is overwritten 4 lines later by NR-ID-FORM-AS (dead store). | retain |

## Reusable rule IDs already present

- `DATE-IND`
- `CPY-01`
- `CPY-N015-1`
- `CPY-V4230-1`
- `DATE-YMD`
- `DATE-DMY8`
- `DATE-YMD8`
- `DATE-DSMSY`
- `PLAT-V4230-1`
- `PLAT-01`
- `NAME-03`
- `NAME-V4230-1`
- `DATE-DMY`
- `DATE-04`
- `DATE-05`
- `HLP-08`
- `RST-08`
- `ORD-01`
- `MSG-01`
- `ERR-04`
- `CMT-01`
- `AUD-01`
- `CNT-01`
- `HLP-06`
- `PLAT-02`
- `XPG-01`
- `HLP-V4230-1`

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
