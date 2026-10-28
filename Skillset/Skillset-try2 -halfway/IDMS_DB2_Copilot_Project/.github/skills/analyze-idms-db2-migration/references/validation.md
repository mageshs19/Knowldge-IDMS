# Portable output validation

`scripts/validate_run.py` uses Python 3.10+ standard library only. It validates a complete phase package described by `_audit/run.json` and the schema-version-2 ledgers in [output-contracts.md](output-contracts.md). It never edits the source or reports.

```text
python scripts/validate_run.py --run /path/to/Migration-Analysis/Phase-1/Run-001
python scripts/validate_run.py --run /path/to/Migration-Analysis/Phase-2/Run-001
```

Paths inside a run are relative to that run. `roots.input` and `roots.project` resolve relative to the run directory unless absolute. `roots.project` means the Migration-Analysis root. This makes copied ZIP projects portable. Input evidence paths resolve beneath `roots.input`. Every input has its SHA-256 and original encoding. Question snapshots resolve beneath the run, and active question paths beneath `roots.project`.

The validator checks input/report identity equality, source hashes, four named guides, fifteen ordered report headings, case/rule/guide references, complete unique rule × input coverage, question/answer snapshot hashes, answer provenance and preserved Phase 1 fingerprints in Phase 2. It checks citations for accessible paths and line ranges when evidence records provide them. It does not establish correctness of the prose, code, SQL, business intent or reported dispositions.

For test runs include `execution_mode: TEST_REHEARSAL`, `simulated_answers_allowed: true` and a relative `roots.test`. Every synthetic answer record carries `answer_origin: SIMULATED_FOR_TEST`, `review_state: TEST_ASSUMPTION_ONLY`, and `production_resolution: OPEN`. Evidence derived from it uses `SIMULATED_TEST_ASSUMPTION`. Production runs use `execution_mode: PRODUCTION_ANALYSIS` and reject synthetic answers.

Phase 2 adds `baseline_files`, a list of `{path, sha256}` entries for all files in the preserved baseline. Paths resolve beneath `roots.project`. This optional extension is required by the bundled validator for a completed Phase 2 run. The baseline has not been proved preserved by a timestamp or filename alone.

Each ledger has `schema_version: 2`. Required arrays are `cases`, `rules`, `rows`, and `questions` in their respective files. Every case has `case_id`, `input_id`, `classification.guide_ids`, `rule_ids`, `question_ids`, and `evidence`. Every rule has `rule_id`, `guide_ids`, and `case_ids`. Matrix rows contain `rule_id`, `input_id`, `disposition`, `tested_condition`, and evidence or question references. Every question has its `raw_snapshot`, `file_sha256`, `answer_sha256`, origin, response/review/resolution states, and accepted scope. Use an accepted-scope object with `input_ids` and `business_conditions`; if retaining a textual scope from an earlier run, add an explicit `accepted_input_ids` array. Answer references must not cross this program scope. Answer hashes cover exact bytes strictly between the two HUMAN-ANSWER markers, including whitespace. Use forward slashes in portable ledger paths on every operating system.

A generic rule can apply beyond its original example cases. Its answer scope must intersect either the linked case inputs or a corresponding applicable/UNKNOWN matrix row that explicitly names that question. A NOT_APPLICABLE row does not authorize an answer's use. An additional cross-program check may have an empty case list, but it still needs its tested condition, evidence and precise question scope.

Use `--json` to print machine-readable validation results. An exit code of 0 means the artifact checks passed; 1 means validation failures, including missing or invalid ledger files; 2 means command-line invocation/argument failure. Accepted human intent must contain a substantive `Answer:` body with a compatible detected response state; blank flags alone do not count. For actual migration readiness, separately record precompile, compile/link, controlled Db2 execution, crash/restart and business reconciliation evidence.
