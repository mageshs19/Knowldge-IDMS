# Q-000029 — Counter range and checkpoint meaning

## Identity and affected scope

- Stable question key: `restart-counter-capacity`
- First seen: Phase-1/Run-001
- Affected case IDs: VM1BD526-C010, VM1BD526-C015, VM1BD567-C006, VM1BD567-C012
- Affected rules: RULE-026, RULE-007
- Guides: G02, G04

### Exact affected files

- `IDMS Programs/VM1BD526.cbl`
- `DB2 Manual converted Programs/VMDZ1526.txt`
- `IDMS Programs/VM1BD567.cbl`
- `DB2 Manual converted Programs/VMDZ1567.cbl`

## Observed behavior

VMDZ1526 WS-NB-INPUT-UPD-I, insert and update counters are S9(5) COMP-3.

VMDZ1567 WS-NB-INPUT-UPD-I is 9(7) COMP-3. Both serialize NB-READ as 9(15).

No ON SIZE ERROR or explicit range guard is present.

### Evidence

- `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 54–64
- `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 320–365
- `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 54–61
- `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 245–250
- `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 287–336

## One business or missing-evidence question

What is the maximum cumulative successful input count per keyed run and restart, and must counters preserve all 15 checkpoint digits rather than the current 5-digit (VMDZ1526) or 7-digit (VMDZ1567) range?

## Why the answer matters

Overflow or narrowing can corrupt checkpoint position, causing replay/loss and inaccurate statistics; ARITH(EXTEND) does not enlarge these declared fields.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
Simulated boundary data should remain within a stated safe range for happy paths and separately exercise 100000 / 10000000 and oversized restored checkpoints as failures.

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
