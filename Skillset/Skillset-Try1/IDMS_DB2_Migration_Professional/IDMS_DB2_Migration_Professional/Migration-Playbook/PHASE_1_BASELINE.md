# Phase 1 — Baseline Analysis Instructions

Use with `IDMS_DB2_MIGRATION_PLAYBOOK.md`. Run this phase first, after the user has filled any known decisions in `Migration-Analysis/MIGRATION_CONFIG.md`.

## Objective
Build an evidence-backed baseline of how the senior developer manually migrated each supplied IDMS program to DB2. Do not apply guessed rules to fill gaps.

## Procedure
1. Inventory the source workspace recursively and identify all IDMS programs, manual DB2 programs, mapping sheets, schemas, DCLGENs and copybooks.
2. Pair programs using explicit configuration first, then normalized program identifiers and business/code evidence. Fuzzy names alone are not enough.
3. Analyze each pair individually before generalizing.
4. Trace fields through mapping sheet → DB2 table/column → DCLGEN → COBOL host variable and usage.
5. Compare source/target behavior for IDMS verbs, LRF parent-child paths, cursors, SQL status handling, working-storage changes, occurrences, copybooks, decommissioned records, Restart/Buffer objects and execution order.
6. Create one report per IDMS program under `Migration-Analysis/Phase-1/Run-NNN/programs/`.
7. Create four conditional generic guides under `generic/`: non-LRF retrieval; non-LRF update/restart; LRF retrieval; LRF update/restart.
8. Cross-check each proposed generic rule against all relevant programs. Include conditions, exclusions, exceptions and evidence.
9. Apply the strict question policy in the master playbook. Write one Markdown file per genuine unresolved program-specific conversion decision in the shared `Migration-Analysis/Human-in-Loops/` folder. If there are no material doubts, leave the folder with only its README.
10. Write `COVERAGE_AND_VALIDATION.md` and `_audit/` records.

## Program report sections
1. Program pair and input artifacts.
2. Business purpose and original execution sequence.
3. IDMS construct → actual DB2 replacement.
4. Field/record/table/column/DCLGEN mapping.
5. LRF and parent-child semantics, if applicable.
6. Cursor lifecycle and SQL status/error paths.
7. Working-storage/helper-variable justification.
8. OCCURS/REDEFINES/FILLER/copybook compatibility.
9. Decommissioned-record handling.
10. Restart/Buffer behavior.
11. COBOL/DB2 standards observed.
12. Behavior differences, defects and material unresolved questions.
13. Evidence index and program-specific versus reusable rules.

## Output rule
Do not overwrite existing runs. Choose the next unused `Run-NNN`. Phase 1 outputs are immutable baseline artifacts after completion.
