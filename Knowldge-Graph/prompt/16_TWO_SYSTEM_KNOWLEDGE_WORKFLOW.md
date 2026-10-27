# Two-system learning workflow

## Purpose

System 2 collects evidence from the actual IDMS and manually converted DB2
programs. System 1 owns generic Python engine changes. Knowledge moves between
them as versioned files, not hidden chat memory or automatic model training.

Two independent questions must stay separate:

1. **Baseline:** What business behavior does the IDMS program implement, and how
   does the manual DB2 reference represent it? Capture conflicts and uncertainty.
2. **Engine gaps:** Given that baseline and the same metadata, what does a pinned
   Python engine actually generate, and where does it differ in behavior,
   representation, dependencies, or validation? A difference is not automatically
   a defect, and a match is not automatically correct.

Start with [System 2 entry point](system2/00_START_SYSTEM2.md). The implementation
is standard-library Python in `prompt/tools/knowledge_*.py`; it does not import
converter code during inventory or comparison. A separate explicit adapter can
execute a trusted frozen copy through `convert` and `review` only.

## Machine boundary

System 1: engine source + maintained prompt logic guides + regression fixtures.
System 2: copied prompt folder + actual program pairs + shared metadata. Fresh
engine execution additionally needs the full frozen engine and its dependencies.
With prompt files only, Track A and Track B over supplied generated COBOL still
work. Prompt documentation cannot execute the converter or prove its behavior.

The supplied example manifest registers six known pairs, not the unseen 75.
Replace it with an explicit 75-row manifest on System 2. Do not pair by suffix,
filename timestamp, or approximate PROGRAM-ID. Never use old generated outputs
as manual references.

## Outputs

`prompt/knowledge/programs/<id>/01_idms_manual.md`: independent baseline inventory
and its admitted semantic review.

`prompt/knowledge/programs/<id>/02_engine_gaps.md`: generated/manual comparison
leads, evidence identities and its admitted semantic review.

Each report has a JSON companion. `reviews/` preserves hash-bound review
revisions. `prompt/knowledge/INDEX.md` and `catalog.json` aggregate candidates.
`prompt/knowledge/handoff/` contains the explicit System 1 transfer ZIP.

All temporary Markdown and prompt packets live under `prompt/temp/`. Durable
workflow instructions stay under `prompt/system2/`; finalized current program
reports and reviewed knowledge stay under `prompt/knowledge/`. Every Python
change must update the owning guide and matching tool/module documentation.

## Evidence boundary

Automatic extraction is lexical and incomplete by design: SQL blocks, paragraph
labels, PERFORM sites, data declarations and statement inventories are navigational
evidence. It does not expand COPY, construct a full control-flow graph, determine
all byte offsets, execute SQL or compile COBOL. The approved AI/human must inspect
all primary chunks and relevant dependencies and write source-cited conclusions.
`review-import` validates citations and freshness, not their semantic truth.

Repeated patterns become **candidates**, never auto-approved conversion rules.
System 1 reproduces the case, verifies metadata, implements the real common
transformation, updates docs, and runs positive, negative, renamed-identifier and
cross-program tests. Compiler/runtime evidence remains mandatory when applicable.

## Maintenance

Own code and contracts: [architecture](system2/01_ARCHITECTURE_AND_CONTRACTS.md),
[review/handoff](system2/02_REVIEW_AND_HANDOFF.md),
[tool map](system2/08_TOOL_SOURCE_MAP.md).

Run new-tool tests with `python -m unittest discover -s prompt/tools -p 'test_program_knowledge.py'`.
Refresh/check existing engine documentation after tooling changes. The
converter itself is unchanged by this knowledge-collection release.
