# Q-000019 — Rerun after partial monthly mutation output

## Identity and affected scope

- Stable question key: `file-rerun-contract-4310`
- First seen: Phase-1/Run-001
- Affected case IDs: VM4BD310-C007
- Affected rules: RULE-015, RULE-017
- Guides: G01, G02, G03, G04

### Exact affected files

- `IDMS Programs/VM4BD310.cbl`
- `DB2 Manual converted Programs/VMDZ4310.txt`

## Observed behavior

No persisted checkpoint connects input position, output records, and sequence counters.

### Evidence

- `IDMS Programs/VM4BD310.cbl` physical lines 132–134
- `IDMS Programs/VM4BD310.cbl` physical lines 315–329
- `DB2 Manual converted Programs/VMDZ4310.txt` physical lines 189–190
- `DB2 Manual converted Programs/VMDZ4310.txt` physical lines 478–494

## One business or missing-evidence question

After failure with some mutation records already written, must the job replace the partial output and rerun the same immutable input from the start, or must downstream processing deduplicate or resume it?

## Why the answer matters

No persisted checkpoint connects input position, output records, and sequence counters.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
SIMULATED_FOR_TEST: Discard partial output and rerun the immutable input. This is an operational test assumption, not evidence of actual JCL behavior.

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
