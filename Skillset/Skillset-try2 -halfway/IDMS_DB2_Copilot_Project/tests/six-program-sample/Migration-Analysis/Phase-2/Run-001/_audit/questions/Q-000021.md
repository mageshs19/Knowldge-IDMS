# Q-000021 — Legacy counter defect and intended commit unit

## Identity and affected scope

- Stable question key: `legacy-567-counter-intent`
- First seen: Phase-1/Run-001
- Affected case IDs: VM1BD567-C007, VM1BD567-C010
- Affected rules: RULE-010, RULE-001
- Guides: G02, G04

### Exact affected files

- `IDMS Programs/VM1BD567.cbl`
- `DB2 Manual converted Programs/VMDZ1567.cbl`

## Observed behavior

Legacy CTR-REC starts at zero and is never incremented during ordinary READ or VERWERKING.

Only restart PERFORM VARYING changes CTR-REC; it is not reset after positioning.

Target increments its counters on each successful READ, resets the batch counter after positioning, and checks >99 after each update.

### Evidence

- `IDMS Programs/VM1BD567.cbl` physical lines 56–60
- `IDMS Programs/VM1BD567.cbl` physical lines 117–141
- `IDMS Programs/VM1BD567.cbl` physical lines 147–176
- `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 230–250
- `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 283–283
- `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 328–349

## One business or missing-evidence question

Is the intended checkpoint the count of successfully processed physical input records, committed every 100 such records, and is the conversion authorized to repair the supplied legacy CTR-REC behavior?

## Why the answer matters

A correct intended 100-record checkpoint implementation differs materially from this supplied legacy listing; static equivalence and business correctness must be assessed separately.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
For an explicitly simulated policy answer, declare a successful-record count and 100-record atomic batches as intended, treating the legacy counter issue as a defect and the target cadence as a repair subject to validation.

Applies to these programs / business conditions:
VM1BD567.cbl. Only the question's stated condition and the isolated six-program rehearsal.

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
