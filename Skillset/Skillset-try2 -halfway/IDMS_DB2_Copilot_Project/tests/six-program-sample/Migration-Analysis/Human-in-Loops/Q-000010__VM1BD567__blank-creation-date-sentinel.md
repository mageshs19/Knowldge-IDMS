# Q-000010 — Missing creation date normalization

## Identity and affected scope

- Stable question key: `blank-creation-date-sentinel`
- First seen: Phase-1/Run-001
- Affected case IDs: VM1BD567-C002
- Affected rules: RULE-013
- Guides: G01, G02

### Exact affected files

- `IDMS Programs/VM1BD567.cbl`
- `DB2 Manual converted Programs/VMDZ1567.cbl`

## Observed behavior

Target changes zero/space DA-CCYYMMDD to 00010101 before building the key.

Legacy moves the input creation date to its CALC-key field without this normalization.

### Evidence

- `IDMS Programs/VM1BD567.cbl` physical lines 149–158
- `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 201–219
- `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical lines 83–83
- `Dclgens/DZBFARTV.txt` physical lines 13–18

## One business or missing-evidence question

Must a blank or zero input creation date select the form key dated 0001-01-01, or should such input be rejected or routed to a different outcome?

## Why the answer matters

The normalization can target a different existing row; a representable SQL DATE does not establish approved missing-date semantics.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
Test only: designate 0001-01-01 as the missing-creation-date sentinel and include zero, blanks, leap date and invalid nonzero date cases.

Applies to these programs / business conditions:
VM1BD567.cbl. Only the question's stated condition and the isolated six-program rehearsal.

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
