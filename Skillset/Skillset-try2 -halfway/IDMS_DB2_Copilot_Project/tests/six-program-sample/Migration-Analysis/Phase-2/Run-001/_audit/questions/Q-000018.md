# Q-000018 — Event relationship and generated-ID guarantees

## Identity and affected scope

- Stable question key: `event-parent-and-id-constraints`
- First seen: Phase-1/Run-001
- Affected case IDs: VM1BD526-C002, VM1BD526-C003, VM1BD526-C004, VM1BD526-C005
- Affected rules: RULE-020, RULE-018, RULE-025, RULE-019
- Guides: G01, G03, G04

### Exact affected files

- `IDMS Programs/VM1BD526.cbl`
- `DB2 Manual converted Programs/VMDZ1526.txt`

## Observed behavior

Insert checks the parent with a singleton SELECT, then inserts a sequence-derived event ID.

Update selects the child directly without proving the parent exists.

DCLGEN supplies types, not uniqueness, set membership, foreign-key enforcement or sequence configuration.

### Evidence

- `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 463–574
- `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 575–622
- `Schema/VMBTS07.txt` physical lines 124–136
- `Schema/VMBTS07.txt` physical lines 182–189
- `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical lines 368–375
- `Dclgens/DZEVEFTV.txt` physical lines 11–26

## One business or missing-evidence question

Provide the target parent/event/sequence DDL and legacy CALC/set definitions proving unique parent selection, event foreign-key enforcement, generated event-ID uniqueness and the meaning of new-event NS_IDMSKEY=0.

## Why the answer matters

Orphans, duplicate parents, sequence collisions or multirow updates cannot be excluded; zero IDMS-key policy is unexplained.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
A test fixture may enforce the four-column parent key, event surrogate PK and parent FK, and reserve IDMSKEY zero for newly created Db2 rows, while leaving actual DDL unverified.

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
