# Q-000028 — Overlapping job ownership

## Identity and affected scope

- Stable question key: `restart-concurrent-run-ownership`
- First seen: Phase-1/Run-001
- Affected case IDs: VM1BD526-C011, VM1BD567-C010
- Affected rules: RULE-001
- Guides: G02, G04

### Exact affected files

- `IDMS Programs/VM1BD526.cbl`
- `DB2 Manual converted Programs/VMDZ1526.txt`
- `IDMS Programs/VM1BD567.cbl`
- `DB2 Manual converted Programs/VMDZ1567.cbl`

## Observed behavior

Both targets select then update the same checkpoint key without a job/partition token, compare-and-swap predicate or explicit lock clause.

No supplied scheduler/JCL or target constraints establish single ownership.

### Evidence

- `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 324–355
- `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 401–460
- `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 269–318
- `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 356–423

## One business or missing-evidence question

Are overlapping executions with the same program, phase and business date forbidden by the scheduler, or must the restart implementation acquire and validate an ownership token/lock?

## Why the answer matters

Concurrent runs may process the same records, race checkpoint INSERTs or overwrite progress; supported database isolation alone is not evidence of application ownership.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
Simulated test may enforce one active owner per key in its harness; the source still contains no ownership check.

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
