# Q-000031 — Legacy checkpoint transfer at cutover

## Identity and affected scope

- Stable question key: `restart-key-cutover-policy`
- First seen: Phase-1/Run-001
- Affected case IDs: VM1BD526-C008, VM1BD567-C004
- Affected rules: RULE-028
- Guides: G01, G02

### Exact affected files

- `IDMS Programs/VM1BD526.cbl`
- `DB2 Manual converted Programs/VMDZ1526.txt`
- `IDMS Programs/VM1BD567.cbl`
- `DB2 Manual converted Programs/VMDZ1567.cbl`

## Observed behavior

Legacy keys use VM1BDF526-A / VM1BDF567-A, DATE-YMD8 and NS-SET-FF=0.

Targets use VMDZ1526 / VMDZ1567, phase 1 and a SQL DATE; no legacy checkpoint import is shown.

### Evidence

- `IDMS Programs/VM1BD526.cbl` physical lines 120–138
- `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 324–355
- `IDMS Programs/VM1BD567.cbl` physical lines 111–129
- `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 269–318

## One business or missing-evidence question

When moving these jobs from IDMS to Db2, are existing FFRECAB checkpoints converted to the new program/phase/date key, or is a verified fresh input/data boundary required before the first Db2 run?

## Why the answer matters

An absent new checkpoint can cause all input to be replayed even if corresponding legacy business work was committed; event INSERT replay can duplicate business events.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
Test only: start with an empty target/checkpoint state and a fresh immutable input; separately test an explicit legacy-count conversion fixture.

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
