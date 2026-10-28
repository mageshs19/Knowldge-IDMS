# Step-by-step: Run this project with GitHub Copilot in VS Code

## A. Prepare the project

1. Extract the ZIP.
2. Open the extracted project root in VS Code.
3. Confirm Explorer shows `README.md`, `Migration-Playbook/`, `Mainframe/`, and `Migration-Analysis/`.
4. Place the actual input files in the correct `Mainframe/workspace/` folders. Do not flatten all file types into one folder.
5. Confirm the manual DB2 program files are the senior developer's converted counterparts, not generated outputs from a different tool.
6. Edit and save `Migration-Analysis/MIGRATION_CONFIG.md`.
7. Check that every program can be paired unambiguously. If names differ, enter the verified mapping in the config or add a mapping note. Never rely on a naming guess alone.

## B. Start Phase 1 (first run)

1. Open Copilot Chat.
2. Choose Agent mode if your installed Copilot version offers it. Agent mode is useful because it can inspect multiple files and create reports. If Agent mode is unavailable, use the supported chat/edit workflow in smaller batches.
3. Add the master playbook, Phase 1 instructions, question standard, config and Phase 1 prompt as context. Use the file/context picker or the `#file` mechanism supported by your VS Code version.
4. Open `Migration-Playbook/PROMPTS/PHASE_1_PROMPT.md`, copy the prompt text, and send it to Copilot Chat.
5. Ask Copilot to do the input inventory first and show a concise inventory summary before deep analysis.
6. Check the inventory against your actual source folders:
   - number of IDMS programs found;
   - number of manual DB2 programs found;
   - paired/unpaired programs;
   - mapping files, schemas, DCLGENs and copybooks found.
7. If any expected files are missing, stop and fix the folder/configuration issue. Do not let Copilot fill gaps with assumptions.
8. Continue the run. Ask it to create real reports and evidence, not merely an outline or a plan.
9. Verify that the output is in a new `Migration-Analysis/Phase-1/Run-NNN/` folder. A new run should not overwrite an earlier run.
10. Review `COVERAGE_AND_VALIDATION.md`. If only some programs were processed due to context limits, the report must say so clearly. Continue with a tracked batch if needed.

## C. Review Phase 1 output

Review in this order:

1. `COVERAGE_AND_VALIDATION.md` — actual coverage, missing inputs, pair confidence, limitations and checks.
2. `_audit/` — file inventory, program pairing, evidence index, generic rule applicability matrix (names may be documented in the playbook).
3. `programs/` — one report per program pair.
4. `generic/` — the four conditional guides.
5. `Migration-Analysis/Human-in-Loops/` — only real, unresolved program-specific questions.

For each program report, verify the assistant did not:
- infer business behavior without evidence;
- mistake a manual target choice for proof that the choice is correct;
- change original execution order;
- remove FILLER or helper variables without evidence;
- conflate LRF and non-LRF logic;
- apply a generic rule to a program where its conditions are not met;
- claim a mapping or runtime validation that was not performed.

## D. Send questions to the Mainframe COBOL team

1. Open each Markdown question file in `Migration-Analysis/Human-in-Loops/`.
2. Check the exact source and target evidence paths and locations.
3. Send only material questions that the files do not already answer.
4. Have the reviewer fill in the `Human answer` section.
5. Preserve the question ID and evidence. Use the expected response format (normally YES/NO). Do not fill answers on behalf of the reviewer.
6. If no valid questions were generated, do not create artificial questions.

The eight decommissioned record names and Restart/Buffer replacement names are configuration inputs. Edit those in `Migration-Analysis/MIGRATION_CONFIG.md`, not as human-loop questions.

## E. Start Phase 2

1. Confirm Phase 1 output exists and team answers have been entered.
2. Update the phase/current-run fields in `Migration-Analysis/MIGRATION_CONFIG.md` as described in that file.
3. Open `Migration-Playbook/PROMPTS/PHASE_2_PROMPT.md`.
4. In Copilot Chat, attach/reference the master playbook, Phase 2 instructions, question standard, current config, the exact Phase 1 run folder, and every question file.
5. Copy the Phase 2 prompt and send it.
6. Ask Copilot to list which questions have explicit answers and which remain blank before applying changes.
7. Ensure output is written to a new `Migration-Analysis/Phase-2/Run-NNN/` folder. Phase 1 and original inputs must remain unchanged.
8. Review `ANSWER_IMPACT.md` to confirm each answer is linked to the affected program reports and generic rule IDs.
9. Review the Phase 2 coverage report and all changed rules. An answer is a human decision, not a substitute for code validation.

## F. If Copilot reaches a context or tool limit

Do not ask it to pretend that all 50 programs were analyzed. Use controlled batches:
- keep the same project configuration and naming rules;
- define a clearly named batch, such as `Batch-01`;
- explicitly list included program pairs and supporting artifacts;
- store batch evidence and mark the remaining programs as not yet analyzed;
- do not consolidate a generic rule as universal until it has been checked against every applicable program;
- after all batches, run a consolidation pass that reads every batch report and produces a coverage matrix.

If Copilot cannot read a workbook, PDF, or a large file, ask it to state the limitation and identify the exact missing evidence. Convert/export the source artifact to an accessible format only if permitted by your project process, and retain the original.
