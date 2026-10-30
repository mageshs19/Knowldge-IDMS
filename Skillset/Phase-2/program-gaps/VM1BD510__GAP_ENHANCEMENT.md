# Gap / enhancement assessment — VM1BD510

- Source report: `IDMS Programs/VM1BD510.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L3: > **Purpose of this file.** Knowledge base for one program, written for a downstream AI or Python conversion engine. It records what the legacy program does, how the manual DB2 conversion (VMDZ1510) re-implemented it, and where the two differ.
- L13: ## 1. Identity, scope and completion
- L17: | Legacy program | `IDMS Programs/VM1BD510.cbl` (1671 lines; BCI "VALIDATION DES SOUSCRIPTIONS"; history 1987 → 2010/06, project 3312 DMS) |
- L18: | DB2 program | `DB2 Manual converted Programs/VMDZ1510.cbl` (1678 lines; JAINRG, 2026/03) |
- L19: | Program type | Batch **validation / routing** program. Reads one sequential file and writes five. **No database update.** |
- L20: | IDMS access mode | **No DML in the program.** It has `IDMS-CONTROL SECTION` + `PROTOCOL MODE IS BATCH-AUTOSTATUS DEBUG` + `IDMS-RECORDS WITHIN WORKING-STORAGE` (L209-211), but no `SCHEMA SECTION`, no `BIND`, `READY`, `OBTAIN` or `FINISH`. All IDMS access is delegated to the called subprogram **VM9BD05T** (DB "TITRES", records VMBEFF/VMBEVEF; subprogram owns BIND RUN-UNIT, READY AR-VMBEFF1 RETRIEVAL, OBTAIN ... ALL-VMBEVEF-BY-VMBEFF, FINISH). |
- L23: | Completion | Every difference between the two files is listed (complete code diff, comments excluded). Not available in the workspace: `VMDZ205I`, `VMDZ510B`, `VMDZ05`, `VMDZ02` copybooks, `VM9BD02T` / `VMDZ902T` sources, `VM9BC50T`, `VM9BC52T`, `VM9BCKX2`, `VM9SU35T`, `GE9TG002`, `GEDMI03H`, `GE9RLEU1`, `ESDATMAS` sources. |
- L104: | Legacy | DB2 | Status | Note |
- L118: | `VM9BD05T` OPEN (L511) | `VMDZ905T` | **Yes** | `EF5-CO-RETURN ≠ '0000'` → USERABEN | IDMS access module "D.B. TITRES"; DB2 version present in workspace |
- L134: | Item | Legacy | DB2 | Evidence |
- L146: | # | Legacy (caller) | What VM9BD05T did in IDMS | What VMDZ905T does in DB2 | Equivalent? |
- L175: | Field | Legacy | DB2 | Line |

## Open / referenced COBOL-team questions

- `Q-21`
- `Q-22`
- `Q-20`
- `Q-23`
- `Q-24`
- `Q-25`
- `Q-26`

## Important report findings to preserve

- L222: | E-01 | Empty input file | CLOSE + STOP RUN before any DB call (L496-504) | Same | Yes |
- L223: | E-02 | VM9BD05T/VMDZ905T OPEN RC ≠ '0000' | DISPLAY + USERABEN | Same code. **VMDZ905T OPEN always returns '0000'**, so the branch is unreachable | Behaviour change — see D-02 |
- L224: | E-03 | READ: security not found (RETKODE '02', CO-RETURN '3003') | 411 anomaly **only if** `CO-STCIRC-OORD = '9'`; otherwise nothing | Same | Yes |
- L225: | E-04 | READ: several securities (`EF1-DUB = 'Y'`) | 410 anomaly | Same | Yes |
- L226: | E-05 | READ: one security found and `CO-STCIRC-OORD = '1'` (circulation not yet updated, but the security already exists) | 410 anomaly | Same | Yes |
- L227: | E-06 | READ: technical error (CO-RETURN '1114', '2001', '3002', or '3003' with RETKODE ≠ '02') | **Not detected**: the abend condition at L1363-1365 can never be true (D-01). Falls through to the RETKODE / DUB tests | Same dead condition | Yes (defect preserved) |
- L228: | E-07 | READ: database error inside callee | IDMS autostatus in VM9BD05T → abend inside callee [INF] | `SQLERROR` include in VMDZ905T → abend inside callee (SELECTs, OPEN/CLOSE cursor). FETCH error → possible loop (X-01) | Mostly yes |
- L229: | E-08 | VM9BC52T RC ≠ '0000' | DISPLAY only (USERABEN commented out) + anomaly 112 | Same | Yes |
- L276: | D-01 | **High (latent)** | L1363-1365 / seq 133100-133300 | `IF CO-RETURN NOT = '0000' AND CO-RETURN NOT = '3003' AND (CO-RETURN = '3003' AND RETKODE NOT = '02')` is **always false** (`NOT = '3003'` and `= '3003'` together). So technical errors from the READ call ('1114', '2001', '3002', '3003' with RETKODE '13' etc.) never abend. The intended condition was probably `(CO-RETURN NOT = '0000' AND NOT = '3003') OR (CO-RETURN = '3003' AND RETKODE NOT = '02')`. | Legacy **and** DB2 (copied verbatim). [OBS] Report it, do not change it silently (ERR-04). |
- L277: | D-02 | Medium | VMDZ905T seq 017300-017600 vs VM9BD05T L126-180 | **Contract change in the callee.** OPEN no longer validates EF1-DA-PARM. With a bad date PARM the legacy job abends at OPEN; the DB2 job runs on and can produce false 410 anomalies (E-12). Combined with D-01 this hides the error. Fix belongs in VMDZ905T: perform D-PROG at OPEN and return '3003' if RETKODE ≠ '00'. | DB2 only [OBS code / INF impact] |
- L278: | D-03 | Low | seq 073100 (VMDZ905T) | FETCH `WHEN OTHER` without SQLERROR / EOC → possible endless loop (X-01) | DB2 callee only |
- L279: | D-04 | Info | L568 / seq 053500 | `PERFORM RECH-TC-THEOR` is commented out. VM9BD02T → VMDZ902T rename and the VMBD02 → VMDZ02 copybook are dead code. Because the CALL is dynamic, a missing VMDZ902T load module causes no runtime error, but the **copybook VMDZ02 must exist** or the compile fails. | Both |
- L295: | V-03 | Bearer subscription with a 726 failure (severity '2') | ANOMALIE only; not routed |
- L296: | V-04 | Security dossier with only signal controls failing (0XX, 210, 620, 63X-65X, 727-DT) | ANOMALIE records + BOEKHOUD (ERR-CODE back to '000' before the rejection controls) |

## Reusable rule IDs already present

- `PLAT-01`
- `RST-08`
- `ERR-CODE`
- `DATE-IND`
- `DATE-YMD8`
- `HLP-08`
- `DATE-YMD`
- `DATE-01`
- `RST-01`
- `ERR-04`
- `CPY-01`
- `NAME-03`
- `AUD-01`

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
