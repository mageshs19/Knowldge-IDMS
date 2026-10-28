# Troubleshooting

## Copilot gives only a plan or outline
Tell it explicitly: “Do not stop at a plan. Inspect the actual workspace files, perform the analysis, and create the Markdown artifacts in the required run folder. If you cannot access a file, list it as blocked instead of inventing results.” Ensure Agent mode or a file-editing-capable workflow is enabled and relevant files are attached.

## Copilot cannot see the files
- Confirm VS Code opened the extracted project root, not a parent directory or only `Migration-Playbook/`.
- Check files physically exist under the correct `Mainframe/workspace/` subfolder.
- Add the exact files/folders as context using your VS Code/Copilot version's file picker or `#file` feature.
- For large folders, provide explicit file lists and run controlled batches.
- Never paste sensitive production source into an unapproved assistant.

## Program names do not match
Do not pair based on a similar name alone. Update section 2 of `MIGRATION_CONFIG.md` with the confirmed rule or explicit pair mapping. Require Copilot to record pairing evidence and confidence. Keep ambiguous programs unpaired until verified.

## A workbook or PDF is unreadable
Ask Copilot to identify the filename and exact unavailable information. If allowed, export a workbook sheet to CSV or provide searchable text/OCR output from the PDF. Keep the original artifact and document the export used. Never infer a mapping solely from a table/column name that looks plausible.

## The run stops halfway through
Require a coverage report that names each processed and unprocessed program. Continue with controlled batches and unique output locations. Do not report “all 50 complete” unless every required pair and supporting artifact has actually been analyzed.

## Copilot overwrites previous reports
Stop the run. Restore from source control/backup if needed. Re-run with an explicit instruction to select the next unused `Run-NNN` directory and never overwrite any prior run. Review output paths before accepting changes.

## Too many generic or speculative questions
Reapply `MAINFRAME_QUESTION_STANDARD.md`. A valid question must be specific to an actual conversion decision, have exact source/target evidence, and have a material business-semantic consequence. Delete no human answers; revise the analysis process and regenerate only through a controlled new run. Zero questions is allowed.

## Copilot claims compilation or runtime validation
Require it to identify the command/tool actually executed and the result artifact. If no compiler, DB2 environment or test harness was used, the report must say `NOT PERFORMED` or `NOT VERIFIED`.

## It changes business execution order or removes FILLER/helper variables
Reject that transformation unless supported by explicit evidence and authorized decision. This workflow analyzes and documents migration behavior; it must not silently rewrite application source. Preserve original execution sequence, record layouts and special restart/buffer behavior.

## How to name run folders
Use the next unused sequence, such as `Run-001`, `Run-002`, `Run-003`. Never assume the example number is available; inspect the folder first.
