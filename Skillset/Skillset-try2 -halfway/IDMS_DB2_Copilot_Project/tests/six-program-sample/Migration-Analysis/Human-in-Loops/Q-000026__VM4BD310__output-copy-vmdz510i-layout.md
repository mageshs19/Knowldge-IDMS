# Q-000026 — Converted mutation-output copybook

## Identity and affected scope

- Stable question key: `output-copy-vmdz510i-layout`
- First seen: Phase-1/Run-001
- Affected case IDs: VM4BD310-C004, VM4BD310-C005, VM4BD310-C007, VM4BD310-C008
- Affected rules: RULE-002, RULE-022, RULE-017, RULE-023
- Guides: G01, G02, G03, G04

### Exact affected files

- `IDMS Programs/VM4BD310.cbl`
- `DB2 Manual converted Programs/VMDZ4310.txt`

## Observed behavior

The target references VMDZ510I, but only VMBD510I is supplied.

### Evidence

- `IDMS Programs/VM4BD310.cbl` physical lines 99–101
- `DB2 Manual converted Programs/VMDZ4310.txt` physical lines 150–152
- `Copybook/VMBD510I.cpy` physical lines 1460–1481

## One business or missing-evidence question

Supply VMDZ510I and confirm the exact 1500-byte mutation-output layout, all aliases and OCCURS/REDEFINES against supplied VMBD510I.

## Why the answer matters

The actual target output declarations, offsets and array initialization cannot be validated.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
SIMULATED TEST ASSUMPTION: VMDZ510I retains the supplied VMBD510I layout with the top-level name changed. No physical copybook is created or claimed present; byte compatibility and build closure remain unresolved.

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
