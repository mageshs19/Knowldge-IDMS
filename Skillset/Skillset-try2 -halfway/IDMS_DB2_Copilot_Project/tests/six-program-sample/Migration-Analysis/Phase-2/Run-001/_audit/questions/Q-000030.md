# Q-000030 — Positional resume input immutability

## Identity and affected scope

- Stable question key: `restart-input-file-identity`
- First seen: Phase-1/Run-001
- Affected case IDs: VM1BD526-C010, VM1BD567-C006
- Affected rules: RULE-026
- Guides: G02, G04

### Exact affected files

- `IDMS Programs/VM1BD526.cbl`
- `DB2 Manual converted Programs/VMDZ1526.txt`
- `IDMS Programs/VM1BD567.cbl`
- `DB2 Manual converted Programs/VMDZ1567.cbl`

## Observed behavior

Resume discards a count of records; it has no business-key greater-than predicate, file generation identifier, checksum or comparison of KY-RESTART.

Duplicate/equal keys are distinguished only by physical file position.

### Evidence

- `IDMS Programs/VM1BD526.cbl` physical lines 126–145
- `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 337–345
- `IDMS Programs/VM1BD567.cbl` physical lines 117–134
- `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 287–303

## One business or missing-evidence question

What guarantees that a resumed job uses the same file generation, exact record sequence and contents as the checkpointed run, and what must happen if that identity cannot be verified?

## Why the answer matters

Reordered, inserted, deleted or substituted input can skip unprocessed work or repeat committed work even when the checkpoint count is numerically correct.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
Test-only assumption: immutable, byte-identical sequential input for every retry; add a negative changed-input scenario rather than claiming the code detects it.

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
