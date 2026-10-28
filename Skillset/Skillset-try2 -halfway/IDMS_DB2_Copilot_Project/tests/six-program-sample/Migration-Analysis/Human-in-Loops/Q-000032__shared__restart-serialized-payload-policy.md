# Q-000032 — Count-only versus count-plus-record checkpoint

## Identity and affected scope

- Stable question key: `restart-serialized-payload-policy`
- First seen: Phase-1/Run-001
- Affected case IDs: VM1BD526-C012, VM1BD567-C008
- Affected rules: RULE-029
- Guides: G02, G04

### Exact affected files

- `IDMS Programs/VM1BD526.cbl`
- `DB2 Manual converted Programs/VMDZ1526.txt`
- `IDMS Programs/VM1BD567.cbl`
- `DB2 Manual converted Programs/VMDZ1567.cbl`

## Observed behavior

Initial INSERT uses length 1215. Every checkpoint UPDATE sets length 15 while moving the 1215-byte group.

KY-RESTART and WS-INPUT-KASBONS are never used to choose or validate resume position.

### Evidence

- `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 60–63
- `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 347–368
- `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 54–58
- `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 306–338
- `Dclgens/DZ01RSTV.txt` physical lines 16–31

## One business or missing-evidence question

Should each checkpoint persist only the 15-digit processed count, or all 1215 bytes consisting of the count and last input record, and must the saved record be compared during resume?

## Why the answer matters

Determines whether record loss is a defect or unused storage, whether 2400 bytes of duplicate record storage are justified, and whether changed-input detection is missing.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
For a clearly marked simulated test, define a count-only 15-byte protocol with immutable input; keep the observed 1215-byte initial form as an implementation inconsistency to assess.

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
