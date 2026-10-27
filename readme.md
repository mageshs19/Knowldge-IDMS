# IDMS / LRF to DB2 conversion engine

This repository contains a Python conversion pipeline, mainframe workspace,
manual DB2 references, and static review/release gates. The working baseline is
the supplied **V123 engine**. V124 reorganizes documentation only: existing Python
engine/test source and COBOL artifacts are not changed by this documentation release.
The checked-in outputs are candidates, not production-certified programs.

## Two mandatory documentation rules

**1. Keep documentation in the approved locations.** This root `readme.md` is the
only Markdown file allowed outside `prompt/`. Maintain durable architecture,
Python logic, rules, interfaces and known limitations under **`prompt/`**. Keep
**all temporary Markdown, per-iteration plans, scratch analysis, draft audits and
work-in-progress notes under `prompt/temp/`**, for example
`prompt/temp/V125_cursor_review.md`. Do not recreate root-level version reports,
`docs/*.md`, or an uppercase `PROMPT/` tree. Promote reusable conclusions into
the relevant permanent guide before completing an iteration; temporary notes
are not authoritative instructions.

**2. Update documentation together with the corresponding Python logic.** Every
change to a Python module, rule, parser, generator, review check, interface,
configuration contract or test expectation must update its matching module note
and any affected owning guide in `prompt/` in the same change. Describe the actual
inputs, transformation, outputs, invariants, refusal conditions and tests. Do not
leave stale descriptions or mark an unverified behavior as production-safe.

Generated per-file notes are refreshed from source, not hand-edited. Read and
update the owning logic guide before refreshing. A source change without a
changed/reviewed owning guide makes the refresh command stop and identify that
guide. Explicit review is allowed when the explanation genuinely remains accurate;
it is not a substitute for reviewing the changed source.

```bash
python prompt/tools/maintain_docs.py refresh
python prompt/tools/maintain_docs.py check
```

For a reviewed guide whose text does not need changing:

```bash
python prompt/tools/maintain_docs.py refresh \
  --reviewed-guide prompt/05_SQL_CURSOR_AND_BUSINESS_FLOW.md
python prompt/tools/maintain_docs.py check
```

Repeat `--reviewed-guide` for each affected guide. See
[the complete change workflow](prompt/12_CHANGE_WORKFLOW.md).

## Read only the relevant documentation first

Start at [prompt/00_START_HERE.md](prompt/00_START_HERE.md). It routes a task to a
small subsystem guide. [MODULE_INDEX.md](prompt/MODULE_INDEX.md) covers every
existing Python file, including tests and package markers. Per-file notes mirror
source paths, for example:

```text
mainframe/zowe_pipeline.py
  -> prompt/modules/mainframe/zowe_pipeline.md
converter/pipeline/conversion/conversion_pipeline.py
  -> prompt/modules/converter/pipeline/conversion/conversion_pipeline.md
```

Read the relevant guide and module notes, then inspect the touched source and its
callers/tests. Do not repeatedly load the entire Python tree or all Markdown
notes into an AI context. The notes are a navigation layer, not a replacement for
source, compiler output, or runtime evidence. The freshness checker uses source
hashes and static parsing without importing the engine.

## Local conversion and review

Run from the repository root, using an environment with the project's actual
dependencies available:

```bash
python -m mainframe.zowe_pipeline all --from convert --to review
```

The default workspace is `mainframe/workspace/`. Inputs are `Program/`,
`Mapping Sheet/`, `Copybook/`, `DCLGen/`, and `Subschema/`. Manual DB2 comparisons
are in `Manual Output/`. `convert` clears managed `Output/` and generated reviews, but retains the
fetch inventory and dependency history in `reports/`. It never deletes originals or manual references. New generated copybooks are staged below
`Output/Generated Copybooks/`.

Do not run unbounded `all` as a documentation or offline test: its step range
includes mainframe fetch/upload. Review and semantic gates are required before
upload. For dependencies, legacy path copies and the current packaging mismatch,
read [configuration and entrypoints](prompt/11_CONFIGURATION_AND_ENTRYPOINTS.md).

## Validation and production status

[Current baseline and open issues](prompt/13_CURRENT_BASELINE_AND_OPEN_ISSUES.md)
records the supplied V123 evidence. Its pipeline exit code is `2`; all six
metadata-aware structural reviews are rejected in that snapshot. Earlier
version-specific acceptance messages must not override the current evidence.
No new conversion, mainframe compilation, DB2 execution or business-equivalence
certification is implied by this documentation release.

For a regression run without pytest creating a scratch README outside `prompt/`:

```bash
python -m pytest -p no:cacheprovider -o addopts= -q tests
```

For documentation-tool tests:

```bash
python -m unittest discover -s prompt/tools -p 'test_*.py'
```

The documentation checker verifies placement, coverage, source/doc freshness and
local links. It cannot prove that a natural-language explanation or generated
COBOL is semantically correct. [Testing and validation](prompt/10_TESTING_AND_VALIDATION.md)
distinguishes these evidence levels.

## Workspace documentation layout

```text
readme.md                      Entry point and mandatory maintenance rules
prompt/
  00_START_HERE.md              Task router / minimal reading order
  01_SYSTEM_ARCHITECTURE.md     End-to-end map and ownership
  02_...15_*.md                 Subsystem contracts, testing and limitations
  MODULE_INDEX.md               Package-level Python navigation
  index/                       Small directory indexes
  modules/                     One generated note per engine/test Python file
  source_manifest.json         Source hashes, ownership and static dependencies
  tools/                       Documentation maintenance utility and its tests
  temp/                        All temporary Markdown and iteration evidence
```

The original V123 ZIP remains the rollback source for deleted historical Markdown.
Existing non-Markdown historical evidence is retained but is not a current release
approval. Do not store credentials or private connection details in documentation.


## Fetch inventory and library-search history (V127)

Both durable Excel reports are stored in `mainframe/workspace/reports/`, or
`reports/` under `ZOWE_WORKSPACE_ROOT`:

- `IDMS_Program_Inventory.xlsx`: one current row per IDMS source member,
  with Copybook, DCLGENs, Sub Schema and source-based Mode.
- `IDMS_Dependency_Search_History.xlsx`: append-only rows per program,
  dependency member and attempted library, with outcome, safe diagnostics,
  Run ID and UTC observation time. Shared/cached dependencies still appear for
  every dependent program and are labelled as reused evidence.

A program with no subschema reference has a blank Sub Schema cell and no
subschema search row. A referenced but missing subschema keeps its name and
its actual failed search outcomes. Incomplete COPY analysis is not proof that
no subschema is required. Found/Not Found represent observed member lookup;
authentication, permission, connection and service failures are recorded as
Error, not falsely as Not Found.

When a user runs fetch in their connected environment, both reports are
published automatically. Do **not** run fetch/upload to validate this feature
or documentation. Offline development uses only local analysis, report writers,
static integration inspection and tests with fetch/network functions prohibited.

The old `Review/IDMS_Program_Inventory.xlsx` is migrated on the next inventory
write or conversion cleanup. Existing rows and comments are preserved. Conflicts
between two pre-existing inventories cause an explicit error, not silent loss.
`clean_generated()` never deletes reports/; it still removes stale conversion
review and approval files from Review/.

For a local inventory rebuild only (no library-search outcomes are invented):

```bash
python -m mainframe.zowe_manifest
```

See [fetch reporting contract](prompt/16_FETCH_INVENTORY.md). Neither report
certifies conversion or compilation. Keep temporary Markdown in `prompt/temp/`
and update matching permanent prompt guides/module notes with Python changes.
