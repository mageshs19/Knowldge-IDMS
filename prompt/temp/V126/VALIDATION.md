# V126 - Zowe fetch Excel inventory validation

## Delivered feature

One maintained workbook, `Review/IDMS_Program_Inventory.xlsx`, with a single
Program Inventory sheet and five columns: IDMS Program Name, Copybook, DCLGENs,
Sub Schema, Mode. It is created by the fetcher itself, not only the CLI wrapper.
The same file is upserted on subsequent fetches and retained during conversion
cleanup. Unselected rows retain their own evidence/timestamps.

The prior text-manifest module was dormant, not wired into fetch, and imported
undefined MANIFEST_* constants. It also used raw record-name-derived DCLGENs,
which are not necessarily the LR element members fetched by the live pipeline.

## Implementation

- Shared dependency extraction handles source comments/literals, quoted COPY,
  explicit SQL includes and nested ordinary COPY dependencies with cycle safety.
- Live and local inventory paths use the same subschema LR-element resolution.
- Download caches are per run only; missing downloads never use stale local files
  as evidence of current successful fetch.
- Mode is source based: Update evidence wins; plain file WRITE is not Update;
  uncertain/failed source analysis stays Unknown. External CALL targets are not
  analysed. The workbook is not conversion or runtime certification.
- Partial failures retain completed rows, invalidate failed selected rows, mark
  unattempted selected rows, and preserve the original exception.
- Atomic workbook replacement, duplicate/schema checks, formula-text handling,
  lock refusal, and cell-size checks prevent silent register corruption.
- Only this input register survives Review cleanup. Old review approvals do not.

## Executed verification

Environment: Python 3.13.5.

| Check | Result |
|---|---|
| Focused new inventory tests plus existing dependency tests | 48 passed |
| Full modified Python test suite | 2084 passed, 25 skipped, 3 failed |
| Full untouched-upload Python test suite | 2041 passed, 25 skipped, same 3 failed |
| Documentation maintenance utility tests | 16 passed |
| Python compilation of mainframe package/new tests | Passed |
| Six real source inputs with mocked library transport | All six rows; 2 Update / 4 Retrieval |
| Synthetic 75-program fetch | 75 rows, one workbook, shared member fetched once |
| Re-fetch/upsert and partial-fetch isolation | Passed |
| Fetch-to-convert cleanup preservation | Passed |
| Workbook import, recalculation and visual render | Passed; all data cells are text, no formulas |
| Original mainframe input/reference assets | 30/30 unchanged by SHA-256/byte comparison |
| Existing converter implementation | Unchanged |
| Live mainframe fetch / upload | Not executed |

The three full-suite failures also occur on the untouched upload. They require
historical fixtures absent from that ZIP:

- `_expanded/VMDZ4310_expanded.cbl`
- `_baseline/VMDZ7200.cbl`
- `_expanded/VMDZ1526_expanded.cbl`

No assertions were removed and no replacement fixtures were invented. See
`full_tests.log` and `original_baseline_tests.log` for exact test identities.

## Documentation state

The root README, mainframe guide, validation guide, new inventory guide and
source-linked module notes were updated. All 1036 current Python sources now
have current module notes. The root documentation checker still reports
2204 inherited issues: the supplied nested `Knowldge-Graph/` kit contains
Markdown outside the root policy locations and broken links inherited from its
standalone source-map layout; six root V123 guide links also refer to omitted
historical validation files. Comparing pre-change and post-change diagnostics
found zero newly introduced documentation errors. These pre-existing kit-layout/link
issues were not hidden or relocated as part of an unrelated fetch feature.

All new temporary Markdown is in `prompt/temp/V126/`. Durable instructions are
in `prompt/16_FETCH_INVENTORY.md`. Source changes are in
`fetch_inventory_changes.patch`; input hashes are in `input_integrity.json`.

## Operational boundaries

The delivered six-program workbook is generated from the uploaded local source
assets; cell comments explicitly say local availability, not live mainframe
verification. Running `python -m mainframe.zowe_pipeline fetch` with the user's
existing credentials/libraries produces live fetch evidence in the same file.

Excel must be closed for replacement on systems that lock an open workbook.
Run one fetch/conversion pipeline per workspace. The workbook lock does not
serialize other workspace writers. The register accumulates known members;
a subset fetch does not delete programs outside that selection.

The existing record-to-DCLGEN naming policy remains site configuration, not a
claim that every mainframe installation uses the same naming convention.
The existing converter's release blockers and runtime limitations are unchanged.
