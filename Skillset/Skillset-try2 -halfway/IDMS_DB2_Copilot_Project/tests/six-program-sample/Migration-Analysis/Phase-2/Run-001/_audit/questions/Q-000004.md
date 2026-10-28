# Q-000004 — Creation CI width and repeated creation events

## Identity and affected scope

- Stable question key: `VM4BD420.creation_ci_domain`
- First seen: Phase-1/Run-001
- Affected case IDs: VM4BD420-C003, VM4BD420-C004
- Affected rules: RULE-004, RULE-022
- Guides: G01, G02, G03, G04

### Exact affected files

- `IDMS Programs/VM4BD420.cbl`
- `DB2 Manual converted Programs/VMDZ4420.cbl`

## Observed behavior

Every qualifying0060 overwrites the saved key; later write moves8-digit WS-NR-CIO-CRE into6-digit output. Both source and target do this, while target fixes child ordering to descending surrogate ID.

### Evidence

- `IDMS Programs/VM4BD420.cbl` physical lines 78–84
- `IDMS Programs/VM4BD420.cbl` physical lines 192–216
- `DB2 Manual converted Programs/VMDZ4420.cbl` physical lines 68–73
- `DB2 Manual converted Programs/VMDZ4420.cbl` physical lines 297–321

## One business or missing-evidence question

For statusC output, is the last encountered qualifying0060 creation event intended, and are its8-digit embedded creationCI values constrained so the6-digit UIT-NR-CIO-CRE receives the correct identifier?

## Why the answer matters

Separates preserved narrowing behavior from approved business identity and order; confirms whether multiple0060 records are allowed.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
For test only assume last encountered 0060 is desired and top two creation CI digits are zero; retain real domain/order evidence gaps.

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
