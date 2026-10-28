# Six-program rehearsal — results and rework

**Artifact/workflow result: PASS — 21 named checks.** Both phases are complete as document sets: six program reports and four generic guides in each phase. **All six migration assessments remain PARTIAL** because real business approval, several dependencies and mainframe execution evidence are unavailable.

The rehearsal used the actual supplied `Input.rar`. Its 30 extracted input/support files, 30 normalized working copies and original archive retain their recorded SHA-256 hashes. No application source, DCLGEN, mapping sheet, copybook or schema was changed. All 59 files in the completed Phase 1 baseline remain byte-identical after Phase 2.

## 1. What was produced

| Item | Phase 1 | Phase 2 |
| --- | --- | --- |
| Verified IDMS/Db2 pairs | 6 | Same 6 pairs |
| Complete program report documents | 6 | 6 complete revised reports |
| Generic guides | 4 | 4 complete revised guides |
| Migration cases | 60 | All 60 rechecked against scoped answers |
| Generic rules | 33 | Same stable IDs, revised conditional explanations |
| Rule/program applicability rows | 198 = 33 × 6 | All 198 rechecked; source dispositions retained separately from test assumptions |
| Question files | 39 unanswered snapshots | 36 provided synthetic answers and 3 deferred responses |
| Real human-approved answers | 0 | 0 |
| Production question state | All 39 OPEN | All 39 OPEN |
| Mainframe execution | Not performed | Not performed |

The generic categories are retrieval without LRF; update/restart without LRF; LRF retrieval; and LRF update/restart. Cases can belong to more than one category, so guide case totals overlap. The distinct corpus total is 60.

Read [Phase 1 coverage](Migration-Analysis/Phase-1/Run-001/COVERAGE_AND_VALIDATION.md), [Phase 2 coverage](Migration-Analysis/Phase-2/Run-001/COVERAGE_AND_VALIDATION.md), and [ANSWER_IMPACT.md](Migration-Analysis/Phase-2/Run-001/ANSWER_IMPACT.md) for the complete identities, case crosswalk and answer effects. [SIMULATED_ANSWERS.md](SIMULATED_ANSWERS.md) shows the temporary policies in one place; each question still has its own editable Markdown file.

## 2. Validation actually executed

| Level | Executed result | Interpretation |
| --- | --- | --- |
| Phase 1 artifact validator | PASS; 6,436 checks | Inventory/report identities, declarations of coverage, source/evidence hashes and ranges, case/rule links, questions and required files are consistent. |
| Phase 2 artifact validator | PASS; 9,924 checks | The complete revised package is consistent; exact answer versions/scopes and all frozen baseline files are verified. |
| Packaged workflow regression suite | PASS; 21 named checks | Both valid runs pass, deliberate invalid copies fail, source/history integrity holds and repeated validation changes no delivered test bytes. |
| Five source-informed Python models | PASS; all five stated assertions | Shows specific checkpoint, restart, projection, ordering and cutoff consequences under explicitly constructed assumptions. |
| Navigation state model | 2,801 sequences; zero equivalence failures across three simplified state implementations | Supports a possible existing-state alternative to the extra D flag on the modeled successful paths. |
| Navigation boundary/counterexample checks | 12 passed assertions | Covers date-window edges, operation filtering, encounter order, equal-date ties and DATE-format assumptions. |
| LRF static source reconciliation | 84 SELECT columns match 84 FETCH hosts in order; all resolve to the supplied DCLGEN | Static projection/declaration reconciliation for VMDZ7200. |
| LRF output arithmetic | 432 + 46 + 52 = 530 bytes | Declared-length arithmetic only; it does not prove identical business or filler bytes. |
| LRF def-use review | Missing capital projection confirmed in VMDZ4310 | This is a detected source defect, not a passing business-output test. |

The individual artifact checks are small structural assertions, not thousands of independent business tests. A successful assertion that demonstrates a counterexample means the model detected the documented problem; it does not mean the migration passed that business scenario.

Machine-readable results:

- [ARTIFACT_TEST_RESULTS.json](ARTIFACT_TEST_RESULTS.json)
- [REASONING_MODEL_RESULTS.json](REASONING_MODEL_RESULTS.json)
- [NAVIGATION_SIMULATION_RESULTS.json](NAVIGATION_SIMULATION_RESULTS.json)
- [LRF_STATIC_RESULTS.json](LRF_STATIC_RESULTS.json)

### The 21 workflow checks

The 16 negative checks run in disposable copies. Their PASS result means the validator rejected the intentionally invalid copy.

| Check | Result |
| --- | --- |
| Complete Phase 1 package | PASS |
| Complete Phase 2 package | PASS |
| Missing program report is detected | PASS |
| Missing matrix row is detected | PASS |
| Duplicate matrix row is detected | PASS |
| Changed source bytes are detected | PASS |
| An unlisted extensionless IDMS member is detected | PASS |
| Changed Phase 1 baseline is detected | PASS |
| Changed consumed answer bytes are detected | PASS |
| Promotion of a synthetic answer to human acceptance is rejected | PASS |
| Import of a synthetic answer into production mode is rejected | PASS |
| Answer application outside accepted program scope is rejected | PASS |
| A matrix case belonging to another program is rejected | PASS |
| A rule answer outside its case/applicability scope is rejected | PASS |
| Invalid matrix source evidence is rejected | PASS |
| Human-confirmed evidence without an accepted real answer is rejected | PASS |
| Question ID differing from its snapshot heading is rejected | PASS |
| A blank answer cannot be accepted as human intent | PASS |
| Original/normalized input files and RAR retain supplied hashes | PASS |
| Superseded synthetic drafts and final answer retain exact hashes | PASS |
| Repeated validation preserves all delivered test bytes | PASS |

## 3. Material source findings retained in Phase 2

| Finding | Evidence and consequence | Phase 2 interpretation |
| --- | --- | --- |
| Missing capital-amount projection | VMDZ4310 initializes `DCLDZBEFFTV`, projects `NX_CPCRESK` twice, omits `AM_CNDSTK`, then reads `AM-CNDSTK` when `NX-CPCRESK = 0`. Target physical lines 219–263 and 393–399; legacy lines 247–253. | Q-000013 requires preservation of the original capital amount for the test. The defect remains; a Python example exposes 12,500 becoming initialized zero. No source fix was made. |
| Checkpoint serialization changes length | Both restart targets initially provide a 1,215-byte payload, but later checkpoint UPDATEs set the transmitted length to 15. The copied 1,200-byte record portion is not thereby persisted. | Q-000032 chooses a count-only protocol for the rehearsal. Duplicate record storage becomes a conditional removal candidate, while the initial 1,215-byte form remains an implementation inconsistency. |
| Legacy 567 counter does not implement its apparent normal batch cadence | Ordinary legacy reading/processing does not increment `CTR-REC`; the target introduces successful-read counting and the 100-record boundary. | Q-000021 treats the target cadence as an intended repair for the test. This is an explicit behavior change from the delivered legacy source, not strict equivalence. |
| Short-input restart guard is missing in VMDZ1567 | Count-based positioning does not stop at EOF as required by the simulated fail-closed policy; the subsequent read is still attempted. | Q-000033 defines rejection and preservation of the last durable checkpoint. The target gap remains. |
| Restart counters can narrow the saved value | The persistent count has 15 digits; the active cumulative fields have five digits in 526 and seven in 567. No range guard establishes safe restoration for larger counts. | Safe-range happy fixtures and explicit boundary failures are distinguished. Reuse of the existing 15-digit count is a proposal requiring lifetime/skip-bound analysis. |
| Row order changes business selection | Legacy first/last encountered events are compared with generated-ID SQL ordering. Same rows in another order can change selected CI, event or output association. | Q-000016 permits greatest-ID selection for the 526 fixture; Q-000023 retains the original first `0092` for 310. These answers are deliberately not generalized across programs. |
| Mapping and DCLGEN disagree on a composite key | The CSV says CHAR(20), while the supplied DCLGEN/target uses CHAR(28); the source uses packed/mixed legacy components. | Q-000017 defines a temporary 8+8+6+3+3 display representation. The original CSV conflict, loader specification and zero-date scope remain unresolved. |
| LRF outcomes are more specific than a generic “not found” | The 310 schema distinguishes missing parent, empty child set and exhaustion of filtered children. The target merges the two child-related diagnoses. | Q-000022 requires all three fatal outcomes to remain distinguishable. The diagnostic gap remains. |
| Archive LR path does not require a parent join | The selected `SWEEP-VMBFAS` path is a form-area sweep. A parent record appearing elsewhere in the LR definition does not make its lookup part of this path. | The generic LRF guide preserves the selected path and its actual predicates. No extra parent join is invented. |
| Archive field lengths do not prove byte compatibility | The target rebuilds the 530-byte output field by field and blanks filler areas; some legacy filler bytes may carry packed data. | Q-000005 keeps named-field and filler compatibility unresolved. The corrected Q-000025 concerns the separate 20-byte parameter input. |
| Some added helpers are optional | The 420 D flag can be compared with existing `WS-STATUS` state; other date/key/record-copy groups require exact type and lifetime analysis. | The 2,801-sequence model supports a specific alternative under its stated domain. Typed conversion to packed decimal remains necessary where required; no COBOL optimization was applied or compiled. |

The complete evidence and qualified conclusions are in the revised program reports:

- [VM1BD526 → VMDZ1526](Migration-Analysis/Phase-2/Run-001/programs/VM1BD526.cbl__migration.md)
- [VM1BD567 → VMDZ1567](Migration-Analysis/Phase-2/Run-001/programs/VM1BD567.cbl__migration.md)
- [VM4BD302 → VMDZ4302](Migration-Analysis/Phase-2/Run-001/programs/VM4BD302.cbl__migration.md)
- [VM4BD310 → VMDZ4310](Migration-Analysis/Phase-2/Run-001/programs/VM4BD310.cbl__migration.md)
- [VM4BD420 → VMDZ4420](Migration-Analysis/Phase-2/Run-001/programs/VM4BD420.cbl__migration.md)
- [VM7BD200 → VMDZ7200](Migration-Analysis/Phase-2/Run-001/programs/VM7BD200.cbl__migration.md)

## 4. Generic-rule cross-check result

| Source-based disposition | Rows |
| --- | ---: |
| APPLIES_SUPPORTS | 10 |
| APPLIES_VARIANT | 9 |
| APPLIES_CONTRADICTS | 1 |
| UNKNOWN | 80 |
| NOT_APPLICABLE | 98 |
| **Total** | **198** |

Support means the narrowly stated visible behavior supports that particular rule. It is not whole-program approval. NOT_APPLICABLE means the specified direct/selected-path condition is absent; it does not certify behavior hidden in missing dependencies. UNKNOWN remains where business policy, ordering, types, DDL, error routines or operational evidence is absent.

Phase 2 keeps these source dispositions because source bytes and physical dependencies are unchanged. It adds the exact scoped test policies and case reassessments. The complete grid appears in every revised guide and in [rule-applicability.json](Migration-Analysis/Phase-2/Run-001/_audit/rule-applicability.json).

## 5. Rework made after exercising the project

The project was revised in response to concrete checks:

- Portable report and baseline paths now use forward slashes, including on Windows.
- Answer acceptance requires a substantive answer body and explicit program scope. A changed response-state flag alone is insufficient.
- Matrix rows must use cases belonging to the correct input and rule; source evidence paths, ranges and hashes are checked for cases, rules, questions and matrix entries.
- Generic-rule answer scope recognizes a separately evidenced application beyond its original example cases. A question-linked applicable/UNKNOWN matrix row is required; a NOT_APPLICABLE row cannot authorize it. The regression suite exercises both the legitimate additional 4310 recovery application and an invalid scope change.
- Phase 1 question-index links open preserved unanswered snapshots, while the active question folder can contain later answers.
- Synthetic provenance cannot be promoted to real human acceptance or silently imported into production mode. Exact baseline and answer histories are fingerprinted.
- The Phase 2 semantic review corrected Q-000025's input/output role and made the supersession field consistent with the corrected answer. Both earlier synthetic drafts remain preserved. The skill now requires checking the factual premise of a question as well as its answer.
- A single displayed source-hash spacing typo is corrected in Phase 2. Machine hashes and source bytes were always correct. The frozen Phase 1 report is retained with an explicit erratum.

See [DOCUMENTATION_CORRECTIONS.md](DOCUMENTATION_CORRECTIONS.md) for the exact source evidence, answer versions and scope clarifications. Preserving the issued baseline makes the correction history reviewable.

## 6. Missing inputs and unperformed validation

Three questions are explicitly deferred even in the rehearsal:

| Question | Still required |
| --- | --- |
| Q-000011 | Confirmed persistent-buffer identity and actual producer/consumer, transaction, replay and cleanup paths |
| Q-000012 | Exact build/runtime context, site standards, generated members and missing dependency implementations |
| Q-000015 | The eight approved decommission identities and their retained business obligations |

No approved decommission identities were supplied: **0 known, 8 unresolved**. Mapping observes `FFRECAB → DZ01RSTB`, while executed SQL uses `DZ01RSTV`; the actual view/base relationship remains unproved. `FFRECAT → DZ01FFTB` is a mapping candidate, not an established persistent-buffer lifecycle.

The other 36 answers are synthetic scenario choices. They do not supply actual `VMDZ205I`, `VMDZ510I`, `VMDZ270I`, SQLERROR/SQLERRWS, generated IDMS members, called executables, DDL/constraints, loader rules, JCL or consumer specifications. These gaps remain recorded even when the test has a clear expected outcome.

**Not performed:** COBOL precompile, compile/link, Db2 bind or SQL execution, real IDMS execution, actual crash/restart and uncertain-commit recovery, overlapping-run/concurrency tests, real data/byte-image reconciliation, or execution inside the user's VS Code/GitHub Copilot installation. The Python models do not simulate all language/runtime behavior and do not prove these properties.

## 7. Execute it yourself

Use [TEST_README.md](TEST_README.md) for a preserved sample rerun, and the [main project README](../../README.md) for your real environment. Run checks from the project root:

```bash
python tools/validate_migration_run.py --run "tests/six-program-sample/Migration-Analysis/Phase-1/Run-001"
python tools/validate_migration_run.py --run "tests/six-program-sample/Migration-Analysis/Phase-2/Run-001"
python tools/test_project.py
python "tests/six-program-sample/scenario_models.py"
python "tests/six-program-sample/navigation_scenarios.py"
```

Copilot performs the analysis when you invoke the packaged skill. These Python commands validate the saved artifacts or run the explicitly labelled reasoning models; they do not invoke Copilot or migrate COBOL automatically. For a real Phase 2 run, use the actual business answers and supplied dependencies in the production folders. The rehearsal's synthetic answers remain under `tests/`.
