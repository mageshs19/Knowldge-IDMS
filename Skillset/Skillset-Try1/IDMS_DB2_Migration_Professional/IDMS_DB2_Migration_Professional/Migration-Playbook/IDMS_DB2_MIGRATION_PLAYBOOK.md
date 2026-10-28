# IDMS-to-DB2 Migration Analysis — Operating Playbook

**Purpose:** Reconstruct how the senior Mainframe COBOL developer migrated each supplied IDMS program into its manually converted DB2 program. Produce evidence-based program reports and four conditional, production-oriented generic migration guides. This playbook is plain Markdown and is designed to be pasted into or referenced from an approved AI coding assistant; it does not depend on a repository-specific skill folder or a Python utility.

## 1. Inputs

Use `Mainframe/workspace/` as the source root:

- `Copybook/`
- `Dclgens/`
- `Schema/`
- `Mapping/`
- `IDMS Programs/`
- `DB2 Manual converted Programs/`

Read `Migration-Analysis/MIGRATION_CONFIG.md` before analysis. It is the user's editable authority for program naming patterns, the eight decommissioned record names, and the two Restart/Buffer object replacements.

## 2. Mandatory principles

1. Analyze the source IDMS and corresponding manual DB2 program together. The target shows the developer's choices; it is not automatically proof of correctness.
2. Preserve original business behavior and execution sequence unless the source evidence and an explicit user decision support a change.
3. Ground every significant finding in exact file names and paragraph, statement, record, field, mapping, schema or DCLGEN evidence.
4. Separate confirmed project conventions from repeated patterns, candidates, program-specific behavior, conflicts and unknowns.
5. Never invent missing mappings, table names, decommissioned names, business outcomes or test results.
6. Do not modify application source programs. Create analysis artifacts only.
7. Generic rules must be conditional, include exclusions and be cross-checked against every applicable program. A rule is not universal merely because it appears in multiple programs.
8. Preserve user answers in question files. Phase 2 must not overwrite Phase 1 results.

## 3. What to analyze

For each program, analyze only where evidence exists:

- IDMS verbs and the real replacement behavior in DB2.
- IDMS field/record to DB2 table/column mapping; naming normalization; DCLGEN types, lengths and nullability.
- New/changed working-storage fields: declaration, every use, necessity, and whether a simpler equivalent preserves the established business style.
- Cursor declarations and lifecycle; OPEN/FETCH/CLOSE; predicates; SQLCODE/SQLSTATE and not-found/error paths.
- LRF logical-record behavior: parent/child relationships, IF/ELSE branches, missing parent/child outcomes, cardinality, retrieval order and error handling.
- OCCURS, OCCURS DEPENDING ON, REDEFINES, FILLER and copybook layout compatibility.
- The eight user-listed decommissioned records and their actual removal/replacement effects.
- User-specified Restart and Buffer object replacements, including keys, state, checkpoint semantics, updates, and recovery behavior where evidenced.
- COBOL/DB2 declarations, host variables, timestamps, cursor/query numbering, paragraph/PERFORM control flow, SQL conventions and other standards demonstrated by the manual conversions.

Do not force a topic into a report when it is irrelevant. Write `Checked — not applicable` only when it was genuinely checked.

## 4. Question policy — strict

Human reviewers are Mainframe COBOL/IDMS/DB2 developers. Ask a question only if:
- a real program-specific conversion ambiguity remains after checking relevant source and reference files;
- two plausible interpretations would materially change business logic, control flow, SQL result/status, parent-child behavior, data selection/order, update behavior or restart/replay semantics;
- the evidence and exact source/target locations can be cited; and
- the answer cannot be derived from the supplied artifacts or prior answers.

Default to one concise **YES/NO** question. Use a closed A/B/C choice only when there are genuinely distinct outcomes. Use an open question only rarely and explain why choices cannot capture the decision.

Never ask generic, trivial, speculative or unrelated questions. Do not ask about compiler/build/JCL/environment setup, test plans, general testing approvals, generic COBOL standards, or topics already resolved by source evidence. Do not ask the team for the eight decommission names or two replacement names: the user enters those in `MIGRATION_CONFIG.md`.

**Zero questions is the correct result when no substantive ambiguity remains.** Do not create questions to satisfy a count. If a manual conversion is clearly inconsistent with unambiguous source behavior, document the defect and evidence rather than asking a question whose answer is already clear.

Create one Markdown file per distinct unresolved decision under `Migration-Analysis/Human-in-Loops/`. Include stable ID, affected IDMS/DB2 filenames, exact locations, observed difference, business consequence, one closed question, and an answer block. Deduplicate equivalent questions and list all affected programs.

## 5. Phase 1 — Baseline analysis

Use `Migration-Playbook/PHASE_1_BASELINE.md`.

Write outputs only to `Migration-Analysis/Phase-1/Run-NNN/`. Never place Phase 1 outputs in Phase 2. Required deliverables:
- `programs/`: one report per IDMS program file.
- `generic/`: four generic guides, one for each category: non-LRF retrieval; non-LRF update/restart; LRF retrieval; LRF update/restart.
- `COVERAGE_AND_VALIDATION.md`: source inventory, pairing, missing evidence, program counts, and validation limitations.
- `_audit/`: manifests, evidence indexes and run notes.

Create only evidence-backed questions in the shared `Human-in-Loops/` folder. Mark any rule that depends on an unanswered question as provisional. Do not claim compilation, execution or semantic equivalence unless actually established.

## 6. Phase 2 — Answer application and cross-verification

Use `Migration-Playbook/PHASE_2_ANSWER_APPLICATION.md`.

Read all relevant answer files and the current configuration. Preserve user-authored answer blocks and all Phase 1 artifacts. Write outputs only to `Migration-Analysis/Phase-2/Run-NNN/`. Required deliverables:
- `programs/`: revised program reports.
- `generic/`: revised four generic guides.
- `COVERAGE_AND_VALIDATION.md`.
- `ANSWER_IMPACT.md`: each applied answer, impacted programs/rules, evidence checked, and remaining ambiguity.
- `_audit/`: decision provenance and cross-verification matrix.

Do not treat a non-empty answer as applied until it is reflected in the appropriate reports and checked. Ambiguous/conflicting answers remain unresolved and may create a concise linked follow-up question. Re-check each affected generic rule across all applicable programs.

## 7. Generic-rule quality bar

Every rule must include:
- rule ID and status;
- trigger conditions and preconditions;
- exact transformation or business decision;
- expected business behavior;
- relevant success/error/not-found/parent-child/restart/boundary scenarios;
- exclusions and program-specific exceptions;
- supporting programs and source evidence;
- program-by-program applicability status;
- regression scenarios and actual execution status, clearly separated;
- related question IDs.

Use applicability labels: `APPLIES`, `APPLIES_WITH_EXCEPTION`, `DOES_NOT_APPLY`, `CONFLICT`, `NOT_VERIFIED`. Do not count programs where the rule is irrelevant as successful validation. Do not fabricate test execution results.

## 8. Run completion report

At the end, state:
- input root and output run path;
- source IDMS program count and matched manual DB2 count;
- reports produced and missing counterparts;
- question files created, answered, applied, open and needing clarification;
- generic rules verified, exceptions and conflicts;
- checks actually performed and checks not performed.

This playbook defines an analysis workflow, not an automatic converter or proof that migrated COBOL compiles or is behaviorally equivalent.
