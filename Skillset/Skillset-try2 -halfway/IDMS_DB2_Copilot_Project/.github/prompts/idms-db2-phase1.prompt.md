---
description: Analyze all IDMS and manual Db2 pairs and save Phase 1 reports and questions.
agent: agent
---

Read the complete [migration skill](../skills/analyze-idms-db2-migration/SKILL.md) and every required reference.

Execute Phase 1 using `Migration-Analysis/MIGRATION_CONFIG.md` unless this invocation names another configuration. Resolve paths from the opened repository root. Analyze all files in the configured IDMS folder and the corresponding manual Db2 conversions, copybooks, DCLGENs, schemas and mapping sheet.

Produce one report per IDMS file, four complete generic guides, the full rule/program matrix, and one editable question file per independent uncertainty. Continue without interactive business questions. Preserve original source. Do not use `tests/` or synthetic answers unless explicitly directed to the isolated test configuration. Run the bundled artifact validator. Report actual counts, defects, unresolved dependencies and unperformed runtime checks.
