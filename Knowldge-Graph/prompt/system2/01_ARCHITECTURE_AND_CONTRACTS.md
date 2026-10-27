# System 2 architecture and contracts

## Implemented flow

```text
Explicit pairs CSV + role-tagged metadata
 -> confirmed programs.json (exact expected count)
 -> immutable evidence identities and snapshots
    -> Track A: IDMS + manual + original metadata only
    -> Track B: same evidence + generated + run receipt + engine doc identity
 -> lexical profiles and review leads
 -> one small AI reading packet at a time
 -> source-cited review JSON + twelve coverage dispositions
 -> provenance validation and revision storage
 -> cross-program candidate rule catalog
 -> checksummed System 1 handoff
```

## Modules

- `knowledge_core.py`: safe workspace-relative paths, atomic prompt writes,
  hashes, manifest validation, source decoding, immutable snapshots, fingerprints.
- `knowledge_extract.py`: independent partial COBOL lexical inventory; does not
  import converter/parser/review implementations under test.
- `knowledge_reports.py`: comparison leads and two Markdown dossiers per program.
- `knowledge_review.py`: packets, review admission, catalog, handoff export.
- `knowledge_engine.py`: optional trusted frozen-engine staging and bounded
  subprocess invocation through convert/review only.
- `knowledge_pipeline.py`: CLI dispatch, inventory, resumable build and integrity
  check. `test_program_knowledge.py` tests the new tooling independently.

See [source map](08_TOOL_SOURCE_MAP.md) for exact source hashes and entry points.

## Pairing and roles

Every pair has a safe knowledge `id`, `pairing_confirmed: true`, `idms` and `manual`
file descriptors. IDs can be the DB2 member names but are not inferred by the
analyzer. A descriptor carries `path`, `encoding`, `format` and optional expected
`program_id`. Generated member identity must match the manual member identity.
Original/manual files may not be physically reused across pairs; manual and
generated cannot be the same file.

Shared/per-program metadata roles: `copybook`, `dclgen`, `mapping`, `subschema`,
`sql_include`. `original_lr` is optional independent source evidence.
`expanded_idms`, `derived_copybook`, `engine_receipt`, `engine_review`,
`engine_log`, `compiler_log` and
`runtime_report` belong only to the gap track. Generated intermediate IDMS is
not independent proof of LR lowering. Manually verified dependencies should be
registered explicitly; renamed members are never silently assumed equivalent.

Binary metadata is hashed and preserved but not given fictitious text lines.
A mapping workbook must be inspected/exported by an approved reader before
source-line claims can cite it; register the exact text export as separate
metadata, preserving its original provenance. A missing dependency stays a
review lead, not an invented copybook.

## Immutable evidence and freshness

Artifact identity includes role, relative path and raw-byte SHA-256. Evidence
snapshots are stored by raw hash. Decode failures are errors; no replacement
characters or automatic EBCDIC guesses. Physical lines refer to the decoded
original, not columns 1-6 sequence numbers or regenerated numbering.

Baseline fingerprint excludes generated files, engine identity and derived
artifacts. Gap fingerprint includes them. Both include analysis-tool hashes and
all registered relevant metadata. Shared metadata changes therefore invalidate
all affected program analyses. This conservative invalidation is intentional.
A reviewed gap binds to the exact baseline review hash; changing that review
invalidates the old reviewed gap conclusion even when source files are unchanged.

Build reuses a saved analysis with the identical fingerprint and regenerates its
report from the saved facts/current review. It does not send previous reports to
an AI automatically. Original sources are rehashed for freshness. Reuse avoids
repeating AI semantic review, not all filesystem reads.

## Parser limits

Fixed format uses source area columns 8-72 and excludes comment indicators.
Explicit free format is supported for inventories. Quoted literal contents are
preserved during normalization; comments are not executable facts. Continued
literals, debug lines, dialect extensions, COPY REPLACING, dynamic branches and
unclassified text are listed as limitations.

SQL projections, hosts and clauses use bounded lexical extraction, not a full SQL
AST. Complex/nested SELECTs need direct review. Out-of-line PERFORM targets and
THRU endpoints are inventoried exactly; numeric-prefix removal is not used to
rewrite behavior. Unresolved calls may be supplied by external includes.
No record-size or packed/display equivalence is inferred from mere field names.

## Errors and lifecycle

CLI exit 0 means its requested processing operation succeeded. It never means
conversion parity or production acceptance. Exit 2 reports invalid configuration,
missing/stale evidence, review refusal, or engine failure. Each program/track
build error is recorded without silently passing it or abandoning other pairs.

Engine runs use new staging directories under `prompt/temp/system2-engine/`.
Only the fixed convert-to-review command is executed. Original input hashes and
copied engine source hashes are recorded. UTF-8 transcoding occurs only on staged
text. No original files or generated COBOL are patched. A nonzero review exit
is retained even when candidate output is attached for analysis. Without a full
verified engine snapshot, fresh execution is refused. Isolation protects normal
workspace paths; it is not an OS-level sandbox for untrusted Python.

## Durable engine evidence and tool-note maintenance

The adapter promotes finished candidates, derived copybooks, engine review reports
and logs into `prompt/knowledge/engine_runs/<run>/`. The receipt and active program
manifest point to those durable copies, not the scratch engine. Engine-created
Markdown stays under prompt/temp/. Review artifacts are source-citable gap inputs;
they never enter Track A. Bound receipts are checked against candidate, original
input and documented engine hashes; binding does not imply acceptance.

Run `python prompt/tools/knowledge_docs.py refresh` after updating the owning
System 2 guide. If a guide remains accurate after source review, use its explicit
`--reviewed-guide` path. Then run `python prompt/tools/knowledge_docs.py check`.
This maintains matching symbol/source-hash notes for all eight System 2 tool/test
files. Existing engine documentation remains covered by maintain_docs.py.
