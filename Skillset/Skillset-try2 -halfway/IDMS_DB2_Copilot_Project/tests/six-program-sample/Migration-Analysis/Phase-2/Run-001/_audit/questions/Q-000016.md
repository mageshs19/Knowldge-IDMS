# Q-000016 — First matching event versus greatest ID

## Identity and affected scope

- Stable question key: `event-first-selection-order`
- First seen: Phase-1/Run-001
- Affected case IDs: VM1BD526-C004, VM1BD526-C005
- Affected rules: RULE-025, RULE-019
- Guides: G01, G03, G04

### Exact affected files

- `IDMS Programs/VM1BD526.cbl`
- `DB2 Manual converted Programs/VMDZ1526.txt`

## Observed behavior

Legacy OBTAIN FIRST selects via ALL-VMBEVEF-BY-VMBEFF and program filters.

Target orders NR_ID_479EVEF DESC and fetches exactly one.

Supplied VMBTS07 includes the set name but not its ordering or membership definition.

### Evidence

- `IDMS Programs/VM1BD526.cbl` physical lines 197–227
- `Schema/VMBTS07.txt` physical lines 47–50
- `Schema/VMBTS07.txt` physical lines 124–136
- `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 575–622

## One business or missing-evidence question

Supply the VMBEFF-VMBEVEF set-order definition and specify which matching 0168/0219 event must be updated when several exist: the legacy first qualifying member or the greatest generated NR_ID_479EVEF?

## Why the answer matters

The target may update a different business event while returning success; a sequence surrogate is not proof of legacy set order.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
Test-only fixtures can define greatest-ID selection as intended and expose a multi-event counterexample where it differs from legacy set order; do not silently change the original assessment.

Applies to these programs / business conditions:
VM1BD526.cbl. Only the question's stated condition and the isolated six-program rehearsal.

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
