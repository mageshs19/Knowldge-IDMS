# Q-000023 — Which event0092 must be selected?

## Identity and affected scope

- Stable question key: `lrf-event-order-4310`
- First seen: Phase-1/Run-001
- Affected case IDs: VM4BD310-C003
- Affected rules: RULE-025
- Guides: G01, G03, G04

### Exact affected files

- `IDMS Programs/VM4BD310.cbl`
- `DB2 Manual converted Programs/VMDZ4310.txt`

## Observed behavior

The output form key and date depend on the chosen event. Descending surrogate ID is not proved equivalent to the original traversal.

### Evidence

- `IDMS Programs/VM4BD310.cbl` physical lines 200–208
- `DB2 Manual converted Programs/VMDZ4310.txt` physical lines 301–321
- `Schema/VMBTS07.txt` physical lines 124–136

## One business or missing-evidence question

When a stock has multiple event0092 records, must the program choose the first event in the original VMBEFF-VMBEVEF set order, or the event with the greatest relational NR_ID? Please provide the set ORDER definition and the surrogate-ID load and tie rules.

## Why the answer matters

The output form key and date depend on the chosen event. Descending surrogate ID is not proved equivalent to the original traversal.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
SIMULATED_FOR_TEST: Preserve the first event 0092 selected by the original set traversal. Treat the highest-ID selection as unverified until its ordering is proved.

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
