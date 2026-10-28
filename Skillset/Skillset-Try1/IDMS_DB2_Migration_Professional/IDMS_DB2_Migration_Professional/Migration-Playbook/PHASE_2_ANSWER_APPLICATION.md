# Phase 2 — Human Answer Application and Generic Rule Verification

Use after Phase 1 and after the Mainframe COBOL team has answered relevant files under `Migration-Analysis/Human-in-Loops/`.

## Objective
Apply explicit human decisions to the affected program-specific analyses and generic migration rules, while preserving the Phase 1 baseline and answer history.

## Procedure
1. Read the current `Migration-Analysis/MIGRATION_CONFIG.md`, the Phase 1 run, and every question file in `Human-in-Loops/`.
2. Validate that each answer is explicit and matches the question's closed response format. Blank answers remain open.
3. Do not overwrite human-authored answer blocks. Keep question IDs stable.
4. For each answered question, identify affected program reports, mappings, generic rule IDs, exceptions and scenario expectations.
5. Update the relevant Phase 2 program reports and generic guides; record provenance in `ANSWER_IMPACT.md`.
6. Re-evaluate each affected rule against every applicable program. Record `APPLIES`, `APPLIES_WITH_EXCEPTION`, `DOES_NOT_APPLY`, `CONFLICT`, or `NOT_VERIFIED`.
7. If the answer is vague or contradicts source evidence, do not guess. Create a concise linked follow-up question only if the remaining uncertainty is material and specific to the conversion.
8. Keep unanswered questions provisional; never silently promote them to confirmed rules.
9. Preserve all Phase 1 outputs. Write to a new `Migration-Analysis/Phase-2/Run-NNN/`.
10. Report changes, coverage, unresolved questions, conflicts and checks actually performed.

## Output
- `programs/`: one revised report per IDMS program.
- `generic/`: four revised generic guides.
- `COVERAGE_AND_VALIDATION.md`.
- `ANSWER_IMPACT.md`.
- `_audit/`: question-to-rule mapping, evidence and cross-program applicability matrix.

Do not claim the human answer proves code correctness. Do not claim compilation, execution or regression success unless it was actually performed.
