# Q-000025 — Converted archive-output copybook

## Identity and affected scope

- Stable question key: `output-copy-vmdz270i-layout`
- First seen: Phase-1/Run-001
- Affected case IDs: VM7BD200-C003, VM7BD200-C004
- Affected rules: RULE-011, RULE-012
- Guides: G01, G02, G03, G04

### Exact affected files

- `IDMS Programs/VM7BD200.cbl`
- `DB2 Manual converted Programs/VMDZ7200.cbl`

## Observed behavior

The target references VMDZ270I, but only VMBZ270I is supplied.

### Evidence

- `IDMS Programs/VM7BD200.cbl` physical lines 96–96
- `DB2 Manual converted Programs/VMDZ7200.cbl` physical lines 200–200
- `Copybook/VMBZ270I.cpy` physical lines 10–14

## One business or missing-evidence question

Supply VMDZ270I and confirm the exact archive-output layout and its consumer contract against supplied VMBZ270I.

## Why the answer matters

The actual target cutoff-input declarations cannot be compiled or compared.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
SIMULATED TEST ASSUMPTION: the target output interface follows the supplied legacy archive layout. No physical VMDZ270I is created or claimed present. Original filler bytes and actual consumer compatibility remain unresolved.

Applies to these programs / business conditions:
VM7BD200.cbl. Only the question's stated condition and the isolated six-program rehearsal.

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
