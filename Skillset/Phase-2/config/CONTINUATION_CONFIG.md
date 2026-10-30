# Production Continuation Configuration

## Immutable source baseline

This package is self-contained. The supplied halfway project is copied under:

```text
../Previous-Project-Snapshot/IDMS_DB2_Copilot_Project/
```

Relative to `Work/`, use:

```text
SOURCE_PHASE1_RUN=../Previous-Project-Snapshot/IDMS_DB2_Copilot_Project/Migration-Analysis/Phase-1/Run-001
SOURCE_CONFIG=../Previous-Project-Snapshot/IDMS_DB2_Copilot_Project/Migration-Analysis/MIGRATION_CONFIG.md
PHASE1_GAP_OUTPUT=Phase-1-Gap-Fix/Run-001
PHASE2_OUTPUT=Phase-2
COBOL_ANSWER_FILE_PRIMARY=../Answer.txt
COBOL_ANSWER_FILE_ALTERNATE=Phase-2/input/Answer.txt
FINAL_OUTPUT=../Final-Output
```

Never edit, rename, regenerate or delete anything under `../Previous-Project-Snapshot/`.

## Required production outputs

Phase 1 gap-fix must produce all of the following under `Work/Phase-1-Gap-Fix/Run-001/`:

1. An unchanged copy of every original program report.
2. `program-gaps/00_INDEX.md` plus one `*__GAP_ENHANCEMENT.md` file per program report.
3. Exactly four re-synthesized high-level guides:
   - `01_RETRIEVAL_WITHOUT_LRF.md`
   - `02_UPDATE_RESTART_WITHOUT_LRF.md`
   - `03_LRF_RETRIEVAL.md`
   - `04_LRF_UPDATE_RESTART.md`
4. Concept-level rule files suitable for deterministic conversion logic.
5. `machine/rules.json` with semantic rules, not regex evidence only.
6. `machine/coverage_matrix.json` covering every rule against every program report.
7. `program-enhancements/` addenda for reports where the existing Phase-1 report is incomplete or needs corrected/expanded analysis. Never edit the copied original report.
8. `GAP_LEDGER.md` containing only remaining semantic blockers.
9. `COVERAGE_AND_VALIDATION.md` summarizing structural/static completeness.

Phase 2 must create a new complete revision under `Work/Phase-2/` and must never overwrite Phase 1. Use technical subfolders: `input/`, `normalized/`, `programs/`, `program-gaps/`, `program-enhancements/`, `generic/`, `concepts/`, `machine/`, and `audit/`.

After either phase, publish the whole current result into `../Final-Output/` with `scripts/publish_final_output.py`.

## Concept taxonomy

```text
concepts/
  01_platform/
  02_retrieval/
  03_store_insert/
  04_update_modify/
  05_lrf/
  06_cursor_sql/
  07_error_handling/
  08_restart_recovery/
  09_field_mapping_types/
  10_working_storage_helpers/
  11_occurs_redefines_storage/
  12_relationships_ordering/
  13_decommission/
  14_audit_fields/
  15_program_naming/
```

Each reusable rule must state its trigger, preconditions, exclusions, exact legacy behavior, DB2 replacement, status handling, field/type requirements, minimum helper variables, restart/cursor/LRF effects, variants, counterexamples, evidence programs, Q dependencies, and confidence.

Markdown explains the rule. `machine/rules.json` is the Python-engine contract.
