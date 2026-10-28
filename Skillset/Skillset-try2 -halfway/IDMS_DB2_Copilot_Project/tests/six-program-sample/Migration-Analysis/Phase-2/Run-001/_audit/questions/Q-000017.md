# Q-000017 — Event composite key: 20 bytes versus 28 digits

## Identity and affected scope

- Stable question key: `event-good-key-encoding`
- First seen: Phase-1/Run-001
- Affected case IDs: VM1BD526-C003, VM1BD526-C006, VM4BD302-C004, VM4BD302-C005, VM4BD302-C006, VM4BD302-C007, VM4BD310-C005, VM4BD420-C003, VM4BD420-C004, VM4BD420-C007
- Affected rules: RULE-018, RULE-022, RULE-027, RULE-025, RULE-023, RULE-004, RULE-017
- Guides: G01, G02, G03, G04

### Exact affected files

- `IDMS Programs/VM1BD526.cbl`
- `DB2 Manual converted Programs/VMDZ1526.txt`
- `IDMS Programs/VM4BD302.cbl`
- `DB2 Manual converted Programs/VMDZ4302.txt`
- `IDMS Programs/VM4BD420.cbl`
- `DB2 Manual converted Programs/VMDZ4420.cbl`
- `IDMS Programs/VM4BD310.cbl`
- `DB2 Manual converted Programs/VMDZ4310.txt`

## Observed behavior

Legacy HULP-NR-ID-GOOD contains five packed fields plus two filler bytes (20 bytes).

Converted group contains display widths 8+8+6+3+3 (28 bytes), with no filler.

Mapping row 354/physical 360 says CHAR(20); DZEVEFTV declares CHAR(28).

CSV logical row 354 says CHAR(20); DZEVEFTV declares CHAR(28). Both target working-storage layouts now use display 8+8+6+3+3 digits without packed signs/filler.

The original key group is20 bytes with packed numeric members. The DCLGEN is CHAR(28), while the mapping says CHAR(20).

### Evidence

- `IDMS Programs/VM1BD526.cbl` physical lines 66–72
- `IDMS Programs/VM1BD526.cbl` physical lines 174–180
- `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 68–73
- `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 248–254
- `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical lines 360–360
- `Dclgens/DZEVEFTV.txt` physical lines 19–40
- `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical lines 360–360
- `Dclgens/DZEVEFTV.txt` physical lines 19–19
- `Dclgens/DZEVEFTV.txt` physical lines 40–40
- `IDMS Programs/VM4BD302.cbl` physical lines 105–111
- `DB2 Manual converted Programs/VMDZ4302.txt` physical lines 87–92
- `IDMS Programs/VM4BD420.cbl` physical lines 78–84
- `DB2 Manual converted Programs/VMDZ4420.cbl` physical lines 68–73
- `IDMS Programs/VM4BD310.cbl` physical lines 78–84
- `DB2 Manual converted Programs/VMDZ4310.txt` physical lines 63–69
- `Dclgens/DZEVEFTV.txt` physical lines 19–40

## One business or missing-evidence question

What approved loader and consumer specification maps the legacy 20-byte packed/mixed NR-ID-GOOD to the supplied 28-character NR_IDGOOD_479EVEF, including sign and date conventions, when the mapping sheet still says CHAR(20)?

## Why the answer matters

Byte-level equality, existing converted data and downstream lookups cannot be assumed; current target fits the supplied DCLGEN but conflicts with mapping.

The key date, operation 91 test and creation-CI output all depend on the byte layout and valid domains. Mechanical MOVE or hyphen replacement cannot establish equivalence.

The original key group is20 bytes with packed numeric members. The DCLGEN is CHAR(28), while the mapping says CHAR(20).

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
SIMULATED TEST POLICY: use 28 display digits in widths 8+8+6+3+3, preserve leading zeroes, use nonnegative operation codes and the stated minimum-date convention. Treat CHAR(28) as intended for this test only. Keep the original CHAR(20) CSV row unchanged and visible as a conflict; no actual loader/consumer specification is supplied.

Applies to these programs / business conditions:
VM1BD526.cbl, VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl. Only the question's stated condition and the isolated six-program rehearsal.

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
