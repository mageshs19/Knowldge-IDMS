# Q-000037 — Business views, base tables and keys

## Identity and affected scope

- Stable question key: `view-base-ddl`
- First seen: Phase-1/Run-001
- Affected case IDs: VM1BD567-C001, VM4BD302-C002, VM4BD302-C003, VM4BD302-C006, VM4BD310-C002, VM4BD310-C003, VM4BD420-C002, VM4BD420-C004, VM7BD200-C002, VM7BD200-C005
- Affected rules: RULE-005, RULE-032, RULE-024, RULE-022, RULE-021, RULE-025, RULE-017
- Guides: G01, G02, G03, G04

### Exact affected files

- `IDMS Programs/VM1BD526.cbl`
- `DB2 Manual converted Programs/VMDZ1526.txt`
- `IDMS Programs/VM1BD567.cbl`
- `DB2 Manual converted Programs/VMDZ1567.cbl`
- `IDMS Programs/VM4BD302.cbl`
- `DB2 Manual converted Programs/VMDZ4302.txt`
- `IDMS Programs/VM4BD310.cbl`
- `DB2 Manual converted Programs/VMDZ4310.txt`
- `IDMS Programs/VM4BD420.cbl`
- `DB2 Manual converted Programs/VMDZ4420.cbl`
- `IDMS Programs/VM7BD200.cbl`
- `DB2 Manual converted Programs/VMDZ7200.cbl`

## Observed behavior

Mapping names TB objects while code accesses TV objects. DCLGEN provides column types, not complete view definitions, filters, key constraints or relationship enforcement. Parent cursors have no explicit ordering.

The mapping names TB objects; actual SQL and supplied DCLGENs name TV objects. View scope and uniqueness are unverified.

VMDZ1567 also updates DZBFARTV with a six-column business key; supplied DCLGEN does not establish uniqueness or affected-row cardinality.

### Evidence

- `Schema/VMBTS07.txt` physical lines 47–50
- `DB2 Manual converted Programs/VMDZ4302.txt` physical lines 215–246
- `DB2 Manual converted Programs/VMDZ4420.cbl` physical lines 164–196
- `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical lines 372–372
- `IDMS Programs/VM4BD302.cbl` physical lines 300–315
- `IDMS Programs/VM4BD420.cbl` physical lines 192–221
- `Dclgens/DZBEFFTV.txt` physical lines 2–33
- `Dclgens/DZEVEFTV.txt` physical lines 2–27
- `Dclgens/DZBFASTV.txt` physical lines 2–100
- `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 427–452

## One business or missing-evidence question

Supply the actual CREATE VIEW/base-table/constraint DDL connecting the mapped TB objects to the queried TV objects, including view predicates, duplicate-key rules and nullability for the business tables used by these six programs.

## Why the answer matters

A filtered or nonunique view can change row coverage, singleton results or parent-child multiplicity even with correctly spelled columns.

The mapping names TB objects; actual SQL and supplied DCLGENs name TV objects. View scope and uniqueness are unverified.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
SIMULATED TEST FIXTURE: assume the relevant TV objects are unfiltered projections of the mapped TB objects with the DCLGEN declarations and required logical key uniqueness. This is a hypothetical fixture, not supplied DDL or a catalog verification. Event sequence/FK and restart-key guarantees remain separately scoped.

Applies to these programs / business conditions:
VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl. Only the question's stated condition and the isolated six-program rehearsal.

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
