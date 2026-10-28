# Copy this prompt into GitHub Copilot Chat for Phase 2

Execute **Phase 2 — Human Answer Application and Generic Rule Verification**.

Read:
- `Migration-Playbook/IDMS_DB2_MIGRATION_PLAYBOOK.md`
- `Migration-Playbook/PHASE_2_ANSWER_APPLICATION.md`
- `Migration-Playbook/MAINFRAME_QUESTION_STANDARD.md`
- `Migration-Analysis/MIGRATION_CONFIG.md`
- the exact completed Phase 1 run identified in the configuration/current request;
- every question file under `Migration-Analysis/Human-in-Loops/`.

First list every question ID and classify it as `ANSWERED`, `UNANSWERED`, `AMBIGUOUS`, or `CONFLICTING`. Do not interpret blank or unclear text as an answer. Then perform the following:

1. Apply explicit human answers only to the reports and generic rules they affect.
2. Preserve all human-authored answer text, question IDs and evidence. Do not overwrite Phase 1 outputs or original source files.
3. Keep unanswered/ambiguous decisions unresolved.
4. For every affected generic rule, cross-verify it against every applicable IDMS program and its manual DB2 counterpart. Record `APPLIES`, `APPLIES_WITH_EXCEPTION`, `DOES_NOT_APPLY`, `CONFLICT`, or `NOT_VERIFIED`, with evidence.
5. Create revised program reports and the same four generic guides (non-LRF retrieval, non-LRF update/restart, LRF retrieval, LRF update/restart).
6. Create `ANSWER_IMPACT.md`, linking each applied answer to its affected program report, rule ID, change made, evidence and remaining limitation.
7. Create `COVERAGE_AND_VALIDATION.md` and `_audit/` records, including answer status, rule applicability and checks actually performed.
8. Write to a new unused `Migration-Analysis/Phase-2/Run-NNN/` folder. Do not overwrite a previous Phase 2 run.
9. Do not promote a human answer to proof of technical correctness. Do not claim compile/runtime/regression success unless actually performed.
10. Do not create follow-up questions unless a material, specific conversion ambiguity remains after applying an answer; follow the question standard.

Finish with a summary of answers applied, unanswered questions, affected programs/rules, generic exceptions/conflicts, coverage limitations, output path and actual checks performed.
