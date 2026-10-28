# Q-000011 — Second replacement: persistent buffer role

## Identity and affected scope

- Stable question key: `buffer-replacement-identity`
- First seen: Phase-1/Run-001
- Affected case IDs: Configuration/dependency coverage across named programs
- Affected rules: RULE-003
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

Mapping row 871 (physical 877) maps FFRECAT to DZ01FFTB, but this is not proof that FFRECAT is the intended buffer.

The supplied two program bodies do not execute FFRECAT/FFRECBB operations.

WS-INPUT-KASBONS is an in-memory copy, not demonstrated persistent queue/work-buffer storage.

### Evidence

- `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical lines 877–877
- `Schema/VMBTS07.txt` physical lines 38–54
- `Schema/VMBTS06.txt` physical lines 66–101
- `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 60–63
- `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 54–58

## One business or missing-evidence question

Is FFRECAT to DZ01FFTB the intended second buffer replacement, and which actual producer/consumer program paths establish its keys, lifecycle, transaction ownership and recovery obligations?

## Why the answer matters

Prevents a fabricated buffer migration, hidden producer/consumer transaction claims, or mistaken decommissioning of an unused declaration.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: DEFERRED

Answer origin: SIMULATED_FOR_TEST

Answer:
DEFERRED FOR TEST. Retain FFRECAT to DZ01FFTB only as the observed mapping candidate. No buffer DDL or demonstrated producer/consumer lifecycle was supplied. Do not identify an in-memory record-copy helper as this persistent buffer.

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

Response detected: DEFERRED

Review state: TEST_ASSUMPTION_ONLY

Question resolution: OPEN

Production resolution: OPEN

Evidence type: SIMULATED_TEST_ASSUMPTION

Applied in: Phase-2/Run-001. Missing evidence and implementation defects remain as recorded in the revised reports and ANSWER_IMPACT.md.
