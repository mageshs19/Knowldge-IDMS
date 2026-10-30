# Gap / enhancement assessment — VM1BD255

- Source report: `IDMS Programs/VM1BD255.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L3: > **Purpose of this file.** Knowledge base for one program, written for a downstream AI or Python conversion engine. It records what the legacy program does, how the manual DB2 conversion (VMDZ1255) re-implemented it, and where the two differ.
- L13: ## 1. Identity, scope and completion
- L17: | Legacy program | `IDMS Programs/VM1BD255.cbl` (277 lines; VHEML 17/06/2003) |
- L18: | DB2 program | `DB2 Manual converted Programs/VMDZ1255.cbl` (528 lines; JAINRG 26/12/2025). The PROGRAM-ID is written `PROGRAM-ID. VMDZ1255.` (single space). |
- L19: | Program type | Batch, sequential-file driven, **insert-only** (owner + member). No dispatch: every input record is processed. |
- L20: | IDMS access mode | LRF `VMBTL09-R01`, subschema **VMBTS09**. `IDMS-RECORDS MANUAL`, so the LR and FFRECAB are copied explicitly (`COPY IDMS LR VMBTL09-R01`, `COPY IDMS FFRECAB`, the `SUBSCHEMA-*` control copies). Plus direct DML on FFRECAB. |
- L22: | Completion | All paths analysed. Missing: `VMDZ205I`, `SQLERRWS`, `SQLERROR`. The DCLGENs `DZBSICTV` and `DZMBFCTV` are supplied. |
- L32: | Legacy | DB2 |
- L69: | Kind | Legacy | DB2 |
- L102: | Legacy | DB2 column | Source |
- L125: | AM-INTGR / INB / INBCA / INNET (← AM-CNSNTRN) / INGRT (← AM-CNSBTRN) / AM-CND (← AM-CNS-OORD) | OORD amounts | same-name columns | business renames already present in legacy |
- L139: | ZONE-DATONLY (DATE-YMD / DMY / YMD8 / DMY8) | legacy | Mandatory (run-date derivation, MOVE CORR chain) | keep verbatim |

## Open / referenced COBOL-team questions

- `Q-15`
- `Q-16`
- `Q-02`

## Important report findings to preserve

- L268: | C-01 | **High (decision needed)** | 190/120 -803 handling | Legacy literals `'VMBSIC-EXIST'` / `'VMBFC-EXIST'` never match the path keywords `…-EXISTS`, so legacy skips duplicates; DB2 abends. | Business decision (Q-15). If "preserve actual": `WHEN -803 CONTINUE` on DZMBFCTV, with an optional DISPLAY. |
- L269: | D-01 | Medium | 120-TREAT-PROG date | No 99999999 → 9999-12-31 branch. The IF is period-terminated. | Shared DATE-01 routine. |
- L270: | D-02 | Low | 830 (seq 044100) | `MOVE 15 TO TE-CH-RS-DATA-LEN` on UPDATE, but 1215 on INSERT. KY-RESTART is truncated after the first checkpoint. Restart still works, because NB-READ is in the first 15 bytes. | Use one length constant (1215). |
- L271: | D-03 | Low (shared with legacy) | 810 | No EOF check during positioning (no STOP01). A short input reads past EOF. | Generate the VM1BD250-style STOP01 check in every positioning loop. |
- L272: | D-04 | Info | 810 | `ADD 1 TO TELLER` inside positioning is overwritten by `MOVE +0 TO TELLER`. | Remove. |
- L273: | D-05 | Info | naming | `120-INSERT-DZBSICTV` reuses the prefix 120 (`120-TREAT-PROG`). `190-INSERT-DZBFCTV` targets DZ**MB**FCTV. The DISPLAY text says 'DZMBSICTV'. | Cosmetic. Engine: name paragraphs after the view. |
- L277: | V-01 | Completed rerun abends. |
- L278: | V-02 | Duplicate handling (C-01). |

## Reusable rule IDs already present

- `DATE-02`
- `PLAT-01`
- `DATE-IND`
- `LRS-02`
- `LRS-01`
- `LRS-05`
- `ERR-03`
- `ERR-01`
- `RST-01`
- `RST-02`
- `RST-03`
- `RST-06`
- `RST-04`
- `AUD-01`
- `DATE-01`
- `NAME-02`
- `DATE-YMD8`
- `LRS-03`
- `DATE-YMD`
- `HLP-05`
- `RST-07`

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
