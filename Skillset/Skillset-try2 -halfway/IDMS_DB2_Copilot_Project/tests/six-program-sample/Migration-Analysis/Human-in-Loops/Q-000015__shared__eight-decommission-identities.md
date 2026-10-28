# Q-000015 — Eight decommissioned business records

## Identity and affected scope

- Stable question key: `eight-decommission-identities`
- First seen: Phase-1/Run-001
- Affected case IDs: Configuration/dependency coverage across named programs
- Affected rules: RULE-014
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

The task identifies an eight-record requirement but supplies no exact eight identities in this scoped assignment.

Restart-related schema declarations FFRECAB, FFRECBB and FFRECAT do not constitute a decommission list.

Unused LR components do not prove decommissioning. The authoritative eight-entity list was not supplied.

### Evidence

- `Schema/VMBTS07.txt` physical lines 28–54
- `Schema/VMBTS06.txt` physical lines 28–101
- `Schema/VMBTS07.txt` physical lines 28–43
- `Schema/VMBTS03.txt` physical lines 22–31

## One business or missing-evidence question

Supply the eight distinct approved decommission identities, using IDMS or Db2 names, with namespace, scope and retained business obligations.

## Why the answer matters

Prevents an honest eight-entity use/removal checklist and any authorization claim that dependent business conditions may be removed.

Unused LR components do not prove decommissioning. The authoritative eight-entity list was not supplied.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: DEFERRED

Answer origin: SIMULATED_FOR_TEST

Answer:
DEFERRED FOR TEST. The eight identities have not been supplied. Do not invent names, count schema declarations as an approved list, or authorize deletion of their dependent conditions. All eight remain unresolved.

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
