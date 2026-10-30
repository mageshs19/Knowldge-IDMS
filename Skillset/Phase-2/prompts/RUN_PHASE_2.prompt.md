# IDMS -> DB2 Phase 2 Production Continuation

## Inputs
- `../IDMS_DB2_Copilot_Project/` is the immutable prior project and evidence baseline.
- `../Answer.txt` contains COBOL-team answers keyed by the existing `Q-xx` IDs.
- `program-baseline/` contains copied prior program reports for working use.
- `program-gaps/` is the per-program gap/enhancement work queue.

## Non-negotiable rules
1. Do not modify anything under `../IDMS_DB2_Copilot_Project/`.
2. Do not renumber, reorder, merge, split, or reinterpret existing `Q-xx` IDs.
3. Use `Answer.txt` only as scoped human business/configuration evidence.
4. Do not fabricate an answer where `Answer.txt` is blank or ambiguous; keep the rule/program state `UNRESOLVED`.
5. Continue from the existing program reports. Do not restart the corpus analysis from scratch.
6. Re-check every existing defect, business-rule difference, LRF/restart/status issue, and program gap that can affect conversion-engine rules.
7. Build reusable concept rules and machine-readable rules from evidence across all programs. A single program report is evidence, not a generic rule by itself.
8. Preserve counterexamples and variants. Never generalize from one program when another program contradicts it.

## Required work
1. Read all prior program reports and all `program-gaps/*.md` files.
2. Apply relevant `Answer.txt` responses by stable Q ID to affected program findings.
3. Complete or enhance `program-enhancements/` for every program that has a material gap.
4. Produce/re-synthesize all four generic guides in `generic/`:
   - `01_RETRIEVAL_WITHOUT_LRF.md`
   - `02_UPDATE_RESTART_WITHOUT_LRF.md`
   - `03_LRF_RETRIEVAL.md`
   - `04_LRF_UPDATE_RESTART.md`
5. Populate concept-specific files under `concepts/` for retrieval, update, LRF, restart, SQL/error handling, field mapping, helper variables, OCCURS/REDEFINES, ordering, decommissioning, audit, and naming as supported by the corpus.
6. Populate `machine/rules.json` with semantic rules suitable for a future Python converter. Each rule must include stable rule ID, concept, applicability conditions, legacy pattern, DB2 target pattern, exceptions, source programs, question dependencies, evidence status, and confidence.
7. Populate `machine/coverage_matrix.json` with one disposition for every rule x program pair.
8. Record answer impact, remaining unresolved questions, conflicts, and source evidence under `audit/`.
9. Run available validators/scripts and fix structural failures.

## Final publication
Create a complete self-contained result under `final-output/` containing:
- all prior program reports copied forward;
- all program enhancement files;
- all program gap dispositions;
- all four generic guides;
- all concept rules;
- machine JSON files;
- answer impact and audit files;
- a copy of the consumed `Answer.txt`;
- a manifest stating counts and unresolved items.

`final-output/` is the only handoff used by the future Python-engine work.
