# Q-000020 — Converted input-record dependency

## Identity and affected scope

- Stable question key: `input-copy-vmdz205i-layout`
- First seen: Phase-1/Run-001
- Affected case IDs: VM1BD526-C001, VM1BD526-C007, VM1BD526-C010, VM1BD567-C001
- Affected rules: RULE-008, RULE-023, RULE-026, RULE-005
- Guides: G01, G02, G03, G04

### Exact affected files

- `IDMS Programs/VM1BD526.cbl`
- `DB2 Manual converted Programs/VMDZ1526.txt`
- `IDMS Programs/VM1BD567.cbl`
- `DB2 Manual converted Programs/VMDZ1567.cbl`

## Observed behavior

Both conversions COPY VMDZ205I; only VMBD205I is supplied.

Group versus elementary numeric MOVEs affect stock suffix, sequence and identifier conversions.

### Evidence

- `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 34–41
- `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 150–150
- `Copybook/VMBD205I.cpy` physical lines 43–154
- `Copybook/VMBD205I.cpy` physical lines 624–673

## One business or missing-evidence question

Supply the exact VMDZ205I member used for these builds and confirm whether its 1200-byte layout and numeric/group aliases are identical to the supplied VMBD205I, apart from the level-01 name.

## Why the answer matters

Blocks exact input-host compatibility, no-new-helper proofs, file length validation and full transitive dependency closure.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
For an explicitly simulated test only, use a byte-identical 1200-byte copy of VMBD205I with only the level-01 name changed; record that this does not establish the real build layout.

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
