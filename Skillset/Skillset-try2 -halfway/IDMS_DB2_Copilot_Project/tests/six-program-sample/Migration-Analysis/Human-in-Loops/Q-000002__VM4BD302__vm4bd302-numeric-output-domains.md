# Q-000002 — Numeric output field domains

## Identity and affected scope

- Stable question key: `VM4BD302.numeric_output_domains`
- First seen: Phase-1/Run-001
- Affected case IDs: VM4BD302-C006, VM4BD302-C007
- Affected rules: RULE-022, RULE-023
- Guides: G01, G02, G03, G04

### Exact affected files

- `IDMS Programs/VM4BD302.cbl`
- `DB2 Manual converted Programs/VMDZ4302.txt`

## Observed behavior

DB2 stockCHAR12 is moved into PIC9(12), CIparts into PIC9(6) output, and amountDECIMAL15,2 into S9(12)V9(6). The legacy output imposes the same numeric/range constraints but full record declarations/data are absent.

### Evidence

- `IDMS Programs/VM4BD302.cbl` physical lines 115–123
- `DB2 Manual converted Programs/VMDZ4302.txt` physical lines 94–110
- `DB2 Manual converted Programs/VMDZ4302.txt` physical lines 364–375
- `Dclgens/DZBEFFTV.txt` physical lines 12–19
- `Dclgens/DZEVEFTV.txt` physical lines 20–21

## One business or missing-evidence question

Are 12-character stock IDs and six-character CIs always decimal digits for this output, and can the13-integer-digit amount exceed the12-integer-digit output capacity?

## Why the answer matters

Controls safe removal of staging helpers and prevention of corrupted/truncated file output; do not claim a newly introduced defect merely from an inherited width.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
Use decimal-only stock/CI and amounts within destination range for simulated tests; preserve production domain/range question.

Applies to these programs / business conditions:
VM4BD302.cbl. Only the question's stated condition and the isolated six-program rehearsal.

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
