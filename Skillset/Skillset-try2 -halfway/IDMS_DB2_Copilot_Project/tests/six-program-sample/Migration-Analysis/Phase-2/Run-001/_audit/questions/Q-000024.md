# Q-000024 — Exact mapping column spelling

## Identity and affected scope

- Stable question key: `mapping-embedded-space-7200`
- First seen: Phase-1/Run-001
- Affected case IDs: VM7BD200-C005
- Affected rules: RULE-017
- Guides: G01, G02, G03, G04

### Exact affected files

- `IDMS Programs/VM7BD200.cbl`
- `DB2 Manual converted Programs/VMDZ7200.cbl`

## Observed behavior

The mapping has an embedded space. Only a whitespace-normalized candidate matches the actual DCLGEN column.

### Evidence

- `Dclgens/DZBFASTV.txt` physical lines 24–24
- `DB2 Manual converted Programs/VMDZ7200.cbl` physical lines 294–294
- `DB2 Manual converted Programs/VMDZ7200.cbl` physical lines 648–649

## One business or missing-evidence question

Should mapping logical row193, RA_BASFMAS _479BFAS, be corrected to the exact DCLGEN and SQL identifier RA_BASFMAS_479BFAS?

## Why the answer matters

The mapping has an embedded space. Only a whitespace-normalized candidate matches the actual DCLGEN column.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
SIMULATED_FOR_TEST: Accept RA_BASFMAS_479BFAS as the intended spelling while retaining the original CSV bytes and the documented correction.

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
