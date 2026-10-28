# Q-000013 — Capital amount when coupon rank is zero

## Identity and affected scope

- Stable question key: `capital-amount-4310`
- First seen: Phase-1/Run-001
- Affected case IDs: VM4BD310-C004
- Affected rules: RULE-002
- Guides: G01, G02, G03, G04

### Exact affected files

- `IDMS Programs/VM4BD310.cbl`
- `DB2 Manual converted Programs/VMDZ4310.txt`

## Observed behavior

The target initializes the DCLGEN and omits AM_CNDSTK from its SELECT, then copies that zero-initialized host in the rank-zero branch.

### Evidence

- `IDMS Programs/VM4BD310.cbl` physical lines 247–253
- `DB2 Manual converted Programs/VMDZ4310.txt` physical lines 219–263
- `DB2 Manual converted Programs/VMDZ4310.txt` physical lines 393–399

## One business or missing-evidence question

For NX-CPCRE=0, must AM-CND-FORM-AS retain the parent AM-CND-STOCK value, including nonzero amounts, or was a zero output deliberately approved?

## Why the answer matters

The target initializes the DCLGEN and omits AM_CNDSTK from its SELECT, then copies that zero-initialized host in the rank-zero branch.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
SIMULATED_FOR_TEST: Preserve the original capital amount. The omitted projection remains a defect; this temporary answer does not fix the source.

Applies to these programs / business conditions:
VM4BD310.cbl. Only the question's stated condition and the isolated six-program rehearsal.

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
