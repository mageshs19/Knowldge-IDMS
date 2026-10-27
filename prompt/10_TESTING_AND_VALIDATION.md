# Testing and what each result establishes

## Evidence levels

| Check | Establishes | Does not establish |
|---|---|---|
| Documentation hashes / links / AST | Notes cover current source and navigate correctly | Semantic accuracy or production readiness |
| Python parse/compile | Python source syntax is valid for that interpreter | Correct conversion or COBOL syntax |
| Python regression suite | Executed tests met assertions | All business paths, real DB2 behavior or scalability |
| Static COBOL/release review | Implemented checks passed with supplied evidence | Mainframe compile/link or external include behavior |
| Predicate model | Tested model agrees for its stated assumptions | Actual DB2 host-format/null behavior |
| Actual binary file comparison | Supplied files match byte count/order/content | Untested datasets, error/restart paths |
| Native precompile/compile and differential runs | Evidence from the tested target environment/cases | Universal correctness of future unseen programs |

## Local commands

```bash
python prompt/tools/maintain_docs.py check
python -m unittest discover -s prompt/tools -p 'test_*.py'
python -m pytest -p no:cacheprovider -o addopts= -q tests
python -m mainframe.zowe_pipeline all --from convert --to review
```

Disable pytest's cache provider when following the strict Markdown placement
policy: its default cache can create `.pytest_cache/README.md` outside `prompt/`.
Store scratch Markdown and iteration reports only in `prompt/temp/`. Non-Markdown
machine evidence may stay in the existing workspace/report directories.

The conversion command clears generated Output and Review; preserve required
baseline evidence before rerunning, not by editing generated COBOL. Tests that
need fixtures should use stable source fixtures rather than relying on stale
output artifacts surviving cleanup.

## Regression selection

Start with the owning module note's importing tests and the relevant package
index. Imports are only a discovery hint: fixtures, subprocess tests, dynamic
imports and indirect calls can add coverage. Add renamed synthetic cases and
negative/refusal cases for generic rules, then rerun all six samples for shared
changes. Test unsupported/ambiguous metadata without silently weakening the gate.

Review raw results, exit code, skipped tests and the environment. Do not report
success from a progress bar without a completed result. Keep historical and fresh
results clearly separated.

## Mainframe record comparison

Once manual and generated programs have run against the same approved data and
parameters, use the existing binary comparator. The 530-byte size below belongs
to the archived 7200 example; use the actual contract for other programs.

```bash
python -m mainframe.verification.fixed_record_diff \
  --manual manual_form.fb \
  --generated generated_form.fb \
  --record-size 530 \
  --report form_diff.json
```

Supply actual fixed-record bytes, not text-mode conversions or screenshots.
Validate row order, packed fields, padding, date sentinels and counters as well as
record counts. Native DB2 precompile, COBOL compile/link, external includes and
restart/error-path runs remain required for release.

## Source map

- [Tests package index](index/tests.md)
- [Fixed-record comparator](modules/mainframe/verification/fixed_record_diff.md)
- [Archive predicate model](modules/mainframe/verification/archive_date_predicate.md)
- [Review engine](modules/review/engine/reviewer.md)
- [Current evidence](13_CURRENT_BASELINE_AND_OPEN_ISSUES.md)


## Fetch inventory regression coverage (V126)

Run `python -m pytest -p no:cacheprovider -o addopts= -q
 tests/test_zowe_fetch_inventory.py tests/test_dzecabtv_fix.py` on one command line.
The inventory tests mock every library download and use isolated workspaces.
They cover six real source inputs, a synthetic 75-member population, upserts,
partial failure, actual LR-element dependencies, source-mode evidence, lexical
noise, persistence through conversion cleanup and atomic report publication.
The included workbook is a local-input snapshot, not evidence of live fetching.

The uploaded archive lacks three historical fixtures required by other tests:
`_expanded/VMDZ4310_expanded.cbl`, `_expanded/VMDZ1526_expanded.cbl`, and
`_baseline/VMDZ7200.cbl`. The same three tests fail on the untouched upload and
this feature branch; their assertions have not been weakened or fixtures invented.
See the iteration evidence in `prompt/temp/V126/` for exact commands/results.

## Offline fetch-report logic checks (V127)

`tests/test_zowe_reports_history.py` explicitly prohibits fetch entrypoints,
member lookup/download methods and network requests. It tests pure status/error
classification, per-program shared-dependency traces, append-only run history,
Excel text safety, lock/atomic failure handling, row/cell limits, legacy inventory
migration and cleanup preservation. An AST check inspects attempt recording before
a successful library return without executing that lookup.

```bash
python -m pytest -p no:cacheprovider -o addopts= -q tests/test_zowe_reports_history.py
```

The selected offline subset of the older inventory tests exercises mode detection,
lexing, inventory upserts and publication without invoking fetch. The older mocked
fetch integration tests remain in the repository, but are not run for this
iteration because the user prohibited running fetch. No live fetch, transport or
end-to-end fetch integration result is implied by the offline report tests.
See `prompt/temp/V127/` for the exact executed checks and retained evidence.
