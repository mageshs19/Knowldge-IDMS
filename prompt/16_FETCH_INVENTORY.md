# Fetch program inventory and dependency library-search history (V127)

## Durable output location

Both files live in **mainframe/workspace/reports/**, or `reports/` under the
configured `ZOWE_WORKSPACE_ROOT`. Review/ is reserved for regenerated conversion
review/approval files. The input inventory and search history survive cleanup.

| File | Purpose | Update behavior |
|---|---|---|
| IDMS_Program_Inventory.xlsx | Current program dependencies and static access mode | Upsert one row per uppercase source member |
| IDMS_Dependency_Search_History.xlsx | Program/member/library lookup evidence | Append observations from new runs, retain prior runs |

No fetch or upload should be run for offline validation. The reports are wired
into `ZoweFetcher.fetch_all()` for the user's connected environment, but its
execution is not necessary for local report logic tests.

## Program Inventory columns

The single **Program Inventory** sheet keeps the original five columns:

| Column | Source and interpretation |
|---|---|
| IDMS Program Name | Selected uppercase source member, not guessed DB2 name |
| Copybook | Detected ordinary COPY dependencies including discovered nested COPY members |
| DCLGENs | Non-runtime SQL INCLUDEs and record-derived members; LR expands through subschema elements |
| Sub Schema | Detected DB ... WITHIN dependency; blank when none is detected |
| Mode | Update, Retrieval or Unknown from executable source evidence |

Multiple names are sorted and listed on separate lines in a cell. Duplicates
within one program are removed. The same dependency still appears for every
program that references it. Comments retain source hashes, local/live origin,
mode evidence and missing-member diagnostics. An unselected row is retained
with its own observation time; fetching a subset does not remove other programs.

### Blank subschema versus missing subschema

No subschema reference detected in the program and resolved ordinary COPY source:
leave the cell **empty** and do not generate a subschema lookup/history row.
A referenced schema that is unavailable: keep its actual name in the inventory,
flag unavailable evidence, and record the observed lookup results in history.
If required COPY source is unresolved, the blank cell does not prove a subschema
is unnecessary; its cell comment states that requirements are not established.

## Dependency Search History columns

The single **Dependency Search History** sheet has the six requested columns,
then two history identifiers:

| Column | Meaning |
|---|---|
| IDMS Program Name | Source program requiring this dependency |
| Type | Copybook, DCLGENs or Sub Schema |
| Name of searching | Actual dependency member being searched |
| Python Search Library Path | Actual ordered dataset/member path, e.g. SITE.CPY(MEMBER) |
| Result | Found, Not Found, Error or Not Searched |
| Remarks | HTTP status, safe error category, cache reuse or local save/analysis failure |
| Run ID | Unique identifier for the fetch invocation |
| Observed At (UTC) | Timezone-qualified observation timestamp |

One dependency can produce several rows: a miss in the first library and a match
in the second are separate observations. Search still stops at the first success;
later untried libraries are not falsely marked missing. All observed errors before
success are retained. A Found row establishes retrieval, not valid COBOL content.
A subsequent local-save/read error is an additional Error observation.

HTTP 200 => Found. HTTP 404 => Not Found for the requested dataset/member.
401/403, timeout, connection, TLS and server failures => Error, never proof of
absence. No usable library configuration => Not Searched with a blank path.
Raw response bodies and raw exception text are deliberately excluded because
they may contain credentials or endpoint details. Remarks contain the status
and exception class/category; inspect secured operational diagnostics as needed.

### Shared dependencies and history

Downloads are cached only within one invocation. Each dependent program receives
its own copy of the relevant search trace. A reused trace is marked explicitly
with its original observation timestamp and "no additional mainframe request".
Repeated references to the same member/type within one program do not duplicate
that relationship. A new run has a new Run ID and appends new observations even
when the same program/member is searched. Republishing the identical row objects
is idempotent; it cannot duplicate those exact observations.

Only dependency types are included in this workbook, not source-program fetches.
A program whose own source cannot be read is marked failed/Unknown in the
inventory; unidentifiable or unattempted dependencies cannot have invented search
history. Absence of a history row does not establish that a member exists.

## Source-to-report lifecycle

1. `LibrarySearch._lookup()` records each actual attempted library, status and
   typed failure, including the attempts preceding a successful result.
2. The fetcher resolves ordinary COPY closure and subschema-derived DCLGENs.
   `SearchHistoryRecorder` associates attempts with the current source member.
3. `_publish_reports()` independently attempts the inventory upsert and history
   append on completion or a handled fetch failure. A report error is not success;
   an original fetch exception is not hidden by a reporting exception.
4. `step_fetch()` exposes both resulting file paths in the normal CLI summary.

No conversion, generated COBOL or release-gate logic is modified by this feature.
A hard kill before publication is not equivalent to a handled failure; in-memory
observations are not a crash-recovery journal.

## Safe migration and publication

The legacy `Review/IDMS_Program_Inventory.xlsx` is migrated on the next default
inventory write or before `clean_generated()` removes Review. Rows and comments
are carried forward. Both old/new files are locked during migration, and the old
file is removed only after successful publication. Conflicting pre-existing
rows cause an explicit refusal with both files retained. An old symlink is not
followed or treated as an inventory to preserve.

Publication uses exclusive lock files and same-directory atomic replacement.
Corrupt schemas, formulas, invalid history rows, conflicting migration, Excel
row/cell limits, symlinks and locked destinations fail explicitly. No truncated
history is written. The reports are independently atomic, not a single two-file
transaction. Close Excel before publication on systems that lock the workbook.
Run one pipeline per workspace; report locks do not serialize all workspace I/O.
After a crashed process, remove a stale .lock only after verifying no writer is
active. Archive history intentionally before the Excel row limit is reached.

The inventory key is a source member name, not library plus member. Use separate
workspaces for different populations/environments that reuse the same member
name. History records exact dependency library paths but does not change that
inventory-key constraint or certify external CALL targets.

## Local inspection without mainframe access

`python -m mainframe.zowe_manifest` rebuilds only inventory data from local
Program/Copybook/DCLGen/Subschema files. `--workspace` selects another local
workspace. It never fabricates mainframe library outcomes. Existing historical
paths cannot be reconstructed from local file presence alone.

The delivered inventory is migrated from the prior local-input snapshot. The
new durable history workbook contains **no observations** until an actual fetch
supplies them. Any example workbook in prompt/temp/V127 is explicitly synthetic.

## Unchanged mode policy

Update evidence wins over retrieval. Recognized database write verbs, relationship
writes, UPDATE usage mode and SQL writes establish Update; file WRITE alone does
not. Retrieval requires retrieval evidence and sufficiently resolved ordinary
COPY source. Missing COPY, unsupported preprocessing or absent access evidence
is Unknown. External CALL behavior is not followed. Comments/literals are not
executable mode evidence. These are static observations, not runtime certification.

## Ownership and verification

- `mainframe/zowe_libraries.py`: ordered lookup trace, no success-path evidence loss.
- `mainframe/zowe_search_history.py`: outcome classification, program association, append writer.
- `mainframe/zowe_report_io.py`: shared local lock and atomic workbook publication.
- `mainframe/zowe_manifest.py`: inventory, blank-schema meaning, legacy migration.
- `mainframe/zowe_fetcher.py`: actual search association and independent report publication.
- `mainframe/zowe_workspace.py`, `zowe_rules_pipeline.py`: reports paths/cleanup.
- `mainframe/zowe_pipeline_steps.py`: both report paths in fetch output.
- `tests/test_zowe_reports_history.py`: offline-only regression coverage with all
  fetch/lookup/network entrypoints blocked; static integration inspection.

Update this guide and the owning mainframe/testing guides with code changes,
then refresh module notes. Temporary Markdown remains in prompt/temp/.
