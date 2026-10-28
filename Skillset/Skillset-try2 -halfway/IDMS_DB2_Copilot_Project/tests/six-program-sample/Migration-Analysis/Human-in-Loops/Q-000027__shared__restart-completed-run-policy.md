# Q-000027 — Completed-run and rerun policy

## Identity and affected scope

- Stable question key: `restart-completed-run-policy`
- First seen: Phase-1/Run-001
- Affected case IDs: VM1BD526-C013, VM1BD567-C009
- Affected rules: RULE-009
- Guides: G02, G04

### Exact affected files

- `IDMS Programs/VM1BD526.cbl`
- `DB2 Manual converted Programs/VMDZ1526.txt`
- `IDMS Programs/VM1BD567.cbl`
- `DB2 Manual converted Programs/VMDZ1567.cbl`

## Observed behavior

Targets mark completion at EOF and invoke USERABEN on a later complete row.

Legacy FFRECAB listings have no analogous completion flag; they reposition and reach EOF.

Retention 15 or 7 days is stored as data; no cleanup is shown.

### Evidence

- `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 337–379
- `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 287–349
- `IDMS Programs/VM1BD526.cbl` physical lines 120–145
- `IDMS Programs/VM1BD567.cbl` physical lines 111–143

## One business or missing-evidence question

Is it intended that a checkpoint with CO-ID-RS = 1 makes a same-key rerun abend, including an empty-input completed run, and who may reset or retire that row?

## Why the answer matters

This is a new externally visible outcome and may affect scheduler success criteria, replay policy and retention.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
For test only, accept completed same-key reruns as a planned rejection and explicitly retain that policy difference from legacy.

Applies to these programs / business conditions:
VM1BD526.cbl, VM1BD567.cbl. Only the question's stated condition and the isolated six-program rehearsal.

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
