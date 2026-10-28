---
name: analyze-idms-db2-migration
description: Learn and document IDMS-to-DB2 COBOL migration from paired legacy and manually converted programs, copybooks, DCLGENs, schemas, and field mappings. Use for program-name matching, minimal helper variables, SQLCODE and LRF business/error rules, OCCURS/REDEFINES, decommissioning, and deep restart/buffer analysis. Produce one report per IDMS file and four conditional generic guides. Run Phase 1 without interactive business questions, save one editable Markdown file per uncertainty, then use human answers in Phase 2 to revise and cross-check all applicable programs.
---

# IDMS to DB2 Migration Analyst

## Required result

Analyze every supplied IDMS input file and the corresponding manual DB2 conversion. Produce one program report per IDMS file and these four self-contained generic guides in each complete phase/revision:

1. `01_RETRIEVAL_WITHOUT_LRF.md`
2. `02_UPDATE_RESTART_WITHOUT_LRF.md`
3. `03_LRF_RETRIEVAL.md`
4. `04_LRF_UPDATE_RESTART.md`

For 50 IDMS files, deliver **50 program reports + 4 generic guides** per complete phase/revision, plus configuration, question files, coverage and audit records. Analyze the whole corpus; do not sample.

Use two phases:

- **Phase 1:** build the complete available analysis without waiting for human answers. Put each independently answerable uncertainty in its own Markdown file in `Human-in-Loops/`, identify affected IDMS/DB2 filenames, and continue unaffected work.
- **Phase 2:** read the same question folder after humans add answers. Reassess affected code, business rules and generic patterns; publish a revised complete report set while preserving Phase 1 and the human answers.

Document and assess conversions by default. Change or generate application source only when separately requested. Treat manual code as implementation evidence, and human answers as scoped business/configuration evidence. Neither alone proves runtime correctness.

For an explicitly requested rehearsal with analyst-written answers, read [test-mode.md](references/test-mode.md). Keep the entire rehearsal under a separate test folder, label every synthetic answer `SIMULATED_FOR_TEST`, preserve unanswered Phase 1 snapshots, and never promote simulated intent to human confirmation or production approval.

## Required resources

Read [analysis-rules.md](references/analysis-rules.md), [two-phase-workflow.md](references/two-phase-workflow.md), and [output-contracts.md](references/output-contracts.md) before running.

Use [MIGRATION_CONFIG.template.md](assets/MIGRATION_CONFIG.template.md) for the user-editable project configuration and [HUMAN_QUESTION.template.md](assets/HUMAN_QUESTION.template.md) for each question.

Consult [vendor-sources.md](references/vendor-sources.md) for version-specific platform questions. Do not send private source code, record names, or business identifiers to public searches.

## 1. Resolve the workspace and editable configuration

Expect these paths unless the user overrides them:

```text
Mainframe/workspace/
  Copybook/
  Dclgens/
  Schema/
  IDMS Programs/
  DB2 Manual converted Programs/
```

Read the supplied `MIGRATION_CONFIG.md`. If absent, create a project instance from the template, fill only grounded information, and leave unknown fields blank. Accept equivalent run-prompt instructions and legacy YAML configuration; normalize them into the Markdown project configuration and an effective configuration snapshot. Do not require a workbook to be reformatted.

Allow the user to edit naming rules in the prompt or configuration, the eight decommission identifiers in IDMS or DB2 form, and the two old/new replacement rows directly in Markdown. Preserve those edits on reruns. Apply the latest explicit instruction to its stated scope; preserve provenance. Do not silently resolve contradictory business answers or unclear supersession.

Resolve access, mapping workbook/sheets/headers, program pairing overrides, schema/subschema/LRF definitions, versions, source format/encoding, standards and authorized validation environments. A path written in a prompt is not proof of access.

During either phase, put missing/ambiguous business or configuration questions in files instead of asking interactively. Continue unaffected work. If no source files can be accessed, produce the configuration, access-gap question and blocked run summary; state that inventory is unknown rather than inventing programs or counts. Respect actual tool/permission requirements.

## 2. Inventory and identify program pairs

Enumerate all files recursively, including extensionless members. Use `rg --files` or the provider's complete listing and ensure implicit ignore filters do not omit inputs. Assign identity from the relative source path; record explicit rename aliases when known. Do not identify different files solely by PROGRAM-ID.

Use this matching order:

1. Explicit per-file mappings supplied by the user.
2. Enabled, scoped program-name transformation rules.
3. Corroborating filename, PROGRAM-ID, call structure, dependency and business-flow evidence.

Treat naming transformations as candidate generation. Verify target existence, uniqueness and content correspondence. A name match alone is `NAME_CANDIDATE`, not `VERIFIED_PAIR`. Keep unmatched, ambiguous, split and merged pairs explicit.

The supplied examples support this limited candidate rule:

```text
VM1BD + exactly three digits -> VMDZ1 + the same three digits
VM1BD526 -> VMDZ1526
VM1BD567 -> VMDZ1567
```

Keep `vm1b720 -> DZvm1720` as a separately configurable alternative example. Do not infer that both rules apply globally. Only apply enabled rules within their recorded scope; the user's later prompt can replace or scope them.

Match the program-name token or filename stem, not arbitrary substrings. Preserve suffixes and leading zeros. Preserve actual filesystem spelling; case-insensitive logical matching must not silently rewrite filenames or merge case-sensitive duplicates. Keep filename, PROGRAM-ID and called-program identities separate. Never rename sources during analysis.

Create one report even for an unpaired, unreadable or non-program input. Cover multiple program units in a file inside that file's report. Allow evidenced one-to-many and many-to-one conversions. Record DB2-only files without inflating the IDMS report count. Record every explicit exclusion.

## 3. Recover effective behavior and evidence

Resolve transitive COPY, COPY REPLACING, SQL INCLUDE, IDMS COPY, schema/subschema/LRF definitions and relevant called modules. Preserve original paths, paragraph/statement anchors, original source locations and replacement context. Detect missing members, cycles, name collisions and version drift.

Respect fixed/free source form, encoding, continuation rules, comments, compiler directives and scopes. Do not treat regex hits as a complete COBOL parser.

Build indexes for control flow, business branches, legacy operations/currencies, DB2 statements/statuses/cursors, storage/overlays, mappings/types, relationships/LRF paths and units of work.

Use evidence for its actual purpose: code for observed behavior; mappings for intended identity; schema/LRF for legacy relationships, hidden conditions and custom statuses; DCLGEN for supplied SQL/host declarations; standards for conventions; documentation for platform constraints; human answers for scoped intent. Preserve contradictions.

For every material migration or retained-business case, record:

- Business preconditions, inputs, exact IF/EVALUATE/ON conditions, calculations and outputs.
- Legacy operations, buffer/currency effects, statuses and side effects.
- Actual DB2 replacement, field/type trace and control flow.
- Parent/child, zero/one/many, error, cleanup, commit and restart cases.
- Evidence, helper-variable decisions, alternatives, unanswered questions and validation.

Include unchanged material business rules with an explicit preservation assessment. Use stable case IDs. Preserve exact thresholds, status values, predicates, units and counter meanings.

Distinguish `OBSERVED`, `SUPPORTED`, `HUMAN_CONFIRMED_INTENT`, `INFERRED`, `CONFLICT` and `UNRESOLVED`. Keep implementation assessment separate from intended business policy.

In an authorized rehearsal only, use `SIMULATED_TEST_ASSUMPTION` for synthetic policy. A concrete source defect remains a defect after an answer. An observed manual-conversion convention is not automatically an approved migration rule.

## 4. Prioritize restart, LRF and SQL error semantics

Apply every relevant topic in analysis-rules.md. In particular:

- Derive field names through the mapping sheet and exact DCLGEN declarations. Use hyphen/underscore normalization only to locate candidates.
- Assess every introduced storage item, all reads/writes and value lifetime. Reuse a compatible existing field when safe. Require a platform or business/state reason for mandatory new storage.
- Inventory every observed SQLCODE/SQLSTATE/SQLWARN/row-count/indicator branch and error routine. Associate a status with the operation that produced it, including cleanup and subsequent SQL.
- Read schema/subschema/LRF path logic, selectors, predicates, transformations, error exits and custom statuses. Expand LR behavior into normalized IDMS operations before explaining the DB2 implementation.
- Explain restart as a business protocol: what is considered completed, what the checkpoint means, when updates/buffer/checkpoint/output effects become durable, and exactly what is repeated or skipped after each failure point.
- Resolve decommission entries supplied using either IDMS or DB2 names through actual mappings; avoid double-counting aliases and avoid guessing reverse mappings.
- Apply the two configured replacement names to the intended generic design. Keep actual names in source excerpts and report any disagreement with the supplied configuration.

Missing definitions or conflicting behavior create question files and explicit partial assessments, not fabricated equivalence.

## 5. Classify cases into four guides

Classify **cases and effective operations**, not whole programs into exclusive buckets.

| Guide | Include |
| --- | --- |
| 01 Retrieval without LRF | Navigational/non-LRF lookup, traversal and retrieval behavior |
| 02 Update/restart without LRF | Non-LRF changes, membership effects, checkpoint/buffer work and recovery |
| 03 LRF retrieval | LR selection, expansion, iteration, partial data and returned business/error outcomes |
| 04 LRF update/restart | LR update side effects, cross-record changes, checkpoint/buffer integration and recovery |

A mixed program contributes to multiple guides but still has one program report. Explain a retrieval case in its retrieval guide and reference it within the complete update/restart transaction where needed. Classify hidden path/called-module writes by actual effects. Do not assume a program is read-only when those dependencies are missing.

Keep common technical rules consistent through stable rule IDs and a central rule ledger. Include enough explanation in each applicable guide for that guide to stand alone. If no case supports a category, still produce its guide with “No supported examples in this corpus,” the checked scope and unresolved possibilities. Do not invent a migration recipe.

Include unclassified cases in the coverage report and the unresolved section of every plausibly relevant guide until evidence resolves the classification.

## 6. Produce and preserve the two-phase package

Keep everything under one project output folder:

```text
Migration-Analysis/
  MIGRATION_CONFIG.md
  Human-in-Loops/
    QUESTIONS_INDEX.md
    Q-000001__program__business-topic.md
  _control/
    questions-registry.json
    current-run.json
  Phase-1/Run-001/
    programs/
    generic/   (the four required files)
    COVERAGE_AND_VALIDATION.md
    _audit/
  Phase-2/Run-001/
    programs/
    generic/   (the four required files)
    COVERAGE_AND_VALIDATION.md
    ANSWER_IMPACT.md
    _audit/
```

Create only the phase being run; create Phase 2 when revised analysis is actually performed. Version changed completed runs rather than overwriting them. Keep active editable question files outside the preserved phase snapshots. Preserve original human-answer bytes and snapshot the precise answers consumed by each revision.

Use the detailed lifecycle, answer acceptance, stale-evidence handling and idempotency rules in two-phase-workflow.md. Finish Phase 1 with a question index and affected scopes; do not stop at a chat question. Phase 2 must make progress with partially answered files and retain remaining questions.

Each complete revision exposes all N program reports, even if some report contents are reused after dependency checks. Report completion states are `COMPLETE_STATIC`, `PARTIAL`, `BLOCKED`, or `NOT_A_PROGRAM`. Static completeness does not imply a successful build or execution.

## 7. Synthesize and cross-check the generic rules

Build the four guides from the full case union after all inputs have reports. Group only semantically equivalent cases: preconditions, cardinality, ordering, storage lifetime, statuses, outputs and transaction effects must agree. Retain single-program cases and conditional variants.

For each rule, specify applicability, exact business behavior, legacy and DB2 patterns, mapped declarations, minimum storage, failures/recovery, exceptions, production scenarios, source cases, human-answer dependencies and performed validation.

Test the applicability of **every rule against every enumerated input report identity**, including partial and unpaired programs. Record one disposition per rule/program pair:

- `APPLIES_SUPPORTS`
- `APPLIES_VARIANT`
- `APPLIES_CONTRADICTS`
- `NOT_APPLICABLE`, with the tested condition and evidence
- `UNKNOWN`, with the missing evidence/question
- `NOT_A_PROGRAM`, with classification evidence

Require the full rule/program matrix; repeated examples are not a substitute. Absence from a text search is not proof of non-applicability when effective dependencies are unresolved. Keep all counterexamples visible. State corpus-wide applicability as unresolved wherever it is unknown.

Use scenario tables for normal, boundary, zero/one/many, missing parent/child, null/error, partial update, commit/crash, resume/replay and concurrency cases as applicable. Separate static corpus checks, precompile, compile/link, controlled execution and business reconciliation. Never label a pattern production-proven solely because humans answered questions.

## 8. Final reconciliation and delivery

Verify:

- One report per enumerated IDMS file, with explicit exclusions and source/target pairing state.
- All four guides exist; every program case maps to guide rules/variants or a visible unresolved entry.
- Every original operation, material business branch, SQL operation and added storage item is accounted for.
- Applicable mapped fields resolve to exact declarations or explicit blockers.
- Eight distinct supplied decommission entities and both replacements are traced, with identity/scope gaps visible.
- Every rule/program pair has one matrix disposition and supporting evidence or a question.
- Every uncertainty has a stable question ID; no human answer was overwritten or duplicated.
- Phase 2 records answer acceptance, affected artifacts, remaining conflicts and changed conclusions.
- Input/configuration/dependency/answer fingerprints justify all reused content; original source files remain unchanged.

Persist the project package through the environment's normal file workflow, retaining any supplied project/repository destination. Present phase, N program reports + 4 guides, question/answer counts, significant findings, and links to the package and editable question/configuration files. Do not claim that the user's actual programs were analyzed when only a skill or template was created.

When the bundled validator is available, run `python scripts/validate_run.py --run <run-folder>` using the path relative to this skill. It checks the output contract and fingerprints, not COBOL semantics or Db2 execution. Read [validation.md](references/validation.md) for the portable ledger contract. Fix structural failures before declaring the package complete. Record missing runtime checks separately.
