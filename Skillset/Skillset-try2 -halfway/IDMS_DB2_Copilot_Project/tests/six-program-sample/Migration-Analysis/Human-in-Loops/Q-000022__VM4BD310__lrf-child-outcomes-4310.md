# Q-000022 — Distinguish the three missing-data outcomes

## Identity and affected scope

- Stable question key: `lrf-child-outcomes-4310`
- First seen: Phase-1/Run-001
- Affected case IDs: VM4BD310-C002
- Affected rules: RULE-021
- Guides: G03

### Exact affected files

- `IDMS Programs/VM4BD310.cbl`
- `DB2 Manual converted Programs/VMDZ4310.txt`

## Observed behavior

The original path returns three distinct custom statuses; the target has parent SELECT+100 and filtered-event SELECT+100, merging two child outcomes.

### Evidence

- `IDMS Programs/VM4BD310.cbl` physical lines 190–208
- `Schema/VMBTS07.txt` physical lines 126–135
- `DB2 Manual converted Programs/VMDZ4310.txt` physical lines 265–347

## One business or missing-evidence question

Must parent missing, parent with no events, and parent with events but no event0092 retain distinct diagnostics or rejection categories, even if every condition terminates the batch?

## Why the answer matters

The original path returns three distinct custom statuses; the target has parent SELECT+100 and filtered-event SELECT+100, merging two child outcomes.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
SIMULATED_FOR_TEST: All three conditions are fatal and must remain distinguishable. Preserve the observed diagnostic gap as a separate implementation issue.

Applies to these programs / business conditions:
VM4BD310.cbl. Only the question's stated condition and the isolated six-program rehearsal.

Exceptions:
No production approval. No missing artifact, actual data conversion or successful runtime execution is implied.

Supporting business reference or evidence:
User requested temporary assistant-written answers for this test. These are synthetic scenario choices, not supplied business references.

Answered by / date (optional):
Assistant — synthetic test fixture / 2026-10-28

Supersedes an earlier answer or policy, if applicable:
None. Original unanswered Phase 1 snapshot is preserved.

<!-- HUMAN-ANSWER-END -->

## Analyst assessment

Response detected: PROVIDED

Review state: TEST_ASSUMPTION_ONLY

Question resolution: RESOLVED_FOR_TEST_ONLY

Production resolution: OPEN

Evidence type: SIMULATED_TEST_ASSUMPTION

Applied in: Phase-2/Run-001. Missing evidence and implementation defects remain as recorded in the revised reports and ANSWER_IMPACT.md.
