# V127 - Durable program inventory and dependency search history

## User request and execution boundary

Keep a blank Sub Schema cell when no dependency is declared, move the existing
inventory to mainframe/workspace/reports, and add per-program/member/library
search history with outcomes and failure details. The user explicitly prohibited
running fetch. No fetch_all, pipeline fetch, member lookup/download, live Zowe,
mainframe connection, conversion or upload was executed for this iteration.

## Delivered paths and schemas

- mainframe/workspace/reports/IDMS_Program_Inventory.xlsx
  - Program Inventory sheet; original five columns and per-program upserts.
  - Migrated six-program local-input snapshot; values and cell comments compared
    before/after and verified identical.
- mainframe/workspace/reports/IDMS_Dependency_Search_History.xlsx
  - Dependency Search History sheet.
  - IDMS Program Name, Type, Name of searching, Python Search Library Path,
    Result, Remarks, Run ID, Observed At (UTC).
  - Empty header-only workbook: zero actual search observations were collected.

The example workbook in this temporary directory contains only synthetic EXAMP*
programs and EXAMPLE.* dataset names, explicitly labelled SYNTHETIC EXAMPLE ONLY.
It is not production history and is not mixed into reports/.

## Root causes addressed

The old LibrarySearch recorded HTTP attempts only when the entire lookup failed.
A later success discarded earlier misses/errors from the available evidence. Its
run-level download cache also lacked structured program/member search provenance.

The lookup adapter now retains ordered attempts even on success. The recorder
associates each attempt with its source program, dependency type and member.
Shared cached downloads retain all program relationships with explicit reuse notes.
Only actually attempted libraries are reported; no untried library is fabricated
as missing. HTTP 404 is Not Found; authentication/access/TLS/network/service
failures are Error. Missing library configuration is Not Searched.

No source subschema reference => blank inventory cell and no schema search row.
Declared-but-missing subschema => retain the name and observed failure evidence.
Unresolved copybook source => blank does not certify that no schema is required.

Both reports are independently published on completion or handled fetch exceptions.
Both writes are attempted even if one report fails. The original fetch exception
is not replaced by a reporting error. Raw response bodies and raw exception
messages are not persisted, to avoid storing credentials or private request data.

Inventory migration locks the legacy/new paths, validates and preserves old rows,
and removes the legacy file only after successful publication. Conflicting
pre-existing rows cause a refusal. Cleanup clears Output/Review, never reports/.

## Executed offline validation

| Check | Actual result |
|---|---|
| New pure report/history tests | 47 passed |
| Existing inventory tests selected to exclude all fetch execution | 33 passed; 10 deselected |
| Documentation maintenance unit tests | 16 passed |
| Python compilation of mainframe package and changed tests | Passed |
| 75-program synthetic association test | 150 ordered observations; 300 after appending a second synthetic run |
| No-subschema / unresolved-copy / declared-missing-schema distinctions | Passed |
| Shared positive and negative dependency traces | Passed |
| History append, exact replay idempotence, filter range update | Passed |
| Corrupt/locked/symlink/schema/row-limit/cell-limit refusal | Passed |
| Failure during publication retains previous workbook | Passed |
| Legacy migration preserves rows/comments; failure retains original | Passed |
| Static AST inspection: attempt logged before successful return | Passed |
| Inventory/header/example import, recalculation and visual rendering | Passed; no formulas in actual report data |
| Mainframe input/reference assets | 30/30 unchanged |
| Converter, generated COBOL and release-gate implementation | Unchanged |
| Live mainframe fetch or mocked fetch orchestration | Not executed |
| Full conversion regression suite | Not run: would exceed this offline report-logic scope |

Commands/results are retained in offline_report_tests.log,
existing_offline_tests.log and documentation_tool_tests.log. The new test module
actively blocks fetch, lookup and network functions so an accidental invocation
fails the test. It tests the local report publication helper without fetching.
Older mocked-fetch integration tests remain in source for the user's environment,
with updated report-location assertions; they were not executed here.

## Documentation and audit

readme.md, prompt/00_START_HERE.md, prompt/02_MAINFRAME_PIPELINE.md,
prompt/10_TESTING_AND_VALIDATION.md and prompt/16_FETCH_INVENTORY.md were updated.
Module notes and source_manifest.json were refreshed for all 1039 Python files.
All new temporary Markdown is under prompt/temp/V127.

The full documentation checker still reports 2204 inherited broken-link/Markdown
placement findings from the supplied nested knowledge kit and historical links.
The untouched V126 archive has exactly the same set: zero new checker errors.
No stale/missing source notes were introduced. See docs_delta.json and both
checker outputs; a blanket documentation-check PASS is not claimed.

The source diff is V126_to_V127_Python_Source_Changes.patch. Immutable input
hashes are in input_integrity.json; changed/removed original paths are in
change_manifest.json. The only removed original workspace file is the inventory
at its old Review/ location, now migrated to reports/.

## Boundaries

An Excel Found row proves lookup/retrieval only, not source validity, dependency
completeness or successful conversion. Search history describes actual attempts,
not every possible configured library. No external CALL graph classification was
added. Inventory keys remain source member names; use separate workspaces for
populations/environments that reuse a member name.

Run one pipeline writer per workspace. Close Excel before replacement on locking
platforms. Both reports are atomic separately, not a cross-workbook transaction.
A hard process kill before publication can lose in-memory observations; this is
not a crash-recovery journal. Locked/corrupt history is never silently overwritten.
Archive history deliberately before the Excel row limit is reached.
