# IDMS → DB2 Migration Analysis — Complete Starter Package

This is a **documentation-led analysis workflow** for studying how a senior Mainframe COBOL developer converted the supplied IDMS programs into manually converted DB2 COBOL programs. It is intended for use with GitHub Copilot Chat in VS Code or another approved coding assistant that can inspect the opened workspace.

**This ZIP does not contain your application source files and has not analyzed your 50 programs.** Put your actual files in the input folders, configure the project, then run Phase 1. The assistant must report missing files and must not invent evidence.

## Quick start — follow in order

1. **Extract this ZIP** to a working folder, for example `D:\Hexaware\IDMS_DB2_Migration_Professional`.
2. **Open that extracted folder as the VS Code workspace root** (`File → Open Folder…`). Do not open only the `Migration-Playbook` subfolder.
3. Copy your real source files into the six folders under `Mainframe/workspace/`:
   - `IDMS Programs/` — original IDMS COBOL programs.
   - `DB2 Manual converted Programs/` — senior developer's manual DB2 COBOL equivalents.
   - `Mapping/` — mapping workbooks/CSVs and any mapping notes.
   - `Schema/` — IDMS schema, LRF, record/set/relationship definitions.
   - `Dclgens/` — DB2 DCLGENs.
   - `Copybook/` — copybooks used by the programs.
4. Open `Migration-Analysis/MIGRATION_CONFIG.md`. Complete the required configuration before asking Copilot to analyze:
   - Confirm or replace the program naming rules in section 2.
   - Enter the eight decommissioned record names in section 4.
   - Enter both the original and replacement names for the Restart and Buffer objects in section 5.
   - Add mapping workbook/sheet details if needed.
5. **Save a backup or use source control.** The workflow is analysis-only; original COBOL and supporting inputs must not be edited.
6. In VS Code, open **Copilot Chat**, switch to **Agent** mode if available, and attach/reference the following files using the chat context/file picker:
   - `Migration-Playbook/IDMS_DB2_MIGRATION_PLAYBOOK.md`
   - `Migration-Playbook/PHASE_1_BASELINE.md`
   - `Migration-Playbook/MAINFRAME_QUESTION_STANDARD.md`
   - `Migration-Analysis/MIGRATION_CONFIG.md`
   - `Migration-Playbook/PROMPTS/PHASE_1_PROMPT.md`
7. Copy the Phase 1 prompt from `Migration-Playbook/PROMPTS/PHASE_1_PROMPT.md` into Copilot Chat and send it. **The Markdown files are instructions, not auto-running scripts**; you must explicitly ask Copilot to execute the prompt.
8. Let Copilot inventory the workspace first. Confirm it found the expected IDMS programs, manual DB2 programs, mappings, schemas, DCLGENs and copybooks. If it reports missing files or mismatched pairs, fix those before trusting the analysis.
9. Let Phase 1 complete. Review `Migration-Analysis/Phase-1/Run-NNN/COVERAGE_AND_VALIDATION.md` first, then individual program reports, four generic guides and the `_audit/` evidence. Do not accept a report that claims coverage it did not actually inspect.
10. Review the individual question files created under `Migration-Analysis/Human-in-Loops/`. Send only those material, evidence-backed questions to the Mainframe COBOL team.
11. Put the team's answer in each question file's **Human answer** block. Preserve the question and evidence; do not rewrite the question to force a desired answer. Leave it blank if the team has not decided.
12. For Phase 2, attach/reference:
    - `Migration-Playbook/IDMS_DB2_MIGRATION_PLAYBOOK.md`
    - `Migration-Playbook/PHASE_2_ANSWER_APPLICATION.md`
    - `Migration-Playbook/MAINFRAME_QUESTION_STANDARD.md`
    - `Migration-Analysis/MIGRATION_CONFIG.md`
    - the selected completed Phase 1 run folder
    - all files in `Migration-Analysis/Human-in-Loops/`
    - `Migration-Playbook/PROMPTS/PHASE_2_PROMPT.md`
13. Send the Phase 2 prompt. Confirm it writes to a **new** `Migration-Analysis/Phase-2/Run-NNN/` folder and leaves Phase 1 unchanged.
14. Review `ANSWER_IMPACT.md`, `COVERAGE_AND_VALIDATION.md`, revised program reports and generic guides. Record any decisions still unresolved.

## Run order

**Configuration → Phase 1 baseline → Mainframe team answers → Phase 2 answer application → human review.**

Do not start Phase 2 before a Phase 1 run exists and relevant human answers have been recorded.

## What the package should produce

For each Phase 1 run:
- One evidence-backed report for each successfully paired IDMS/manual DB2 program.
- Four conditional generic guides:
  1. non-LRF retrieval
  2. non-LRF update/restart
  3. LRF retrieval
  4. LRF update/restart
- `COVERAGE_AND_VALIDATION.md`
- `_audit/` inventory, pairing, evidence and cross-program applicability records.
- Individual files in `Human-in-Loops/` only for genuine, material, unresolved program-specific conversion decisions.

For each Phase 2 run:
- Revised program reports and the same four generic guides.
- `COVERAGE_AND_VALIDATION.md`
- `ANSWER_IMPACT.md`
- `_audit/` records linking answers to changed reports/rules.
- Unanswered decisions remain unresolved.

## Non-negotiable analysis safeguards

- Preserve original business logic and execution order. Do not reorder paragraphs or PERFORM/THRU flow just to standardize numbering.
- Treat the manual DB2 program as evidence of the developer's approach, not automatic proof of correctness.
- Preserve FILLER, OCCURS, REDEFINES, copybook layout and helper variables unless evidence supports a change; flag uncertainty.
- Analyze LRF parent/child semantics, cursor lifecycle, SQL status/error paths, restart/buffer behavior, mappings and DCLGEN types where relevant.
- Apply generic rules only conditionally and cross-verify them against all applicable programs. Record exceptions.
- Never invent table/column names, mappings, decommissioned records, answers, tests or runtime results.
- Do not edit original application files.
- Do not claim compilation, execution, DB2 runtime, or regression success unless those checks were actually performed.
- Zero human questions is a valid outcome.

## Folder guide

- `Migration-Playbook/` — master rules and phase procedures.
- `Migration-Playbook/PROMPTS/` — ready-to-copy prompts for Copilot.
- `Migration-Playbook/STEP_BY_STEP_VSCODE.md` — detailed VS Code/Copilot workflow.
- `Migration-Playbook/TROUBLESHOOTING.md` — common workflow issues.
- `Migration-Playbook/Templates/` — consistent report and question formats.
- `Mainframe/workspace/` — place your actual source artifacts here.
- `Migration-Analysis/MIGRATION_CONFIG.md` — project-specific names and conversion configuration.
- `Migration-Analysis/Human-in-Loops/` — question files and recorded answers.
- `Migration-Analysis/Phase-1/` and `Phase-2/` — generated reports, separated by phase and run.

## Important limitation

The ZIP is a workflow/template package, not a completed migration analysis. Its source folders are intentionally empty. The quality and coverage of the output depend on the actual files available to Copilot and its context/tool limits. For a large codebase, run in manageable batches only if each run records exactly which programs were included and what remains uncovered.
