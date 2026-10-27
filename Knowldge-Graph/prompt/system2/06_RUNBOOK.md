# System 2 runbook

## 1. Place inputs and register the actual population

Use the copied workspace with your real files:

```text
readme.md
prompt/                         Instructions, tools, permanent knowledge
mainframe/workspace/
  Program/                      Original IDMS/LR members
  Manual Output/                Manually converted DB2 reference members
  Copybook/                     Authoritative source/target copybooks
  DCLGen/                       DCLGEN and target schema evidence
  Mapping Sheet/                Authoritative mapping version
  Subschema/                    IDMS/LR record/set definitions
  Output/                       Optional imported generated candidates
```

Inspect identities without guessing pairs:

```bash
python prompt/tools/knowledge_pipeline.py inventory
```

Copy `prompt/system2/templates/program_pairs.csv` to
`prompt/system2/program_pairs_75.csv`. Add exactly one confirmed row per program.
Required columns: id,idms,manual,generated,encoding,format,pairing_confirmed.
Optional idms_encoding/manual_encoding/generated_encoding and analogous *_format
columns override common values. The six-pair CSV includes these encoding overrides.
The optional generated path may be blank; pairing_confirmed must be yes.
Use the actual source and target members, not filename suffix heuristics.
The file `program_pairs_six.csv` is a working example, not the unseen 75.

The supplied `metadata_six.json` describes the shared six-program evidence.
Replace/copy it to `metadata_75.json` with the actual metadata descriptors.
Do not assume production mappings are identical. Use `programs` on metadata
entries to restrict metadata to specific knowledge IDs when needed.

```bash
python prompt/tools/knowledge_pipeline.py register --pairs prompt/system2/program_pairs_75.csv --metadata prompt/system2/metadata_75.json --expected-programs 75
```

The manifest is `prompt/system2/programs.json`. Registration refuses wrong count,
unconfirmed pairs, unsafe paths and reused source/manual files. Individual file
PROGRAM-IDs and generated/manual identity are checked by build. A descriptor can
add an expected program_id, and different per-file encodings/formats, directly
in the manifest. Never use a destructive blanket cleanup on mainframe inputs.

## 2. Build the independent reports

```bash
python prompt/tools/knowledge_pipeline.py build --track baseline
python prompt/tools/knowledge_pipeline.py packet --program VMDZ4310 --track baseline --part 1
```

Replace VMDZ4310 with the registered ID. Open the returned packet with the approved
AI. The response includes total packet parts; request all remaining parts in turn.
Default packets contain two 80-line chunks and enforce a 24,000-character bound;
this is a character cap, not a guaranteed tokenizer count. Nothing is silently
truncated. Use `--chunks-per-packet 1` for unusually long lines.

Each packet directory has review_draft.json and chunk_plan.json. Review evidence
in small pieces; accumulate claims in the draft JSON and temporary notes. Use
`evidence --program ... --track baseline --artifact ... --start N --end M` for
specific metadata/source ranges. A binary workbook is opaque to this tool, not
silently analyzed. The AI must inspect the actual mapping with an approved reader.

```bash
python prompt/tools/knowledge_pipeline.py review-import --program VMDZ4310 --track baseline --file prompt/temp/my_4310_baseline_review.json
```

The example filename is where you save the actual AI/human JSON; it is not a
pre-filled semantic review. Complete all twelve topics and primary chunk coverage
before choosing reviewed status. Unknown dependencies stay unknown.

## 3. Generate or attach engine candidates

With a full frozen engine and its installed dependencies, first inspect the plan:

```bash
python prompt/tools/knowledge_pipeline.py run-engine --engine-root .
python prompt/tools/knowledge_pipeline.py run-engine --engine-root . --execute --timeout 300
```

For a selected subset add repeatable `--program ID`. On a prompt-only System 2,
point --engine-root to a complete trusted engine copy (a normal path, not a module
name). Set --python to the actual compatible interpreter when necessary. The
knowledge tools themselves use only the standard library; the engine retains its
own dependencies and compatibility requirements. No installation is attempted.

Execution copies documented code and needed config/templates into a fresh folder,
stages only selected source/manual files and shared metadata, and sets
ZOWE_WORKSPACE_ROOT and IDMS_INPUT_DIR to the isolated workspace. It runs exactly:

```bash
python -m mainframe.zowe_pipeline all --from convert --to review
```

Completed artifacts are copied to prompt/knowledge/engine_runs/<run>/ before
the manifest is updated. The staged engine remains temporary and can be removed
after preserving its receipt/logs and confirming the durable paths.

No fetch/upload step is selected. The adapter preserves original input hashes,
logs, timeout status, engine source identity and the real exit code. Exit 2 may
still leave candidate output; that output is attached for gap analysis but is not
accepted. The previous configuration is saved under the run's temporary folder.

Alternatively, run the engine on System 1 and copy its generated COBOL and receipt
into System 2, then set each explicit generated path in programs.json. Without a
receipt, producer version is unverified. Prompt files alone cannot run conversion.

## 4. Compare generated behavior to the reviewed baseline

```bash
python prompt/tools/knowledge_pipeline.py build --track gap
python prompt/tools/knowledge_pipeline.py packet --program VMDZ4310 --track gap --part 1
python prompt/tools/knowledge_pipeline.py review-import --program VMDZ4310 --track gap --file prompt/temp/my_4310_gap_review.json
```

Use the same chunked workflow. Draft gap inventories can exist before the baseline
review, but reviewed gap admission requires the exact current baseline review hash.
Preserve failed review/compiler evidence; never repair output files to create a pass.

## 5. Aggregate and transfer knowledge to System 1

```bash
python prompt/tools/knowledge_pipeline.py aggregate
python prompt/tools/knowledge_pipeline.py check
python prompt/tools/knowledge_pipeline.py export --name production_wave_01 --include-evidence
```

Only use --include-evidence for an authorized source-code transfer. Even without
it, reports contain proprietary field names and code fragments. The export is not
an anonymization tool. Export refuses stale/missing analysis, but allows explicitly
pending reviews, so a partial wave can be handed over without claiming completion.
A reused export name is refused rather than overwriting previous evidence.

System 1 receives `prompt/knowledge/handoff/production_wave_01.zip`.
Follow the System 1 implementation prompt to verify hashes, reproduce, implement
common rules, add positive/negative/renaming tests, and update the owning docs.
Do not unzip over live source. No automatic code import or deployment is included.

## 6. Reuse and new waves

Build/check detects source, metadata, tool and engine changes by hashes. Repeat
only the changed program/track review, preserving prior revisions. Shared metadata
updates may invalidate several programs. A new engine version invalidates gap
analysis but not the independent baseline. Changing a baseline review also invalidates
reviewed gap conclusions bound to the old review. Keep all scratch Markdown under
prompt/temp/; durable program knowledge stays under prompt/knowledge/.

## 7. Tool code/documentation changes

```bash
python -m unittest discover -s prompt/tools -p 'test_program_knowledge.py'
python prompt/tools/knowledge_docs.py refresh
python prompt/tools/knowledge_docs.py check
python prompt/tools/maintain_docs.py refresh
python prompt/tools/maintain_docs.py check
```

Update the matching System 2 guide and root maintenance guide before refresh.
Run maintain_docs.py on the full System 1 workspace only: a prompt-only System 2
contains engine documentation snapshots, not the 1,025 engine source files.
On prompt-only System 2, knowledge_docs.py checks the local tooling documentation.
No automatic doc refresh is a substitute for explaining a changed behavior.
Use separate AI contexts for Track A and Track B to reduce generated-output bias.

If a new engine attempt produces no unique candidate, the old generated path is
removed from the active manifest and retained only as previous_generated history.
This prevents a failed run from silently comparing stale output. Generated LR-to-
IDMS intermediates are attached to Track B when produced; they do not enter the
independent baseline.
