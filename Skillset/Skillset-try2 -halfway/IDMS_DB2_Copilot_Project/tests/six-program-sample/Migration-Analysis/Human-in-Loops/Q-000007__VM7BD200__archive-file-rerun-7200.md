# Q-000007 — Recovery from a partial archive extract

## Identity and affected scope

- Stable question key: `archive-file-rerun-7200`
- First seen: Phase-1/Run-001
- Affected case IDs: VM7BD200-C007
- Affected rules: RULE-015
- Guides: G01, G03

### Exact affected files

- `IDMS Programs/VM7BD200.cbl`
- `DB2 Manual converted Programs/VMDZ7200.cbl`

## Observed behavior

There is no checkpoint table, persisted last-written key, or atomic Db2/file transaction in the supplied program.

### Evidence

- `IDMS Programs/VM7BD200.cbl` physical lines 192–220
- `DB2 Manual converted Programs/VMDZ7200.cbl` physical lines 585–587
- `DB2 Manual converted Programs/VMDZ7200.cbl` physical lines 874–889

## One business or missing-evidence question

What job and file policy handles a partially written archive extract: recreate from a frozen row snapshot, append with deduplication, or resume? Supply the operational contract.

## Why the answer matters

There is no checkpoint table, persisted last-written key, or atomic Db2/file transaction in the supplied program.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
SIMULATED_FOR_TEST: Discard partial output and recreate it from a frozen read snapshot. Do not claim exactly-once production processing.

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
