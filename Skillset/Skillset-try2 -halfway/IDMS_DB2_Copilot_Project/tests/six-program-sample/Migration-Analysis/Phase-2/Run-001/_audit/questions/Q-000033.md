# Q-000033 — Short input during positional restart

## Identity and affected scope

- Stable question key: `restart-short-file-policy-567`
- First seen: Phase-1/Run-001
- Affected case IDs: VM1BD567-C006
- Affected rules: RULE-026
- Guides: G02, G04

### Exact affected files

- `IDMS Programs/VM1BD567.cbl`
- `DB2 Manual converted Programs/VMDZ1567.cbl`

## Observed behavior

VMDZ1567 performs NB-READ READ calls without testing EOF inside the skip loop and then performs another unconditional READ.

The original skips only until EOF or count bound. VMDZ1526 explicitly calls STOP01 when EOF occurs while skipping.

### Evidence

- `IDMS Programs/VM1BD567.cbl` physical lines 117–134
- `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 178–184
- `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 238–250
- `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 287–303
- `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 207–213

## One business or missing-evidence question

Must a restart whose saved count exceeds the available input records fail before any checkpoint/completion update, and what diagnostic/file-status behavior is required?

## Why the answer matters

Read-after-EOF can cause a file exception; if runtime permits continuation, a shorter file may be recorded complete at the restored count. Actual file handler is not supplied.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: PROVIDED

Answer origin: SIMULATED_FOR_TEST

Answer:
Test-only expected policy: fail closed on short/missing input and preserve the last durable checkpoint; the present source still lacks the corresponding guard.

Applies to these programs / business conditions:
VM1BD567.cbl. Only the question's stated condition and the isolated six-program rehearsal.

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
