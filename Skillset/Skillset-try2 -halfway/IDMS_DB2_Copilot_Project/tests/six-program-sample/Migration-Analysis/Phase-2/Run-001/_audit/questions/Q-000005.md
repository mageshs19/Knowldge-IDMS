# Q-000005 — Archive byte compatibility, including filler

## Identity and affected scope

- Stable question key: `archive-byte-contract-7200`
- First seen: Phase-1/Run-001
- Affected case IDs: VM7BD200-C005
- Affected rules: RULE-017
- Guides: G01, G02, G03, G04

### Exact affected files

- `IDMS Programs/VM7BD200.cbl`
- `DB2 Manual converted Programs/VMDZ7200.cbl`

## Observed behavior

The target reconstructs named fields and blanks filler bytes. The original copies the complete record image.

### Evidence

- `IDMS Programs/VM7BD200.cbl` physical lines 87–94
- `IDMS Programs/VM7BD200.cbl` physical lines 194–194
- `DB2 Manual converted Programs/VMDZ7200.cbl` physical lines 77–192
- `DB2 Manual converted Programs/VMDZ7200.cbl` physical lines 591–592

## One business or missing-evidence question

Must the478-byte embedded VMBFAS image preserve every original byte, including the2- and14-byte filler areas noted as containing COMP-3 values, or are blank fillers approved? Supply the generated original record and the downstream layout.

## Why the answer matters

The target reconstructs named fields and blanks filler bytes. The original copies the complete record image.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
SIMULATED_FOR_TEST: Require compatibility for named business fields and filler bytes. Do not approve blanking without consumer evidence; keep byte compatibility unresolved.

Applies to these programs / business conditions:
VM7BD200.cbl. Only the question's stated condition and the isolated six-program rehearsal.

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
