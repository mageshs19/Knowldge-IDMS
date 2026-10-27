# Start System 2 here

Goal: learn from all actual program pairs without altering IDMS inputs, manual
DB2 references or the Python converter. System 2 produces evidence; System 1
implements reviewed generic improvements.

## Minimal reading order

Read root `readme.md`, this file, and the [runbook](06_RUNBOOK.md). For each program,
read only its baseline/gap report and requested source chunks. For an engine gap,
read its owning engine guide and the relevant module note, not every Python file.

The example configuration is six paired samples. The remaining production
programs have not been supplied or analyzed. An explicit registration check
requires exactly the count you request, such as 75.

## First commands from the copied repository root

```bash
python prompt/tools/knowledge_pipeline.py inventory
python prompt/tools/knowledge_pipeline.py build
python prompt/tools/knowledge_pipeline.py aggregate
python prompt/tools/knowledge_pipeline.py check
```

These commands build/check inventories, not business-equivalence approval.
Start a real baseline review:

```bash
python prompt/tools/knowledge_pipeline.py packet --program VMDZ4310 --track baseline --part 1
```

Give the returned packet to the organization's approved AI. Read the remaining
parts and required metadata. The draft JSON is a template, not a completed
analysis. The full instructions are [baseline prompt](03_BASELINE_REVIEW_PROMPT.md).

Only after an independent baseline review is recorded, complete the [engine-gap
review](04_ENGINE_GAP_PROMPT.md). A static gap inventory may be created earlier,
but cannot become a reviewed gap conclusion without a current reviewed baseline.

## What to carry to System 2

Copy `prompt/`, `readme.md`, and the exact input/reference files named by your
manifest. All standard-library analysis tooling is inside `prompt/tools/`.
Supply target copybooks, DCLGEN/DDL, mapping and subschema evidence, including
external error routines when available. Keep sources inside this copied workspace
and use forward-slash relative paths. Explicit encoding defaults to UTF-8 with an
optional BOM; for EBCDIC exports set the actual Python codec in the manifest.

Fresh conversion requires a separate full, trusted engine snapshot and its
existing Python/dependency environment. The tools do not install dependencies
or send proprietary source to an external model service.

## Transfer back

After reviewing a wave of programs, aggregate and export a knowledge handoff.
This collection can be partial, but every pending/unverified state remains visible.
Read [System 1 implementation prompt](05_SYSTEM1_IMPLEMENTATION_PROMPT.md).
Do not copy System 2 generated COBOL into System 1 as a replacement for rules.

## Ready-to-use AI batch instructions

Use [batch orchestration](09_BATCH_AI_ORCHESTRATION.md) for a multi-program wave.
It gives separate System 2 baseline/gap tasks and the System 1 implementation task,
with source-hash reuse and honest file-based checkpoints between AI sessions.
