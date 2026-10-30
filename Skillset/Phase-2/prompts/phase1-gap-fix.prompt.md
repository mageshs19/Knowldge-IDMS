# Phase 1 Production Gap Fix

Execute the complete production continuation. Do not modify `Previous-Project-Snapshot/`.

## 1. Refresh deterministic baseline

From the repository root run:

```bash
python Work/scripts/build_engine_knowledge.py \
  --source-run Previous-Project-Snapshot/IDMS_DB2_Copilot_Project/Migration-Analysis/Phase-1/Run-001 \
  --out Work/Phase-1-Gap-Fix/Run-001

python Work/scripts/build_program_gap_assessments.py \
  --programs Work/Phase-1-Gap-Fix/Run-001/programs \
  --out Work/Phase-1-Gap-Fix/Run-001/program-gaps
```

## 2. Review all 41 programs

Read:

- every copied report under `Work/Phase-1-Gap-Fix/Run-001/programs/`;
- every matching file under `program-gaps/`;
- the original generic guide(s);
- `Work/docs/PRODUCTION_GAP_PLAN.md`;
- `Work/docs/PYTHON_ENGINE_CONTRACT.md`.

Do not sample.

For every program, determine:

- what reusable concepts it supports;
- which variants/counterexamples it introduces;
- which report findings remain program-specific;
- which existing Q IDs block a production conclusion;
- whether an addendum is needed because the original report is incomplete.

Create addenda only under:

`Work/Phase-1-Gap-Fix/Run-001/program-enhancements/`

Never edit the copied original report.

## 3. Build the complete semantic rule library

Create concept-specific rule files under `concepts/`. Do not create one giant generic document.

Every reusable semantic rule must also appear in `machine/rules.json` using `Work/schemas/rule.schema.json`.

`rule_occurrences.json` and keyword indexes are evidence discovery only. They are not semantic rules.

## 4. Re-synthesize all four high-level guides

Create/rebuild all four from the full corpus:

- `01_RETRIEVAL_WITHOUT_LRF.md`
- `02_UPDATE_RESTART_WITHOUT_LRF.md`
- `03_LRF_RETRIEVAL.md`
- `04_LRF_UPDATE_RESTART.md`

Do not trust the existing 04 guide as complete without cross-checking all applicable reports.

## 5. Build full coverage

Create `machine/coverage_matrix.json` and a human-readable `COVERAGE_AND_VALIDATION.md`.

For every semantic rule × every program report record exactly one:

- `APPLIES_SUPPORTS`
- `APPLIES_VARIANT`
- `APPLIES_CONTRADICTS`
- `NOT_APPLICABLE`
- `UNKNOWN`

Every non-applicable/unknown decision must include the tested condition or missing evidence.

## 6. Resolve gaps without waiting for humans

Use current evidence for all resolvable work. Existing unanswered Q IDs remain blockers only for their affected rules/programs.

Do not rewrite, renumber, merge or replace existing Q IDs.

## 7. Validate and publish

Run:

```bash
python Work/scripts/validate_continuation.py \
  --source-run Previous-Project-Snapshot/IDMS_DB2_Copilot_Project/Migration-Analysis/Phase-1/Run-001 \
  --run Work/Phase-1-Gap-Fix/Run-001

python Work/scripts/validate_production_package.py --project-root .
```

Fix structural failures. Then publish:

```bash
python Work/scripts/publish_final_output.py --project-root . --phase phase1
```

The result is incomplete if `Final-Output/` does not contain the 41 copied program reports plus the latest generic, concept, machine, gap/enhancement, human-review, coverage and validation artifacts.
