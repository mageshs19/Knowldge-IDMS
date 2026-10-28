# Q-000001 — One month before maturity

## Identity and affected scope

- Stable question key: `VM4BD302.month_boundary_policy`
- First seen: Phase-1/Run-001
- Affected case IDs: VM4BD302-C004
- Affected rules: RULE-027
- Guides: G01

### Exact affected files

- `IDMS Programs/VM4BD302.cbl`
- `DB2 Manual converted Programs/VMDZ4302.txt`

## Observed behavior

Both programs subtract1 from month, withJanuary year rollover; neither validates the resulting date. Comparison is an8digit value.

### Evidence

- `IDMS Programs/VM4BD302.cbl` physical lines 287–296
- `DB2 Manual converted Programs/VMDZ4302.txt` physical lines 408–417

## One business or missing-evidence question

Is the exact retained month-number subtraction with unchanged day the intended cutoff, including March31→February31, or should production use calendar month-end clamping?

## Why the answer matters

Clarifies whether a legacy edge case should be preserved or deliberately changed; a business answer must not be mistaken for a source fix.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
Preserve the observed integer month subtraction for this test; flag real business policy unresolved.

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
