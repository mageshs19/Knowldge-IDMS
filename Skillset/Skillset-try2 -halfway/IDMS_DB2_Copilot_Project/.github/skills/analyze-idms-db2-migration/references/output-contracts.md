# Output contracts

## Contents

1. Run package and preservation
2. Program report: fifteen required sections
3. Four generic guides and cross-program verification
4. Coverage and answer-impact documents
5. Audit structures: schema version 2
6. Completion checks

## 1. Run package and preservation

Use the directory layout and lifecycle in SKILL.md and two-phase-workflow.md. Keep the editable `MIGRATION_CONFIG.md`, `Human-in-Loops/` and `_control/` at the project root.

Write each completed baseline beneath `Phase-1/Run-NNN/` and each revised analysis beneath `Phase-2/Run-NNN/`. Preserve all completed runs and exact consumed answer versions. Resume unfinished or unchanged runs without duplicating identities or artifacts.

Define N as enumerated IDMS files minus explicit recorded exclusions; include non-program and unreadable files in N. Expose N complete report documents, four guide documents and `COVERAGE_AND_VALIDATION.md` in every deliverable revision. Add `ANSWER_IMPACT.md` in Phase 2. A complete document set can contain PARTIAL or BLOCKED analyses.

Write reports to `programs/<original-relative-path-including-extension>__migration.md`. Preserve subfolders and original extensions; record reversible filename encoding where required. Carry full unchanged report content into a revision after dependency checks, refresh its revision provenance, and record `reused_from`. Do not substitute pointer-only stubs.

Keep human-owned answer sections unchanged. Snapshot questions as issued in Phase 1 and exact question/answer files consumed in Phase 2. Follow the marker, conflict, supersession and stale-answer rules in two-phase-workflow.md.

If inventory is inaccessible, declare it UNKNOWN, produce the blocked summary/configuration/access question, and avoid invented N, program reports or coverage claims.

## 2. Program report: fifteen required sections

Title each report `<input-relative-path> — IDMS to DB2 Migration Analysis`. Retain all fifteen sections in this order. Use actual identifiers and concise before/after code excerpts, including controlling conditions and status branches. Label proposals explicitly. Record verified absence with inspection evidence; keep unavailable evidence unresolved.

### 1. Identity, scope and completion

Record phase/run, baseline, previous revision, original path, stable input identity, all PROGRAM-IDs, converted paths and hashes, environment, standards, analysis date, report status and reuse provenance.

Record each pairing's explicit override or naming-rule ID, enabled scope, candidate generation, existence/uniqueness checks and code correspondence. Distinguish NAME_CANDIDATE, VERIFIED_PAIR, ambiguous, missing, split and merged relationships. Preserve prompt/configuration provenance and actual filename spelling.

List case/guide memberships, applicable question IDs, consumed answer hashes, accepted scope and remaining blockers. Use COMPLETE_STATIC, PARTIAL, BLOCKED or NOT_A_PROGRAM; never equate static completeness with execution proof.

### 2. Business purpose and flow

Explain entry inputs, outputs, business selections, calculations, routing, parent/child roles, updates, failure behavior and units of work. Distinguish observed behavior, human-confirmed intent and inference. Cover all program units within the source file.

### 3. Dependency and declaration inventory

List copybooks and replacement context, DCLGENs, schema/subschema/LRF definitions, called modules, unresolved dependencies, introduced/removed includes and declaration concerns. Record dependency versions/hashes and source anchors.

### 4. IDMS operation replacement ledger

| Case ID | Original operation/location | Business condition/state | Actual DB2 replacement/location | Preserved/changed behavior | Status/error outcome | Evidence/questions |
| --- | --- | --- | --- | --- | --- | --- |

Cover every occurrence, including removal, non-SQL service replacement and unmatched operations. Include retained material business branches; retain distinct conditions even when explanations are shared.

### 5. Field, type and naming trace

| IDMS record.field | Mapping sheet/row | DB2 schema.table.column | DCLGEN SQL type | COBOL host item + PIC/USAGE | Reuse/rename/conversion | Null/layout issue | Evidence/questions |
| --- | --- | --- | --- | --- | --- | --- | --- |

Separate unmapped fields, type conflicts, derived values and ambiguous normalized names. Preserve mapping provenance and exact emitted SQL/COBOL identifiers.

### 6. Working-storage and helper assessment

| Added/changed item | Category/declaration | Purpose | Writes/reads/lifetime | Existing-field alternative | No-new-helper feasibility | Mandatory reason/removal rationale | Verdict/evidence |
| --- | --- | --- | --- | --- | --- | --- | --- |

Count mandatory platform, mandatory business/state, optional convention, redundant and unresolved items. Distinguish renames and aliases/condition names from new allocated storage.

### 7. Cursor lifecycle and transaction flow

Explain each query's cardinality, ordering/ties, parameter lifetime, parent/child nesting, OPEN/FETCH/CLOSE, early exits, cleanup, update intent, commit/rollback, reopen and restart. Trace status ownership across nested SQL and calls.

### 8. Error and business-outcome decision table

| Producing operation | Legacy result | Business condition | DB2 SQLCODE/SQLSTATE/warning/row-count/indicator | Consuming branch | Output/recovery action | Equivalence issue/questions |
| --- | --- | --- | --- | --- | --- | --- |

Cover every observed status branch, warnings, business rejections and called error routines. State whether diagnostics survive cleanup or later SQL; distinguish no parent, no child, exhausted iteration and zero affected rows.

### 9. OCCURS and REDEFINES

Document counts/bounds, indexing, active overlays/selectors, group moves, host eligibility, simultaneous value lifetimes and boundary cases. Explain empty, maximum and stale-data behavior.

### 10. LRF normalization and parent/child cases

Trace each LR request through supplied path/group selection, normalized IDMS operations, component mappings and actual DB2 control flow. Preserve selector order, predicate precedence, transformations, initialization, OF LR input lifetime, RESET/resume behavior and hidden update effects.

| LR case/path | Selector/WHERE condition | Component/parent-child state | Path operation or error exit | Standard/custom status + exact value | Valid/stale component data | Consuming ON/IF branch | DB2 outcome/evidence/question |
| --- | --- | --- | --- | --- | --- | --- | --- |

Include found/missing parent, zero/one/many or filtered children, partial LR, exhausted path, custom business rejection and database failure. Explain infeasible combinations. Identify exact missing path definitions; do not infer their semantics from record layouts.

### 11. Eight decommissioned records

| Supplied namespace + exact name | Resolved IDMS identity | Resolved DB2 identity | Mapping/alias evidence | Direct/transitive uses | Removal/replacement | Retained business obligations | Residual references/verdict/questions |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |

Accept IDMS, DB2 or both namespaces; resolve qualified identities through evidence. Preserve splits/merges and ambiguity. Count distinct business entities, not aliases. Cover all eight supplied entities, including verified non-use; record missing identities and count mismatches without inventing entries.

### 12. Restart and buffer replacements

Provide separate restart and buffer subsections with exact configured old/new identities, actual source identities, key/field/DCLGEN mappings, discrepancies and business roles. Describe buffer staging/queue/cache/work-state behavior and producer/consumer ownership.

| Protocol step/state | Entry condition + job/run/partition | Business unit/action | Checkpoint key/value meaning | Data/buffer/output effects | Transaction boundary + durable state | Next state/resume predicate | Evidence/questions |
| --- | --- | --- | --- | --- | --- | --- | --- |

Trace fresh start, missing/stale restart row, resume, completion, cancellation and completed-run rerun. Explain last-completed versus next-to-process meaning, ordering/ties, counter/total restoration, cleanup, called-program commits and concurrency ownership.

| Failure/scenario ID | Failure point | Committed data/checkpoint/buffer/output | Restart selection/order | Replayed/skipped work | Duplicate/loss prevention or defect | Legacy/DB2 comparison | Performed validation/questions |
| --- | --- | --- | --- | --- | --- | --- | --- |

Cover failures before/after business writes, buffer writes/consumption, checkpoint writes, external outputs and commits, including uncertain commit outcomes. Include empty input, mid-group failure, repeated restart, equal keys, changed input and overlapping runs where applicable. Do not claim atomicity or exactly-once behavior without evidence.

### 13. COBOL/SQL standards and defects

Assess declarations/includes, host restrictions, scopes, names, initialization, removed dependencies, undefined references and control-flow syntax. Separate demonstrated behavior defects, likely defects, style concerns and optional improvements. Keep severity separate from confidence.

### 14. Validation scenarios and results

| Case/test ID | Input/database state | Expected legacy or confirmed-intent behavior | DB2 observation/expectation | Check actually performed | Result/limitation |
| --- | --- | --- | --- | --- | --- |

Separate static review, precompile, compile/link, controlled execution and business reconciliation. Record unavailable checks as unperformed; do not promote a human answer into runtime evidence.

### 15. Reusable cases, exceptions and open questions

| Case ID | Access/effect classification | Guide memberships | Rule/variant or unresolved entry | Question + answer version | Assessment/remaining impact |
| --- | --- | --- | --- | --- | --- |

List every case and retained exception. Link each independent uncertainty to its own question file naming affected IDMS/DB2 files. State accepted answer scope and whether implementation preserves it, changes it intentionally, contradicts it or remains unresolved.

## 3. Four generic guides and cross-program verification

Write these four self-contained files beneath each run's `generic/` directory:

| Guide ID | Filename | Case scope |
| --- | --- | --- |
| G01 | 01_RETRIEVAL_WITHOUT_LRF.md | Non-LRF retrieval/traversal |
| G02 | 02_UPDATE_RESTART_WITHOUT_LRF.md | Non-LRF updates, checkpoint/buffer work and recovery |
| G03 | 03_LRF_RETRIEVAL.md | LR selection, expansion, iteration, partial data and returned statuses |
| G04 | 04_LRF_UPDATE_RESTART.md | LR changes, hidden side effects, checkpoint/buffer integration and recovery |

Classify cases by effective access mechanism and effects; allow several guide memberships per program/case. Explain retrieval separately and reference it inside the complete update transaction. Keep unresolved classification visible in coverage and every plausibly relevant guide. Supply an explicit no-supported-examples section for empty categories.

Organize each guide into: scope/evidence; observed business-case catalog; conditional migration rules; mappings/declarations/minimum storage; errors/transactions/restart; decommission/replacement impacts; exceptions/conflicts/questions; validation scenarios; and full case/rule crosswalk. Repeat necessary shared explanations consistently using central rule IDs.

For each stable RULE ID, provide applicability/preconditions, exact business behavior, legacy pattern, evidenced DB2 pattern, field/type requirements, minimum helpers and safe alternatives, status/cleanup/recovery, full variants/counterexamples, validation, source cases and consumed answer versions.

Separate platform constraints, supplied business policy, repeated conventions, conditional patterns, single-program exceptions and unresolved proposals. Keep exact thresholds, code values, branches and units. Frequency or human confirmation alone does not establish implementation correctness.

| IDMS input | DB2 file(s) | Report/status | Case ID | Guide + rule/variant or unresolved entry | Questions |
| --- | --- | --- | --- | --- | --- |

Include every applicable case; use an explicit no-case/blocker row for inputs with no usable cases. Put corpus-wide coverage in COVERAGE_AND_VALIDATION.md and guide-specific coverage in each guide.

For every rule, evaluate every input report identity, including partial/unpaired/non-program inputs. Record exactly one of APPLIES_SUPPORTS, APPLIES_VARIANT, APPLIES_CONTRADICTS, NOT_APPLICABLE, UNKNOWN or NOT_A_PROGRAM. Require tested conditions and evidence, or the precise missing dependency/question.

Maintain the complete R × N rule/program matrix in `_audit/rule-applicability.json`. Preserve every contradiction and unknown; attach variant IDs where relevant. Recheck the entire matrix after answer-driven rule changes. Never infer non-applicability from an unsuccessful text search with unresolved effective dependencies.

## 4. Coverage and answer-impact documents

### COVERAGE_AND_VALIDATION.md

State phase/run, baseline/reuse provenance, inventory availability, effective configuration and evidence limits. Reconcile identities, not only totals.

Report enumerated/excluded/report counts; COMPLETE_STATIC/PARTIAL/BLOCKED/NOT_A_PROGRAM counts; verified/candidate/ambiguous/missing pairings; DB2-only files; cases by guide and unresolved classification; all four guide paths; and complete case-to-rule coverage.

Report R, N, expected R × N rows, actual unique matrix rows and disposition counts. List contradictory/unknown rule scopes and missing matrix entries. Distinguish complete matrix recording from complete semantic resolution.

Report field/dependency/LRF gaps, helpers by verdict, eight-entity resolution/coverage, both replacement protocols, question response/review/resolution counts and evidence changes. Link all remaining gaps to stable questions.

List scenario coverage and checks actually performed by validation level. State source/configuration/answer fingerprints and any justified reuse. Do not claim production readiness from static or human review alone.

### ANSWER_IMPACT.md — Phase 2 only

Identify the exact Phase 1 baseline, previous revision and current evidence snapshot. Include every supplied answer, including empty, partial, deferred, stale and conflicting responses.

| Question + answer hash | Response/review state | Accepted scope/preconditions | Previous finding → revised finding | Affected reports/cases/rules/guides | Implementation issue | Revalidation/remaining question |
| --- | --- | --- | --- | --- | --- | --- |

Record newly revealed defects, deliberate policy supersession, new/superseded questions, unchanged conclusions, safely reused reports and validation still required. Explain why an answer clarifies intent without establishing implementation equivalence. Retain unresolved conflicts instead of selecting by timestamp.

## 5. Audit structures: schema version 2

Keep metadata separate from narrative reports. Use valid JSON with `schema_version: 2` in each ledger. Treat the compact examples below as minimum shapes; replace placeholders and add evidence/detail fields as needed. Use stable IDs and paths relative to their declared root; retain explicit rename aliases.

Store evidence as source-relative path, paragraph/statement anchor, original physical location, source hash and expansion/replacement context. Store mapping evidence with workbook/sheet/row or cell. Keep evidence state, implementation assessment, severity, confidence and validation distinct.

### _audit/run.json

```json
{
  "schema_version": 2,
  "run_id": "Phase-2/Run-001", "phase": 2, "baseline_run": "Phase-1/Run-001",
  "previous_revision": null, "run_state": "COMPLETE_WITH_GAPS", "inventory_state": "KNOWN",
  "roots": {"input": "resolved source root", "project": "Migration-Analysis"},
  "configuration": {"snapshot": "_audit/config.snapshot.md", "effective": {}, "hash": "...", "provenance": []},
  "inputs": [{"input_id": "stable relative-path identity", "path": "...", "category": "IDMS", "sha256": "...", "encoding": "...", "dependency_ids": []}],
  "programs": [{"input_id": "...", "program_ids": [], "pairing": {"state": "VERIFIED_PAIR", "target_ids": [], "name_rule_ids": [], "scope": "...", "evidence": []}, "report": "programs/...", "status": "PARTIAL", "case_ids": [], "question_ids": [], "blockers": [], "reused_from": null, "dependency_fingerprint": "..."}],
  "exclusions": [], "unpaired_db2_files": [],
  "guides": [{"guide_id": "G01", "path": "generic/01_RETRIEVAL_WITHOUT_LRF.md"}],
  "ledgers": {"cases": "_audit/cases.json", "rules": "_audit/rules.json", "applicability": "_audit/rule-applicability.json", "questions": "_audit/questions.json"},
  "fingerprints": {"inventory": "...", "dependencies": "...", "configuration": "...", "answers_and_scope": "...", "analysis_version": "..."},
  "validation": []
}
```

Include all four guide entries. Record source exclusions with reasons, configuration overrides/supersession with provenance, and each performed check with environment, result and evidence. Permit UNKNOWN inventory and IN_PROGRESS/BLOCKED run states; do not use zero as an unknown count.

### _audit/cases.json

```json
{
  "schema_version": 2,
  "cases": [{
    "case_id": "stable case ID", "case_key": "persistent semantic identity", "input_id": "...", "report_anchor": "...",
    "classification": {"access": "LRF", "effects": ["RETRIEVAL"], "guide_ids": ["G03"]},
    "topic": "...", "business_condition": "...", "legacy_behavior": "...", "db2_behavior": "...",
    "evidence": [], "evidence_state": "OBSERVED", "implementation_assessment": "UNRESOLVED",
    "helper_decision": "...", "rule_ids": [], "variant_ids": [], "question_ids": [],
    "answer_refs": [], "dependency_ids": [], "validation": []
  }]
}
```

Use NON_LRF, LRF or UNKNOWN access and evidenced RETRIEVAL/UPDATE/RESTART/BUFFER effects; preserve unresolved classification. Do not derive stable case identity solely from line numbers or mutable source hashes.

### _audit/rules.json and _audit/rule-applicability.json

```json
{
  "schema_version": 2,
  "rules": [{
    "rule_id": "RULE-...", "rule_key": "...", "kind": "CONDITIONAL_PATTERN", "guide_ids": ["G02"],
    "applicability": "...", "behavior": "...", "case_ids": [], "variants": [], "counterexamples": [],
    "evidence": [], "question_ids": [], "answer_refs": [], "dependency_ids": [], "validation": [], "unresolved": []
  }]
}
```

```json
{
  "schema_version": 2, "run_id": "Phase-2/Run-001", "rule_ids": [], "input_ids": [],
  "rows": [{
    "rule_id": "RULE-...", "input_id": "...", "disposition": "UNKNOWN",
    "tested_condition": "...", "case_ids": [], "variant_ids": [], "evidence": [],
    "missing_evidence": [], "question_ids": [], "answer_refs": [], "checked_fingerprint": "..."
  }]
}
```

Require one unique row per rule/input pair. Link guide variants and counterexamples to the central rule record; retain platform evidence where a rule has no implementation example.

### _audit/questions.json and immutable snapshots

```json
{
  "schema_version": 2,
  "questions": [{
    "question_id": "Q-000001", "source_file": "Human-in-Loops/Q-000001__program__topic.md",
    "raw_snapshot": "_audit/questions/Q-000001.md", "file_sha256": "...", "answer_sha256": "...",
    "response_state": "PROVIDED", "review_state": "ACCEPTED_FOR_SCOPE", "accepted_scope": "...",
    "resolution_state": "RESOLVED", "implementation_assessment": "DEFECT",
    "evidence_fingerprint": "...", "revalidation_reason": "...", "affected_ids": [], "successor_ids": []
  }]
}
```

Snapshot full original file bytes and hash the human-owned answer separately; record absent/unparseable answers explicitly. Preserve baseline question snapshots and every consumed answer version. Reference answers from cases/rules by question ID, answer hash and accepted scope, not question ID alone.

### Root _control/questions-registry.json

```json
{
  "schema_version": 2, "next_sequence": 2,
  "questions": [{
    "question_id": "Q-000001", "question_key": "underlying uncertainty + stable scope",
    "path": "Human-in-Loops/Q-000001__program__topic.md", "first_seen_run": "Phase-1/Run-001",
    "input_ids": [], "case_ids": [], "rule_ids": [], "evidence_anchors": [], "dependency_ids": [],
    "response_state": "UNANSWERED", "review_state": "NOT_REVIEWED", "resolution_state": "OPEN",
    "successor_ids": [], "snapshots": [{"run_id": "Phase-1/Run-001", "path": "...", "file_sha256": "...", "answer_sha256": null}]
  }]
}
```

Preserve question IDs across wording/location changes; reuse the uncertainty key and retain superseded entries. Keep current answer text authoritative in its editable file. Store `schema_version`, current run path, phase, baseline, manifest hash and declared state in `_control/current-run.json`; update it only after coherent checkpoint/delivery.

## 6. Completion checks

Require the input/report identity sets to agree after explicit exclusions, with all N reports and four guides in each declared complete revision. Reconcile every operation, material branch, SQL statement, added helper, mapped field and program case to an assessment or explicit blocker.

Require every case in a guide crosswalk or visible unresolved entry, and every rule/input pair in the unique R × N matrix. Check all decommission entities, both replacement protocols, LRF custom-status branches and applicable crash/replay scenarios.

Account for every uncertainty and supplied answer; retain answer bytes, accepted scopes, fingerprints, contradictions and supersession history. Verify that Phase 2 revisions preserve Phase 1 and justify all reuse.

Deliver useful partial analysis with precise limitations. State static completeness, build/execution evidence and business confirmation separately; never infer universal correctness from report counts.
