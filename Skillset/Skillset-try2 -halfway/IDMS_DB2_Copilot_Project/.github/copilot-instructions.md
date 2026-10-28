# IDMS to Db2 analysis project

Use `.github/skills/analyze-idms-db2-migration/SKILL.md` and its required resources for migration analysis. Follow the user-selected phase and configuration. This repository documents migration evidence; modify application source only when explicitly requested.

Production defaults: input `Mainframe/workspace/`, configuration `Migration-Analysis/MIGRATION_CONFIG.md`, output `Migration-Analysis/`. Do not scan `tests/` as production input or import simulated answers from it. Test data and test outputs live under `tests/six-program-sample/`.

Phase 1 must inspect every IDMS file, write one complete report per file and four generic guides, and save one Markdown file per independent uncertainty. Continue through unresolved business questions without waiting for chat answers. Use exact evidence and keep missing declarations/schema/standards visible.

Phase 2 preserves completed Phase 1 files, consumes the saved answer sections with exact provenance, revises affected conclusions, and publishes a complete revised set. Answers clarify intent; code defects and missing runtime proof remain separate. Never turn `SIMULATED_FOR_TEST` into human confirmation.

Use the stable question registry and full rule/program applicability matrix. Run `python tools/validate_migration_run.py --run <completed-run-folder>` before claiming artifact completeness. This validates the package, not the COBOL or Db2 runtime.
