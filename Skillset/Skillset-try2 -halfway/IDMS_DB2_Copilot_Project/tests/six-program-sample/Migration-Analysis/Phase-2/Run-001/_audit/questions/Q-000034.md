# Q-000034 — Restart table versus SQL view identity

## Identity and affected scope

- Stable question key: `restart-target-object-identity`
- First seen: Phase-1/Run-001
- Affected case IDs: VM1BD526-C008, VM1BD526-C009, VM1BD567-C004, VM1BD567-C005
- Affected rules: RULE-028, RULE-016
- Guides: G01, G02, G04

### Exact affected files

- `IDMS Programs/VM1BD526.cbl`
- `DB2 Manual converted Programs/VMDZ1526.txt`
- `IDMS Programs/VM1BD567.cbl`
- `DB2 Manual converted Programs/VMDZ1567.cbl`

## Observed behavior

Mapping row 867 (physical 873) maps FFRECAB to DZ01RSTB.

Both targets execute against DZ01RSTV; DCLGEN describes DZ.DZ01RSTV but supplies no CREATE VIEW/base-table relationship or key constraint.

### Evidence

- `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical lines 873–873
- `Dclgens/DZ01RSTV.txt` physical lines 2–31
- `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 401–460
- `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 356–423

## One business or missing-evidence question

Provide the DDL/catalog identity and field mapping proving that DZ01RSTV is the intended updatable view of DZ01RSTB for FFRECAB, including uniqueness on program, phase and date, authorization/bind qualifier, triggers and constraints.

## Why the answer matters

Blocks approved replacement identity, singleton cardinality, update scope and one-unit-of-work claims.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
Test-only fixture: a simple updatable view over one restart table with a unique key (program,phase,date), no hidden commits or triggers; do not treat this as supplied production DDL.

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
