# IDMS to Db2 migration analysis with GitHub Copilot

This project teaches an assistant to reconstruct how the supplied IDMS COBOL programs were manually converted to Db2, document each program, and derive conditional rules across the entire corpus. It includes a completed six-program rehearsal in a separate test folder, with an unanswered Phase 1 baseline and a Phase 2 run using explicitly simulated answers.

The workflow creates analysis documents. The Python utility validates their structure and fingerprints. It is not an automatic COBOL converter or a mainframe compiler.

## 1. Project structure

```text
IDMS_DB2_Copilot_Project/
  README.md
  .github/
    copilot-instructions.md
    skills/analyze-idms-db2-migration/
      SKILL.md
      assets/
      references/
      scripts/validate_run.py
    prompts/
      idms-db2-phase1.prompt.md
      idms-db2-phase2.prompt.md
  tools/
    validate_migration_run.py
    test_project.py
  Mainframe/workspace/
    Copybook/
    Dclgens/
    Schema/
    IDMS Programs/
    DB2 Manual converted Programs/
    Mapping/
  Migration-Analysis/
    MIGRATION_CONFIG.md
    Human-in-Loops/
  tests/six-program-sample/
    TEST_README.md
    TEST_RESULTS.md
    source-archive/Input.rar
    source-original/
    Mainframe/workspace/
    SOURCE_MANIFEST.json
    Migration-Analysis/
      MIGRATION_CONFIG.md
      Human-in-Loops/
      _control/
      Phase-1/Run-001/
      Phase-2/Run-001/
```

The top-level input and output folders are for your real environment. Everything from the supplied six-program archive, including the complete two-phase test, remains under `tests/six-program-sample/`. Do not mix these inputs or answers with a production run. Empty source directories are intentional; do not add placeholder files inside `IDMS Programs/`, because every file there becomes an inventory item.

## 2. Set up VS Code and Copilot

1. Extract the ZIP and use **File → Open Folder** to open `IDMS_DB2_Copilot_Project`, the directory containing `.github` and this README.
2. Use a current stable VS Code with GitHub Copilot configured through your organization-approved account. Choose a chat/agent session that can read and write workspace files. Select **Agent** when your interface offers that role.
3. Open **Chat: Open Customizations** from the Command Palette. Confirm that `analyze-idms-db2-migration` is discovered as a workspace skill. Start a fresh chat and invoke it explicitly for the first run. Check the response References/tool activity to confirm it reads `SKILL.md` and the required references.
4. Python **3.10 or newer** is needed only for the supplied validation commands. No pip packages, API keys or separate application server are required by this project. On Windows, use `py -3` instead of `python` if that is your installed command; on Linux/macOS, use `python3` if appropriate.

The canonical skill is in `.github/skills/`, which current VS Code documentation supports for both Copilot and Local sessions. Optional `.prompt.md` shortcuts are in `.github/prompts/`. Current VS Code documentation says prompt files run in **Local** harness sessions; Copilot sessions use skills for reusable workflows. Choosing a model or the Agent role does not by itself change the harness. If your managed installation exposes no Local selector, use the direct skill invocation below. See [VS Code Agent Skills](https://code.visualstudio.com/docs/agent-customization/agent-skills), [prompt files](https://code.visualstudio.com/docs/agent-customization/prompt-files), and [custom instructions](https://code.visualstudio.com/docs/agent-customization/custom-instructions). Guidance checked 2026-10-28; UI labels can vary by installed version.

Do not configure experimental forked-context skill settings just to use this project. If discovery is unavailable in your version, use the explicit-file fallback in section 9.

## 3. Prepare the real input

Copy your files into the top-level `Mainframe/workspace/` directories. Supply every IDMS member and its manual Db2 conversion, including `.cbl`, `.txt` or extensionless members. Keep the original source encoding, fixed/free format and actual filename spelling.

Put the field mapping workbook/CSV in `Mainframe/workspace/Mapping/` or another accessible location and record its path. The assistant must use the actual sheet and column headers. The sample CSV uses `Cobol Recrd IDMS`, `Cobol Zone`, `New DB2 Record `, `New DB2_Field name` and `New DB2 DataType`; these are examples, not mandatory headers for your real workbook. Record logical CSV rows separately from physical lines when quoted cells span several lines.

Open **`Migration-Analysis/MIGRATION_CONFIG.md`** and edit:

| Configuration | What to supply |
| --- | --- |
| Phase | `1` for the initial analysis |
| Input/output roots | Paths relative to the opened repository root |
| Mapping path and headers | Exact workbook/CSV, sheet and header identities |
| Naming rules or explicit pairs | Your actual program-name convention and exceptions |
| Eight decommission records | Exact IDMS or Db2 names, namespace and business scope |
| Two replacement rows | Exact restart and buffer target names |
| Versions and dependencies | Compiler/Db2/IDMS versions, options, copybooks, schema/LRF paths, error routines and site standards |
| Execution mode | Keep `PRODUCTION_ANALYSIS` |
| Simulated answers allowed | Keep `No` |

Blank values remain unknown. Phase 1 will create question files and continue. You do not need to invent answers to start.

### Program names

The default rule is limited to `VM1BD### → VMDZ1###`. The six supplied samples also demonstrate families `VM4BD### → VMDZ4###` and `VM7BD### → VMDZ7###`; the test configuration records all six exact pairs. Enable additional production rules only for your verified scope. You can replace the rule in the Markdown configuration or explicitly in your run prompt, including your alternative convention `vm1b720 → DZvm1720`.

A filename transformation produces a candidate. The analyst must also verify unique target existence, `PROGRAM-ID`, dependencies and business-flow correspondence. Source members are never renamed by this analysis.

## 4. Execute Phase 1

In a new Copilot chat, enter:

```text
/analyze-idms-db2-migration Execute Phase 1.
Use Migration-Analysis/MIGRATION_CONFIG.md.
Resolve paths from this opened project root.
Analyze every configured IDMS input and its supplied manual Db2 conversion.
Produce one report per IDMS file, all four generic guides, the full
rule/program applicability matrix, and one question file per independent doubt.
Continue without waiting for business answers. Preserve application source.
Do not use tests/ as production input.
Run the bundled artifact validator and report remaining evidence gaps.
```

With a **Local** session that supports prompt files, the equivalent shortcut is:

```text
/idms-db2-phase1 Use Migration-Analysis/MIGRATION_CONFIG.md.
```

You may also run **Chat: Run Prompt** and select `idms-db2-phase1` in a supported Local session.

### Expected Phase 1 result

```text
Migration-Analysis/
  MIGRATION_CONFIG.md
  Human-in-Loops/
    QUESTIONS_INDEX.md
    Q-000001__scope__topic.md
    ...one file per independent question...
  _control/
    questions-registry.json
    current-run.json
  Phase-1/Run-001/
    programs/...one complete report per IDMS input...
    generic/
      01_RETRIEVAL_WITHOUT_LRF.md
      02_UPDATE_RESTART_WITHOUT_LRF.md
      03_LRF_RETRIEVAL.md
      04_LRF_UPDATE_RESTART.md
    COVERAGE_AND_VALIDATION.md
    _audit/
```

For 50 IDMS files, the run contains **50 program reports and four generic guides**, plus questions and audit files. Mixed programs can contribute cases to several guides. A complete document set can still have `PARTIAL` or `BLOCKED` program assessments when evidence is missing.

Run the package check in VS Code's terminal:

```bash
python tools/validate_migration_run.py --run Migration-Analysis/Phase-1/Run-001
```

The validator checks report identities, source hashes, fifteen report sections, all four guides, case/rule links, the complete rule × program matrix, question snapshots and answer provenance. A `PASS` means these artifact checks passed. It does not mean the migration compiles or behaves correctly.

## 5. Answer the Phase 1 questions

Open `Migration-Analysis/Human-in-Loops/QUESTIONS_INDEX.md`. Each linked question names the affected IDMS and Db2 files, the source evidence, the exact business decision and its impact.

Edit only the section between `HUMAN-ANSWER-START` and `HUMAN-ANSWER-END` in each question. Example:

```markdown
Response state: PROVIDED

Answer origin: HUMAN

Answer:
The checkpoint count represents input records fully committed before restart.

Applies to these programs / business conditions:
State the actual filenames and the job/business conditions.

Exceptions:
State exceptions, or explicitly say none are known.

Supporting business reference or evidence:
Reference the actual operational specification or supplied evidence.

Answered by / date (optional):
Actual reviewer / date.
```

That text is an example of the answer format, not a policy to adopt. Use your actual business rule. Leave unknown answers blank or mark them `DEFERRED`. Partial answers are allowed. Do not rename question IDs, remove the markers, or replace source findings with your answer. If an answer changes a previous policy, identify the superseded policy and scope explicitly.

For a missing copybook/schema/DDL question, provide the real artifact in the configured input/dependency root and reference it. A sentence saying a missing declaration exists cannot substitute for its contents.

## 6. Execute Phase 2

In the same configuration file, change **Phase** to `2` and set **Previous phase/revision** to `Phase-1/Run-001`. Keep the same output root and `Human-in-Loops/` directory. Save all edited question files.

Start a new chat if the previous conversation is long, then enter:

```text
/analyze-idms-db2-migration Execute Phase 2.
Use Migration-Analysis/MIGRATION_CONFIG.md.
Baseline: Migration-Analysis/Phase-1/Run-001.
Read all saved answer files in Migration-Analysis/Human-in-Loops/.
Preserve the completed baseline and exact human answer text.
Apply each answer only to its documented scope and recheck its source evidence.
Publish the complete revised program reports, four guides, coverage,
ANSWER_IMPACT.md and audit ledgers under the next Phase-2 revision.
Recheck every rule against every program, retain code defects and unresolved
questions, and run the bundled artifact validator.
```

Optional Local prompt shortcut:

```text
/idms-db2-phase2 Use Migration-Analysis/MIGRATION_CONFIG.md.
```

Validate the completed revision:

```bash
python tools/validate_migration_run.py --run Migration-Analysis/Phase-2/Run-001
```

Read `ANSWER_IMPACT.md` first: it records the exact answer versions, accepted scope, changed conclusions, affected program cases/guides, and remaining issues. Phase 2 contains all reports and four guides again. Phase 1 remains unchanged. Further changed answers produce a new revision, such as `Phase-2/Run-002`; an unchanged rerun should reuse the existing coherent result instead of duplicating question IDs.

## 7. Inspect and rerun the included six-program test

Start with [the sample test README](tests/six-program-sample/TEST_README.md) and [test results](tests/six-program-sample/TEST_RESULTS.md). The test includes the original RAR, original extracted names, normalized working paths, source hashes, complete Phase 1 and Phase 2 reports, four guides in each phase, every question and a synthetic answer manifest.

```bash
python tools/validate_migration_run.py --run tests/six-program-sample/Migration-Analysis/Phase-1/Run-001
python tools/validate_migration_run.py --run tests/six-program-sample/Migration-Analysis/Phase-2/Run-001
python tools/test_project.py
```

`test_project.py` checks the saved package and uses temporary copies for deliberate failure cases. It must detect missing reports/matrix coverage, changed sources/baselines/answers, and improper promotion of simulated answers. It does not modify the saved test or your production input.

To run the analysis again with Copilot, explicitly name `tests/six-program-sample/Migration-Analysis/MIGRATION_CONFIG.md`, the test root and the desired phase. Preserve the shipped completed runs. For a fresh Phase 1 exercise, use a new isolated output root under `tests/`, leave its answers empty, and then run Phase 2 after writing answers. Never overwrite the shipped baseline to make a rerun match.

All supplied Phase 2 test answers have `Answer origin: SIMULATED_FOR_TEST`. They were written by the assistant solely because the user requested a temporary rehearsal. The test keeps production questions open, missing artifacts missing, and implementation findings visible. The project was exercised through source analysis and local artifact checks; it was not executed inside your VS Code/Copilot installation or on a mainframe.

The second pass also corrected a question that had mislabelled an archive parameter-input copybook as output, and one displayed hash typo. [Documentation corrections](tests/six-program-sample/DOCUMENTATION_CORRECTIONS.md) explains both. The original Phase 1 files and superseded synthetic answer drafts remain preserved, while Phase 2 uses the corrected question and exact final answer version.

## 8. What the analysis covers

Each report contains fifteen sections: identity; business flow; dependencies; every IDMS-operation replacement; field/type/naming trace; working storage; cursor/transaction flow; SQL and business errors; OCCURS/REDEFINES; LRF normalization; eight decommission entities; restart/buffer protocols; standards/defects; validation; reusable cases and questions.

Generic guides contain conditional rules with source cases and counterexamples. They must distinguish missing parent, missing child, end of traversal, SQL failure, zero changed rows and business rejection. Restart rules must explain completed work, persisted payload, count meaning, commit order, resume/replay and external outputs. Minimal-helper decisions must show exact types, all uses, value lifetime and a concrete reuse alternative where safe.

Site precompile, compile/link, execution, crash/restart, concurrency and business-output reconciliation are separate verification levels. Supply authorized environments/commands in the configuration when available. The assistant must record which were actually performed.

## 9. Troubleshooting

| Situation | Action |
| --- | --- |
| Skill does not appear in `/` | Confirm the project root is open; inspect Chat: Open Customizations; start a fresh chat. Use the explicit-file prompt below if native discovery is unavailable. |
| Prompt shortcuts do not run | Use direct skill invocation. Current prompt-file support depends on the Local harness; follow organization settings. |
| Assistant stops after a few programs | Ask it to continue from the existing run manifest and complete all remaining identities and the full matrix. Do not start a duplicate baseline. |
| Missing mapping/copybook/schema | Retain the precise question, add the real file when available, and rerun the affected phase/revision. |
| Validator fails | Ask Copilot to fix the reported artifact inconsistency while preserving source, answers and completed baselines. Do not change source hashes to hide unexpected input changes. |
| New source or answer after completion | Record new fingerprints, reassess affected cases/rules, and create the next revision. |

Explicit-file fallback:

```text
Read .github/skills/analyze-idms-db2-migration/SKILL.md completely and follow
all its required references. Execute Phase 1 using
Migration-Analysis/MIGRATION_CONFIG.md and the configured input folder.
Write all required files. Continue through business uncertainties by writing
question files. Preserve source and exclude tests/ from this production run.
```

For Phase 2, change the phase and add the baseline and answer-folder paths. This fallback is an instruction to the assistant to read the project files; it does not change your managed VS Code capabilities.
