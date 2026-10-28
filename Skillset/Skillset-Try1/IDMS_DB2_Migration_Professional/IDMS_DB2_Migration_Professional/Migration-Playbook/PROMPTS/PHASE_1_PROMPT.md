# Copy this prompt into GitHub Copilot Chat for Phase 1

Execute **Phase 1 — Baseline Analysis** for the IDMS-to-DB2 migration analysis project.

Before analysis, read:
- `Migration-Playbook/IDMS_DB2_MIGRATION_PLAYBOOK.md`
- `Migration-Playbook/PHASE_1_BASELINE.md`
- `Migration-Playbook/MAINFRAME_QUESTION_STANDARD.md`
- `Migration-Analysis/MIGRATION_CONFIG.md`

Use `Mainframe/workspace/` as the only source root. First inventory the six input folders and report the actual files found, file types, IDMS program count, manual DB2 program count, likely pairs, unpaired files, and supporting artifacts. Do not begin deep analysis until you have made the inventory visible. If any essential files are missing or pairs are ambiguous, report the precise limitation; do not invent data.

Then complete the analysis and create outputs, not just a plan:

1. Analyze every confirmed IDMS program alongside its corresponding manually converted DB2 program.
2. Use Mapping, Schema, Dclgens and Copybook artifacts as supporting evidence.
3. Create one evidence-backed program migration report per confirmed program pair, using the provided report template.
4. Create four conditional generic migration guides:
   - non-LRF retrieval;
   - non-LRF update/restart;
   - LRF retrieval;
   - LRF update/restart.
5. For every proposed generic rule, record a stable rule ID, trigger/conditions, transformation, evidence, applicable programs, exclusions, exceptions and confidence. Cross-verify it against every applicable program; do not treat repeated patterns as universal without checking.
6. Analyze IDMS verbs and their real DB2 replacements; field/record → mapping → table/column → DCLGEN/host variable trace; working-storage/helper variables and all uses; cursor lifecycle and SQL status/error handling; LRF parent-child behavior; restart/buffer replacements; the eight decommissioned records; OCCURS/REDEFINES/FILLER/copybooks; COBOL/DB2 standards; and preservation of source execution order.
7. Preserve original business logic and paragraph/PERFORM execution order. Do not remove FILLER or helper variables just to make code look cleaner. Do not edit source programs.
8. Generate question files only for material, unresolved, program-specific IDMS-to-DB2 semantic decisions supported by exact source/target evidence. Follow `MAINFRAME_QUESTION_STANDARD.md`: default YES/NO, no generic questions, no test/build/environment questions, no speculative questions, and zero questions is valid. Do not ask for decommissioned record names or Restart/Buffer names; those are configured in `MIGRATION_CONFIG.md`.
9. Save question files under `Migration-Analysis/Human-in-Loops/`, with stable IDs and answer blocks.
10. Write all run output to a new unused `Migration-Analysis/Phase-1/Run-NNN/` directory with `programs/`, `generic/`, `COVERAGE_AND_VALIDATION.md`, and `_audit/`. Never overwrite an existing run.
11. The coverage report must list each input program and its status, pairing evidence/confidence, missing artifacts, unprocessed files, unresolved issues and checks actually performed.
12. Do not start Phase 2. Do not claim compilation, execution, DB2 runtime or regression validation unless actually performed.

Before finishing, provide a concise summary of: run folder created; programs found/paired/analyzed/not analyzed; generic guides created; question files created (or zero); key coverage limitations; and the exact validation activities actually performed.
