# Phase 2

Top-level layout is intentionally simple:

```text
IDMS_DB2_Production_Final/
  IDMS_DB2_Copilot_Project/   # old project, immutable
  Answer.txt                  # COBOL-team answers, keep Q IDs unchanged
  Phase-2/                    # all continuation work
```

Open `IDMS_DB2_Production_Final` as the VS Code workspace root.
In GitHub Copilot Agent mode, run `Phase-2/prompts/RUN_PHASE_2.prompt.md`.

Do not edit `IDMS_DB2_Copilot_Project/`. Copilot writes only under `Phase-2/`.
The final complete handoff must be `Phase-2/final-output/`.
