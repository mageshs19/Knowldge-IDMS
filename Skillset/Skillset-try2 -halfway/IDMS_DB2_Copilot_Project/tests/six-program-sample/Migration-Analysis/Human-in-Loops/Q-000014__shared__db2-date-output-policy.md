# Q-000014 — DATE output format and sentinel contract

## Identity and affected scope

- Stable question key: `db2-date-output-policy`
- First seen: Phase-1/Run-001
- Affected case IDs: VM4BD302-C001, VM4BD302-C004, VM4BD302-C005, VM4BD310-C006, VM4BD420-C001, VM4BD420-C003, VM4BD420-C004, VM4BD420-C006, VM4BD420-C007, VM7BD200-C004, VM7BD200-C008
- Affected rules: RULE-006, RULE-027, RULE-025, RULE-012, RULE-004, RULE-022, RULE-023, RULE-017
- Guides: G01, G02, G03, G04

### Exact affected files

- `IDMS Programs/VM4BD302.cbl`
- `DB2 Manual converted Programs/VMDZ4302.txt`
- `IDMS Programs/VM4BD420.cbl`
- `DB2 Manual converted Programs/VMDZ4420.cbl`
- `IDMS Programs/VM4BD310.cbl`
- `DB2 Manual converted Programs/VMDZ4310.txt`
- `IDMS Programs/VM7BD200.cbl`
- `DB2 Manual converted Programs/VMDZ7200.cbl`

## Observed behavior

Both targets parse fetched DATE strings as DD.MM.CCYY. VMDZ4302 also constructs that format for its owner lookup and changes embedded key date 00010101 to zero. No preparation options or data-load specification were supplied.

The programs parse fixed DD.MM.YYYY character positions. A DCLGEN PIC X(10) alone does not establish the output format.

### Evidence

- `DB2 Manual converted Programs/VMDZ4302.txt` physical lines 324–330
- `DB2 Manual converted Programs/VMDZ4302.txt` physical lines 384–402
- `DB2 Manual converted Programs/VMDZ4420.cbl` physical lines 282–295
- `DB2 Manual converted Programs/VMDZ4420.cbl` physical lines 326–338
- `Dclgens/DZEVEFTV.txt` physical lines 16–19
- `Dclgens/DZBEFFTV.txt` physical lines 29–29
- `DB2 Manual converted Programs/VMDZ4310.txt` physical lines 404–433
- `DB2 Manual converted Programs/VMDZ7200.cbl` physical lines 603–616
- `DB2 Manual converted Programs/VMDZ7200.cbl` physical lines 841–856

## One business or missing-evidence question

Which effective DATE output format and approved legacy zero/high-date conversions apply to the date fields read by these programs? Provide actual package/preparation settings and the load conversion specification.

## Why the answer matters

A different returned string format changes comparison operands and file dates. A sentinel convention changes business selection; a source answer alone is not evidence of deployed settings.

The programs parse fixed DD.MM.YYYY character positions. A DCLGEN PIC X(10) alone does not establish the output format.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
SIMULATED TEST POLICY: fetched DATE strings use EUR dd.mm.yyyy; legacy 00000000 corresponds to 0001-01-01 and 99999999 to 9999-12-31 where the documented program-specific branch uses that convention. Keep all other predicates, century cutoffs and date arithmetic unchanged. Actual environment and loaded data remain unverified.

Applies to these programs / business conditions:
VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl, VM7BD200.cbl. Only the question's stated condition and the isolated six-program rehearsal.

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
