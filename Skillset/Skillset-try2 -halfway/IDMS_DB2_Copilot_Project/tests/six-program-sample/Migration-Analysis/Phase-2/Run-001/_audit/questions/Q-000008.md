# Q-000008 — Archive order and F-TELLER association

## Identity and affected scope

- Stable question key: `archive-order-7200`
- First seen: Phase-1/Run-001
- Affected case IDs: VM7BD200-C006
- Affected rules: RULE-025
- Guides: G01, G03, G04

### Exact affected files

- `IDMS Programs/VM7BD200.cbl`
- `DB2 Manual converted Programs/VMDZ7200.cbl`

## Observed behavior

The same eligible form set can receive different per-form sequence numbers when its order changes.

### Evidence

- `IDMS Programs/VM7BD200.cbl` physical lines 192–200
- `DB2 Manual converted Programs/VMDZ7200.cbl` physical lines 371–371
- `DB2 Manual converted Programs/VMDZ7200.cbl` physical lines 597–598

## One business or missing-evidence question

Is output order, including the F-TELLER number associated with each form, a business contract? May the same form set be ordered by Db2 surrogate NR_ID instead of original area order? State tie and concurrency rules.

## Why the answer matters

The same eligible form set can receive different per-form sequence numbers when its order changes.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
SIMULATED_FOR_TEST: Order is not business-significant, but F-TELLER must be unique and contiguous within an extract. Retain the production question and require row-set reconciliation.

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
