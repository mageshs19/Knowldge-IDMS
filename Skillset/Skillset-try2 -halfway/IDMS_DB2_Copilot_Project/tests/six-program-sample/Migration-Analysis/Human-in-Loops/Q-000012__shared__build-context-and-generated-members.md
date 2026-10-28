# Q-000012 — Build context and generated declarations

## Identity and affected scope

- Stable question key: `build-context-and-generated-members`
- First seen: Phase-1/Run-001
- Affected case IDs: Configuration/dependency coverage across named programs
- Affected rules: Build and declaration conclusions
- Guides: G01, G02, G03, G04

### Exact affected files

- `IDMS Programs/VM1BD526.cbl`
- `DB2 Manual converted Programs/VMDZ1526.txt`
- `IDMS Programs/VM1BD567.cbl`
- `DB2 Manual converted Programs/VMDZ1567.cbl`
- `IDMS Programs/VM4BD302.cbl`
- `DB2 Manual converted Programs/VMDZ4302.txt`
- `IDMS Programs/VM4BD310.cbl`
- `DB2 Manual converted Programs/VMDZ4310.txt`
- `IDMS Programs/VM4BD420.cbl`
- `DB2 Manual converted Programs/VMDZ4420.cbl`
- `IDMS Programs/VM7BD200.cbl`
- `DB2 Manual converted Programs/VMDZ7200.cbl`

## Observed behavior

The archive has six originals, six converted members, seven ordinary copybooks, seven DCLGENs and three subschema/LRF files. It contains no JCL, bind listing, compiler listing, full IDMS record/set schema or site standards.

### Evidence

- `Schema/VMBTS07.txt` physical lines 1–54

## One business or missing-evidence question

Which exact COBOL/IDMS/Db2 versions, source/debugging options, compilation/bind settings, site coding standards and generated IDMS record/control members produced these six source pairs? Supply the matching build/dependency bundle.

## Why the answer matters

Precompile/compile, legacy generated layouts, warning policy, debug lines and site-standard conformance cannot be certified.

<!-- HUMAN-ANSWER-START -->
## Human answer — simulated for the authorized rehearsal

Response state: DEFERRED

Answer origin: SIMULATED_FOR_TEST

Answer:
DEFERRED. No actual build or generated-member bundle is supplied by this rehearsal. Use the visible declarations for static reasoning only; perform no fictitious compile or runtime checks.

Applies to these programs / business conditions:
VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl. Only the question's stated condition and the isolated six-program rehearsal.

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

Response detected: DEFERRED

Review state: TEST_ASSUMPTION_ONLY

Question resolution: OPEN

Production resolution: OPEN

Evidence type: SIMULATED_TEST_ASSUMPTION

Applied in: Phase-2/Run-001. Missing evidence and implementation defects remain as recorded in the revised reports and ANSWER_IMPACT.md.
