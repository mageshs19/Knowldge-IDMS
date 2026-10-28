# Q-000009 — Job timestamp and audit defaults

## Identity and affected scope

- Stable question key: `audit-timestamp-business-policy`
- First seen: Phase-1/Run-001
- Affected case IDs: VM1BD526-C003, VM1BD526-C016, VM1BD567-C003
- Affected rules: RULE-018, RULE-030
- Guides: G02, G04

### Exact affected files

- `IDMS Programs/VM1BD526.cbl`
- `DB2 Manual converted Programs/VMDZ1526.txt`
- `IDMS Programs/VM1BD567.cbl`
- `DB2 Manual converted Programs/VMDZ1567.cbl`

## Observed behavior

Both targets capture CURRENT-DATE once before processing.

Subsequent modifications reuse the same TS-TIMESTAMP.

VMDZ1526 sets maximum TS_UPDATE for new events and zero NS_IDMSKEY after INITIALIZE; original listings have no equivalent audit columns.

### Evidence

- `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 65–66
- `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 185–188
- `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 274–279
- `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 382–393
- `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 162–162
- `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 222–226
- `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 254–266

## One business or missing-evidence question

Should audit timestamps identify job start or each individual business change, and is VMDZ1526 insertion TS_UPDATE = 9999-12-31-23.59.59.999999 the approved never-updated marker?

## Why the answer matters

Determines audit meaning and safe reuse of timestamp storage; using SQL CURRENT TIMESTAMP per row would change observed semantics.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
For simulated tests, define a run-scoped timestamp and the maximum timestamp as a never-updated marker; retain this as intent, not a proven site standard.

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
