# Q-000006 — Archive date fallback and zero sentinel

## Identity and affected scope

- Stable question key: `archive-cutoff-sentinel-7200`
- First seen: Phase-1/Run-001
- Affected case IDs: VM7BD200-C004
- Affected rules: RULE-012
- Guides: G01, G02, G03, G04

### Exact affected files

- `IDMS Programs/VM7BD200.cbl`
- `DB2 Manual converted Programs/VMDZ7200.cbl`

## Observed behavior

The SQL predicate preserves the original structure only under that sentinel conversion contract.

### Evidence

- `IDMS Programs/VM7BD200.cbl` physical lines 188–191
- `DB2 Manual converted Programs/VMDZ7200.cbl` physical lines 366–370

## One business or missing-evidence question

Was every accounting date00000000 migrated to Db2 DATE0001-01-01, and must the creation-date fallback and strict less-than cutoff remain exactly as in the original?

## Why the answer matters

The SQL predicate preserves the original structure only under that sentinel conversion contract.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
SIMULATED_FOR_TEST: Map zero to 0001-01-01 and high date 99999999 to 9999-12-31. Retain strict less-than and the creation-date fallback. Actual migrated data has not been reconciled.

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
