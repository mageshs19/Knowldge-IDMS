# Phase 2 Apply COBOL-Team Answers

Run only after the COBOL team has returned an answered `Answer.txt`.

Accepted answer locations, in priority order:

1. `<project-root>/Answer.txt`
2. `Work/Phase-2/input/Answer.txt`

If both exist, use the project-root file.

Never modify:

- `Previous-Project-Snapshot/`;
- `Work/Phase-1-Gap-Fix/Run-001/`.

## 1. Resolve and import answers by stable Q ID

Resolve the input file:

```bash
python Work/scripts/resolve_answer_file.py --project-root .
```

Import it to the technical normalized-answer location:

```bash
ANSWER_FILE=$(python Work/scripts/resolve_answer_file.py --project-root .)
python Work/scripts/import_cobol_answers.py \
  --input "$ANSWER_FILE" \
  --output Work/Phase-2/normalized/human_answers.json
```

Preserve original question text, Q ID, exact answer text, and source-file provenance.

## 2. Build a complete Phase 2 result

Start from the complete Phase-1 knowledge set and regenerate a full current result under `Work/Phase-2/`.

Use these technical subfolders:

- `input/` — optional alternate location for `Answer.txt`;
- `normalized/` — normalized human-answer JSON and answer registry;
- `programs/` — unchanged copies of all existing program reports;
- `program-gaps/` — copied/updated program gap work queue;
- `program-enhancements/` — Phase-2 addenda only;
- `generic/` — all four high-level generic guides;
- `concepts/` — complete concept rule library;
- `machine/` — `rules.json`, `coverage_matrix.json`, and other Python-engine contracts;
- `audit/` — answer provenance, fingerprints, validation evidence, and change ledger.

Also create at `Work/Phase-2/`:

- `ANSWER_IMPACT.md`;
- `GAP_LEDGER.md`;
- `COVERAGE_AND_VALIDATION.md`;
- `CURRENT_STATUS.md`.

Do not create only diffs. Phase 2 is a complete independently usable revision.

## 3. Apply answers narrowly

Use Q ID as the permanent key. Apply each answer only to programs/rules that depend on that Q.

A human answer establishes intended business/configuration behavior. It does not erase an observed source/manual-conversion defect. Keep contradictions visible.

Unanswered Q IDs remain unresolved; continue unaffected work.

## 4. Validate and publish

Run the production validator, then publish:

```bash
python Work/scripts/validate_production_package.py --project-root .
python Work/scripts/publish_final_output.py --project-root . --phase phase2
```

`Final-Output/` must become the complete current handoff, not a patch folder.
