# Six-program sample: review and repeat the two-phase rehearsal

This folder contains the supplied `Input.rar`, its 30 extracted files, byte-identical working copies, and a complete two-phase analysis of the six IDMS/Db2 program pairs. **Everything in this rehearsal stays under `tests/`.** The top-level `Mainframe/workspace/` and `Migration-Analysis/` remain available for your real environment.

Phase 1 records what the supplied files establish and creates unanswered questions. Phase 2 applies temporary assistant-written answers because you explicitly requested a rehearsal. Those answers are marked `SIMULATED_FOR_TEST`; they are not business approval. Read [TEST_RESULTS.md](TEST_RESULTS.md) for the recorded checks and their outcomes.

## 1. What was supplied

| IDMS file | Manually converted Db2 file | Principal flows examined |
| --- | --- | --- |
| `VM1BD526.cbl` | `VMDZ1526.txt` | Event updates, LRF parent/child paths, checkpoint and restart |
| `VM1BD567.cbl` | `VMDZ1567.cbl` | Direct record update, count-based checkpoint and restart |
| `VM4BD302.cbl` | `VMDZ4302.txt` | Nested retrieval, event selection, service call and output |
| `VM4BD310.cbl` | `VMDZ4310.txt` | LRF parent/child retrieval, capital calculation and output |
| `VM4BD420.cbl` | `VMDZ4420.cbl` | Nested retrieval, event-state decisions and output |
| `VM7BD200.cbl` | `VMDZ7200.cbl` | LRF area sweep, archive selection and output layout |

The archive also supplies seven copybooks, seven DCLGENs, three schema/LRF files and one mapping CSV. The mapping has 870 data rows plus its header, but 877 physical lines because some quoted cells span lines. Source evidence uses physical file lines; mapping references distinguish logical rows from physical lines.

[SOURCE_MANIFEST.json](SOURCE_MANIFEST.json) records every original archive path, normalized working path, byte count, encoding, physical line count and SHA-256 hash. Folder names were normalized for the configured workflow; program and dependency contents were preserved.

| Archive folder | Working folder below `Mainframe/workspace/` |
| --- | --- |
| `IDMS Program/` | `IDMS Programs/` |
| `Manual Convereted DB2 Program/` | `DB2 Manual converted Programs/` |
| `DCLGen/` | `Dclgens/` |
| `Schema-LR/` | `Schema/` |
| `Copybook/` | `Copybook/` |
| `Mapping Sheet/` | `Mapping/` |

`VMDZ1526.txt` is decoded as cp1252; the other supplied files decode as UTF-8 with optional BOM. Keep their original bytes and COBOL columns. `VM4BD302.cbl` and `VM4BD310.cbl` happen to have the same byte length; their contents, hashes and identities differ.

## 2. How the delivered run is organized

```text
tests/six-program-sample/
  TEST_README.md
  TEST_RESULTS.md
  SIMULATED_ANSWERS.md
  SOURCE_MANIFEST.json
  source-archive/Input.rar
  source-original/                    Original extracted names and bytes
  Mainframe/workspace/               Normalized working paths; same bytes
  Migration-Analysis/
    MIGRATION_CONFIG.md
    Human-in-Loops/                  Editable current question/answer files
    _control/                       Stable question registry and current run
    Phase-1/Run-001/
      programs/                     Six complete program reports
      generic/                      Four generic guides
      COVERAGE_AND_VALIDATION.md
      _audit/                       Sources, cases, rules, matrix, blank questions
    Phase-2/Run-001/
      programs/                     Six complete revised reports
      generic/                      Four revised generic guides
      ANSWER_IMPACT.md
      COVERAGE_AND_VALIDATION.md
      _audit/                       Exact consumed answers and revised ledgers
  scenario_models.py
  navigation_scenarios.py
  NAVIGATION_SIMULATION_RESULTS.json
```

Each phase covers **60 migration cases and 33 generic rules**, with one applicability row for every rule/program combination: **33 × 6 = 198 rows**. A case can contribute to more than one guide. The guides are:

1. `01_RETRIEVAL_WITHOUT_LRF.md`
2. `02_UPDATE_RESTART_WITHOUT_LRF.md`
3. `03_LRF_RETRIEVAL.md`
4. `04_LRF_UPDATE_RESTART.md`

There are **39 independently answerable question files**. Phase 1 snapshots all 39 with no answer consumed. In Phase 2, 36 receive temporary test answers and three remain deferred. All 39 retain `production_resolution: OPEN` because no actual business owner supplied these answers.

The three deferred items are:

| Question | Missing information |
| --- | --- |
| `Q-000011` | Whether the proposed buffer mapping represents the intended buffer and its actual producer, consumer, replay and cleanup lifecycle |
| `Q-000012` | Build/runtime context and missing generated or site dependency members |
| `Q-000015` | The approved list of eight decommissioned record identities and their business scope |

Other test answers clarify hypothetical intent but cannot supply absent copybook contents, error routines, DDL, load rules or operational evidence. Such gaps remain visible in the revised reports.

The second pass corrected Q-000025's interface role: `VMDZ270I` is a 20-byte archive parameter input, while the 530-byte output is declared inline. It also corrected one displayed hash typo. [DOCUMENTATION_CORRECTIONS.md](DOCUMENTATION_CORRECTIONS.md) records both and links the preserved answer drafts. The issued Phase 1 baseline remains unchanged; Phase 2 uses the corrected final answer version.

## 3. Review Phase 1, questions and Phase 2

Open the **project root** in VS Code: `IDMS_DB2_Copilot_Project`, containing `.github/` and the main README. Do not open only this test folder if you want automatic workspace-skill discovery.

1. Read [the Phase 1 coverage report](Migration-Analysis/Phase-1/Run-001/COVERAGE_AND_VALIDATION.md). It explains the inventory, pairings, case coverage and evidence limits.
2. Open a program report under `Migration-Analysis/Phase-1/Run-001/programs/`. Each report traces IDMS operations, mapped Db2 fields, DCLGEN types, working-storage helpers, error/cursor flow, layouts, LRF paths and recovery behavior.
3. Read the Phase 1 questions through `_audit/QUESTIONS_INDEX.snapshot.md`. The question snapshots under `_audit/questions/` preserve their original unanswered state. The active `Human-in-Loops/` folder now contains the later simulated answers.
4. Read [SIMULATED_ANSWERS.md](SIMULATED_ANSWERS.md) to see which assumptions were supplied for the rehearsal and their exact scopes.
5. Read [Phase 2 ANSWER_IMPACT.md](Migration-Analysis/Phase-2/Run-001/ANSWER_IMPACT.md), then the revised program reports and four guides. Compare a questioned case with its Phase 1 version. Business intent and observed implementation are assessed separately.
6. Read [TEST_RESULTS.md](TEST_RESULTS.md) for the validation performed and the defects or missing evidence that remain.

A source defect remains a defect even when a simulated answer explains the intended behavior. For example, clarifying the expected capital amount does not add a missing SQL projection, and choosing a count-only restart policy does not repair a missing short-input guard. No supplied COBOL file was changed by the analysis.

## 4. Run the supplied checks

Run these commands in VS Code's terminal **from the project root**, using Python 3.10 or newer. On Windows, replace `python` with `py -3` if necessary; on Linux/macOS, use `python3` when appropriate. Quote paths when your extracted project location contains spaces.

```bash
python tools/validate_migration_run.py --run "tests/six-program-sample/Migration-Analysis/Phase-1/Run-001"
python tools/validate_migration_run.py --run "tests/six-program-sample/Migration-Analysis/Phase-2/Run-001"
python tools/test_project.py
python "tests/six-program-sample/scenario_models.py"
python "tests/six-program-sample/navigation_scenarios.py"
```

No pip installation, API key or separate server is needed for these utilities. They do not invoke Copilot; Copilot performs the document analysis when you run the prompts in the next section.

| Check | What it establishes | What it does not establish |
| --- | --- | --- |
| `validate_migration_run.py` | Input/report census, source fingerprints, required sections/guides, case/rule/matrix links, evidence ranges, question snapshots, answer scope/provenance and immutable Phase 1 baseline | Correct COBOL semantics, successful compilation or production suitability |
| `test_project.py` | Both saved runs pass artifact validation; deliberately damaged temporary copies are rejected; original/archive hashes and repeated validation remain consistent | Full migration correctness or operation inside your Copilot installation |
| `scenario_models.py` | Five small source-informed reasoning models expose checkpoint length, input-order restart, missing projection, event order and date-cutoff consequences | Execution of the supplied COBOL or SQL |
| `navigation_scenarios.py` | Compares simplified successful-path event-state models and boundary/counterexample cases, including an existing-state alternative to an extra helper flag | IDMS currency, Db2 ordering/error behavior, packed-decimal runtime behavior or transaction recovery |

The artifact validator is read-only. The negative tests mutate and delete temporary copies. `scenario_models.py` prints JSON. `navigation_scenarios.py` refreshes only its own `NAVIGATION_SIMULATION_RESULTS.json`; it does not edit application sources or either phase baseline.

For validator output, exit code `0` means artifact checks passed, `1` means validation failed, and `2` means command-line usage was invalid. A model's passing result means its stated assertions held under its stated assumptions. It does not turn a documented defect or counterexample into a passing migration.

## 5. Repeat Phase 1 in Copilot without overwriting the delivered run

Use a **separate copy** for a fresh exercise. This keeps the shipped test results and both `Run-001` baselines available for comparison. The following preparation prompt asks Copilot to create `tests/six-program-rehearsal-002/`, restore blank questions from the original Phase 1 snapshots, and produce a new `Run-002` there.

Start a new workspace-capable Copilot chat at the project root and enter:

```text
/analyze-idms-db2-migration Prepare and execute a fresh Phase 1 test rehearsal.

Copy tests/six-program-sample/ to tests/six-program-rehearsal-002/.
If the destination already exists, inspect it and resume its unfinished run;
do not overwrite a completed run or existing answer text.
Keep tests/six-program-sample/ unchanged.

In the copied Migration-Analysis/MIGRATION_CONFIG.md set:
- Phase: 1
- Input root: tests/six-program-rehearsal-002/Mainframe/workspace/
- Output root: tests/six-program-rehearsal-002/Migration-Analysis/
- Test root: tests/six-program-rehearsal-002/
- Previous phase/revision: blank
- Execution mode: TEST_REHEARSAL
- Simulated answers allowed: only for the later explicitly requested Phase 2

Preserve both copied Phase-1/Run-001 and Phase-2/Run-001 exactly.
Preserve the copied current Human-in-Loops folder as
Human-in-Loops-Delivered-Phase2 before preparing new editable questions.
Restore the original unanswered questions into Human-in-Loops by reading
Phase-1/Run-001/_audit/questions.json: use each raw_snapshot's exact bytes
and its recorded source_file as the destination relative to Migration-Analysis.
Restore the original question index from
Phase-1/Run-001/_audit/QUESTIONS_INDEX.snapshot.md.
Preserve stable question IDs and keep the answer backup unchanged.

Reanalyze all six program pairs from the supplied sources without consuming
the copied Phase 2 answers or treating its conclusions as new evidence.
This is an explicitly requested new exercise: write Phase-1/Run-002.
Create six complete reports, all four guides, full rule/program coverage,
and question files for unresolved business or implementation evidence.
Continue without asking me business questions in chat.
Preserve all source bytes and completed baselines. Run the validator.
```

After Copilot finishes, validate the new baseline:

```bash
python tools/validate_migration_run.py --run "tests/six-program-rehearsal-002/Migration-Analysis/Phase-1/Run-002"
```

The copy contains historical reports whose saved configuration paths still describe the original run. Preserve those historical snapshots. Only the live copied configuration and new run should use the rehearsal-002 paths. If you are simply checking an unchanged completed result, run the validator instead of asking Copilot to duplicate it.

## 6. Add answers and execute Phase 2

For an actual human-answer exercise, edit the question files under `tests/six-program-rehearsal-002/Migration-Analysis/Human-in-Loops/`. Keep the `HUMAN-ANSWER-START` and `HUMAN-ANSWER-END` markers. Enter the answer, applicable filenames/business conditions, exceptions and supporting evidence. Use `Answer origin: HUMAN` only for a real human response. Leave unknown items blank or deferred.

To repeat the assistant-answer demonstration instead, explicitly request simulated answers. For example:

```text
For this test rehearsal only, fill temporary answers in
tests/six-program-rehearsal-002/Migration-Analysis/Human-in-Loops/.
Label every assistant-written answer SIMULATED_FOR_TEST and scope it to
the affected program cases. Retain production_resolution OPEN.
Use the delivered SIMULATED_ANSWERS.md as a test-fixture reference only.
Do not invent missing copybooks, schemas, DDL, decommission identities,
buffer behavior or successful runtime tests. Keep those gaps open.
Preserve the unanswered Phase-1/Run-002 snapshots.
```

Then change the copied configuration to **Phase `2`**, with **Previous phase/revision `Phase-1/Run-002`**, and run:

```text
/analyze-idms-db2-migration Execute Phase 2 using
tests/six-program-rehearsal-002/Migration-Analysis/MIGRATION_CONFIG.md.
Baseline: tests/six-program-rehearsal-002/Migration-Analysis/Phase-1/Run-002.
Read the saved questions and answers in the configured Human-in-Loops folder.
Preserve exact answer text and both historical Run-001 folders and Run-002
Phase 1. Write the complete revised set to Phase-2/Run-002.
Recheck every generic rule against every program and apply each answer
only within its recorded scope. Keep observed defects and unresolved gaps.
Produce ANSWER_IMPACT.md, six reports, four guides and all audit ledgers.
Run the artifact validator and report what was and was not verified.
```

Validate and review:

```bash
python tools/validate_migration_run.py --run "tests/six-program-rehearsal-002/Migration-Analysis/Phase-2/Run-002"
```

Read that run's `ANSWER_IMPACT.md` and compare the revised cases with `Phase-1/Run-002`. An answer that requests behavior absent from the code should expose an implementation gap. It should not silently alter the code finding or make the report production-complete.

`tools/test_project.py` always checks the **delivered** `tests/six-program-sample/` fixture. Use `validate_migration_run.py --run ...` for your newly generated rehearsal. Do not repoint the delivered fixture merely to make its tests accept different output.

## 7. Move to your real environment

Follow [the main README](../../README.md), especially its input preparation and Phase 1/Phase 2 sections. Use the top-level production configuration with `PRODUCTION_ANALYSIS` and simulated answers disabled. Supply your actual program-name rules, eight decommission record names, two replacement object names, dependencies and business answers there.

The delivered files demonstrate source analysis, question handling, conditional synthesis and repeatable artifact checks. COBOL precompile, compile/link, Db2 execution, real crash/restart, concurrency and business-output reconciliation remain separate checks to perform in an authorized environment. This project was not executed inside your particular VS Code/Copilot installation.
