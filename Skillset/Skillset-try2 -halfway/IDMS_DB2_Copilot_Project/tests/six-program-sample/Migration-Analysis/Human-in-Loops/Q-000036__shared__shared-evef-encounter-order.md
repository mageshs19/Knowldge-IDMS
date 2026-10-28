# Q-000036 — Legacy event-set order versus surrogate order

## Identity and affected scope

- Stable question key: `shared.evef_encounter_order`
- First seen: Phase-1/Run-001
- Affected case IDs: VM4BD302-C003, VM4BD302-C005, VM4BD420-C002, VM4BD420-C003
- Affected rules: RULE-024, RULE-025, RULE-004
- Guides: G01, G03, G04

### Exact affected files

- `IDMS Programs/VM4BD302.cbl`
- `DB2 Manual converted Programs/VMDZ4302.txt`
- `IDMS Programs/VM4BD420.cbl`
- `DB2 Manual converted Programs/VMDZ4420.cbl`

## Observed behavior

VMBTS07 lists the set name but omits its ordering/member-placement definition. Both child cursors order by the new event ID descending; creation/transfer CI choices depend on encounter order.

### Evidence

- `Schema/VMBTS07.txt` physical lines 47–50
- `DB2 Manual converted Programs/VMDZ4302.txt` physical lines 215–246
- `DB2 Manual converted Programs/VMDZ4420.cbl` physical lines 164–196
- `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical lines 372–372
- `IDMS Programs/VM4BD302.cbl` physical lines 300–315
- `IDMS Programs/VM4BD420.cbl` physical lines 192–221

## One business or missing-evidence question

Which exact VMBEFF-VMBEVEF set ordering/member-placement rule and data-load sequence justify using NR_ID_479EVEF DESC as the legacy encounter order, including ties?

## Why the answer matters

Without order correlation, equivalent rows can yield a different selected CI. A business answer can define intended order but cannot establish how existing IDs were loaded.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
For simulation only, assume descending event IDs reproduce the relevant legacy encounter order; retain source-schema/load proof as unresolved.

Applies to these programs / business conditions:
VM4BD302.cbl, VM4BD420.cbl. Only the question's stated condition and the isolated six-program rehearsal.

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
