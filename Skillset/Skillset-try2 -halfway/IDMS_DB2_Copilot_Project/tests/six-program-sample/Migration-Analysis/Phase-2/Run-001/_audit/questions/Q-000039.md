# Q-000039 — Partial output and publication for VM4BD420.cbl

## Identity and affected scope

- Stable question key: `navigation-output-recovery-VM4BD420`
- First seen: Phase-1/Run-001
- Affected case IDs: VM4BD420-C004
- Affected rules: RULE-022, RULE-015
- Guides: G01, G02, G03, G04

### Exact affected files

- `IDMS Programs/VM4BD420.cbl`
- `DB2 Manual converted Programs/VMDZ4420.cbl`

## Observed behavior

VMDZ4420.cbl writes a sequential output file outside the Db2 unit of work. No supplied JCL or publication/recovery contract proves how a partial file is handled.

### Evidence

- `IDMS Programs/VM4BD420.cbl` physical lines 159–172
- `IDMS Programs/VM4BD420.cbl` physical lines 215–224
- `DB2 Manual converted Programs/VMDZ4420.cbl` physical lines 243–256
- `DB2 Manual converted Programs/VMDZ4420.cbl` physical lines 316–339

## One business or missing-evidence question

After a failure with some 50-byte output records already written by VMDZ4420.cbl, must the job discard and recreate the partial file from a stable input/database snapshot, or use another recovery and downstream publication policy?

## Why the answer matters

SQL rollback does not establish rollback of already written file records. A rerun can duplicate or publish incomplete business output without an operational file contract.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
SIMULATED TEST POLICY: discard partial output, recreate it from the same immutable input and stable database snapshot, and publish it only after successful completion. This is an external job policy assumed for the test; no JCL or scheduler implementation is supplied or proved.

Applies to these programs / business conditions:
VM4BD420.cbl. Only the question's stated condition and the isolated six-program rehearsal.

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
