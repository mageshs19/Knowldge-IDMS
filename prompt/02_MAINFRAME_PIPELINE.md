# Mainframe batch, workspace and transfer lifecycle

## Entrypoint and step order

`python -m mainframe.zowe_pipeline` parses a command and optional inclusive
`--from`/`--to` bounds. `PIPELINE_STEPS` is `fetch, convert, review, upload`.
`init`, `show`, `plan` and `clean` are separate maintenance commands. Exit
constants are `0` (OK), `1` (nothing), and `2` (error). `run_steps` stops at a
FAILED step. SKIPPED and NOTHING do not alone constitute a failure, so examine
the selected range and logs rather than equating an overall message with release.

Use the offline conversion/review range for workspace development:

```bash
python -m mainframe.zowe_pipeline all --from convert --to review
```

## Workspace and immutable inputs

`zowe_workspace.workspace_root()` reads `ZOWE_WORKSPACE_ROOT` through the settings
layer, otherwise uses `mainframe/workspace/`. It exposes Mapping Sheet, Program,
Copybook, DCLGen, Subschema, Output, Review, Logs and reports directories. The normal
runner environment sets `IDMS_INPUT_DIR` to this root, puts repository and `src`
on `PYTHONPATH`, and runs the child from the repository root.

`step_convert` checks mapping/program availability then invokes
`clean_generated()`. Cleanup deletes managed Output and generated Review contents, recreates
them, and leaves input/manual assets intact. Durable inventory and search-history
workbooks live in reports/, outside cleanup. A legacy Review inventory is migrated
before deletion; migration failure aborts cleanup. No stale conversion review/approval is preserved. Do not replace this with broad
workspace deletion. Documentation cleanup is separate and must never delete
source or manual COBOL.

## Stage contracts

| Stage | Actual responsibility |
|---|---|
| Fetch | `ZoweFetcher.fetch_all()` resolves selected programs and supporting libraries, writes local assets and upserts `reports/IDMS_Program_Inventory.xlsx`; appends dependency library attempts to `reports/IDMS_Dependency_Search_History.xlsx`. Ordered attempts survive later success, and shared dependency traces remain associated with each program. Both report writes are attempted on handled partial failures; a failure publishing either report is explicit. |
| Convert | Run `runners/convert_programs.py`; choose update/retrieval converters using source evidence; retain logs and candidate files. |
| Review | Run `review/runner/review_file.py` with output, report folder, kind and `--workspace`; then independently call `audit_generated_batch()`. Both must succeed. |
| Upload | Rerun structural and semantic checks even when invoked alone. Preflight derived-copybook dataset configuration before transport. Upload generated copybooks before referring COBOL members. |

`zowe_steps._run()` streams child output into an in-memory transcript and writes
it under workspace Logs; console output is a digest unless verbose. A declared
timeout constant elsewhere does not prove enforcement: inspect `_run` before
claiming subprocess timeout behavior.

## Operational cautions

Never run fetch/upload merely to check documentation. Do not put passwords,
tokens or connection secrets in prompt notes. Preserve exact artifact identity
and dataset member rules; similarly named programs or renamed copybooks must not
be silently merged. Source metadata and derived-copybook provenance are required
for upload approval.

Markdown iteration reports belong in `prompt/temp/`; operational `.log`, `.csv`,
`.json` and candidate `.cbl` artifacts retain their existing workspace locations.
This is a Markdown placement policy, not a relocation of all pipeline outputs.

## Source map

- [CLI and range selection](modules/mainframe/zowe_pipeline.md)
- [Stage implementations](modules/mainframe/zowe_pipeline_steps.md)
- [Subprocess contract](modules/mainframe/zowe_steps.md)
- [Workspace cleanup](modules/mainframe/zowe_workspace.md)
- [Fetch](modules/mainframe/zowe_fetcher.md)
- [Copybook upload preflight](modules/mainframe/zowe_copybook_upload.md)
- [COBOL upload](modules/mainframe/zowe_writer.md)


## Excel input register

See [the fetch inventory contract](16_FETCH_INVENTORY.md) for column meanings,
mode rules, missing-member diagnostics, incremental upserts, offline rebuilding,
atomic writes and limitations. This is the existing manifest responsibility made
executable, not an extra conversion pass. `write_execution_manifest()` now writes
the stable Excel workbook; old undefined MANIFEST_* constants are no longer used.

Source notes: [inventory writer](modules/mainframe/zowe_manifest.md),
[dependency resolver](modules/mainframe/zowe_resolver.md), and
[fetch tests](modules/tests/test_zowe_fetch_inventory.md).

## Library-search observation contract (V127)

`LibrarySearch._lookup()` keeps ordered `SearchAttempt` objects in
`search_history[member]` for both successful and failed lookups, as well as the
compatibility HTTP-status map. The fetcher attaches this trace to the active
source program using `SearchHistoryRecorder`. A run-local cache reuses downloads
but records every program/member relationship; the Excel remark identifies
reused observations. No rows are invented for untried fallback libraries.

The dependency history has the six requested columns followed by Run ID and UTC
time. HTTP 200 is Found, 404 is Not Found, and other responses/exceptions are
Error. Missing library configuration is Not Searched. Diagnostic text excludes
raw response bodies and exception messages that might contain credentials.
Reports are independent atomic files, not a transaction spanning both workbooks.
One pipeline writer per workspace is still required. Hard process termination
before publication is outside the handled-exception persistence guarantee.

Local rebuilds cannot reconstruct historical remote search paths. The delivered
history workbook is therefore empty until actual searches supply evidence.
No fetch or transport call is required or permitted for offline validation.
