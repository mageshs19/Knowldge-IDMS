# Gap / enhancement assessment — VM1BZ310

- Source report: `IDMS Programs/VM1BZ310.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L13: ## 1. Identity, scope and completion
- L17: | Legacy | `IDMS Programs/VM1BZ310.cbl`, 331 lines. Author M. De Greef (Dolmen). Mods L13-29: 89/02 USER-ID X(5)→X(8) + COBOL2; 93/09 IDMS-RECORDS MANUAL, line no 9(1)→9(5); 96/10 amounts S9(13)V9(2); 00/10 OCCURS 100→300; 07/2003 project 6212 DAISY "waardecodes vervangen door interne sleutel uitgiftes VMBC" (L25-27) [OBS] |
- L18: | DB2 | `DB2 Manual converted Programs/VMDZ1310.cbl`, 550 lines. V. Mahajan, May 2026. `CBL ARITH(EXTEND)`. Header lists DZCOUPTV, DZEVCPTV; legacy mod history dropped [OBS] |
- L20: | IDMS access | LRF `VMBTL09-R01`, subschema VMBTS09 (L77-80, L142). `READY AR-VMBCOUP USAGE-MODE RETRIEVAL` (L165). Path `SWEEP-VMBCOUP-VMBEVCP` (VMBTS09 L164-173). **Read-only**, no FFRECAB, no COMMIT [OBS] |
- L22: | Completion | All paragraphs traced. Not in workspace: SQLERROR/SQLERRWS (Q-48), DB2 index DDL (Q-86), consumer of DD020 (Q-83/Q-84) |
- L66: | Kind | Legacy | DB2 |
- L119: | Item | Legacy | DB2 | Verdict |
- L124: | DATE-YMD (L123-126) | never referenced in legacy | dropped | OK (dead) |
- L144: | Case | Legacy | DB2 | Verdict |
- L156: | Structure | Legacy | DB2 | Note |
- L205: | ID | Sev | Line | Finding | DB2 |

## Open / referenced COBOL-team questions

- `Q-48`
- `Q-86`
- `Q-83`
- `Q-84`
- `Q-62`
- `Q-57`
- `Q-85`
- `Q-59`

## Important report findings to preserve

- L207: | L-01 | Medium | L266-268 | NO-VMBEVCP-FND not excluded → stale VMBEVCP area → possible spurious record (§10) [INF] | not reproduced (V-03), Q-57 |
- L208: | L-02 | Low | L148 | `X(16) NOT = 0` compares with '0' + spaces → always true [INF]; empty selection still sweeps the whole area, writes nothing | stops at once (V-02), same output |
- L209: | L-03 | Low | L176-181, L250-257, L267 | 300 entries → no zero sentinel: DUBBELS reads table1(301+) and UITGIFTE loops to IND2 = u+2 (> 300) without SSRANGE [INF] | DUPLICATE kept; loop capped (D-04) |
- L210: | L-04 | Info | L210-220 | all-'0' key in input acts as an early dedup sentinel | same code |
- L211: | L-05 | Info | L95, L102, L289, L295 | NR-CIO-FORM-AS / NR-CIO-GDIFC 9(8) → 9(6) high-order truncation | retained (DEC(8) → 9(6)) |
- L212: | L-06 | Info | L73, L291, L208 | `DATA RECORD IS INREC` on OUTFILE; WCT-OPG-FORM-AS ← CT-CAUSE-EVPR; `TABEL-EXIT SECTION` owns VUL-TABEL | retained |
- L218: | V-01 | One area sweep → up to 299 per-issue join cursors (LRO-02 filters in WHERE) |
- L219: | V-02 | No DB access when the selection is empty |

## Reusable rule IDs already present

- `RST-08`
- `PLAT-01`
- `LRO-Z310-1`
- `LRO-02`
- `LRO-N130-1`
- `ERR-01`
- `ERR-03`
- `HLP-06`
- `DATE-N015-1`
- `NAME-03`
- `DATE-YMD`
- `ORD-01`
- `MSG-N620-1`
- `ERR-N130-1`
- `LRO-N595-1`
- `CMT-01`
- `CMT-N590-1`
- `LRS-09`
- `DATE-01`
- `DATE-Z310-1`
- `HLP-Z310-1`
- `DATE-N130-1`
- `MSG-01`
- `PLAT-02`
- `HLP-07`
- `DATE-02`
- `ORD-N130-1`
- `ERR-02`
- `ERR-N620-1`
- `PROC-01`
- `XPG-01`
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
