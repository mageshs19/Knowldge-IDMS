# `mainframe/zowe_rules_pipeline.py`

Source: [mainframe/zowe_rules_pipeline.py](../../../mainframe/zowe_rules_pipeline.py) | 87 lines.
Owning logic guide: [prompt/02_MAINFRAME_PIPELINE.md](../../02_MAINFRAME_PIPELINE.md).
Source SHA-256: `8c0fcdf3819027996cf1e0ad57101a8f741ac6680493a92577f3fe386429c61f`.

Generated source map. Read this file to locate the relevant symbols, then inspect the touched source before changing behavior. Lexical calls/branches are not a proof of runtime wiring or semantic equivalence.

## Responsibility

Source-declared description (not an independently verified runtime claim):

> Workspace layout, pipeline steps, runners and console templates.

## Module-level bindings

`WORKSPACE_SUBFOLDERS` (L11), `STEP_FETCH` (L24), `STEP_CONVERT` (L25), `STEP_REVIEW` (L26), `STEP_UPLOAD` (L27), `STEP_ALL` (L28), `STEP_SHOW` (L29), `STEP_INIT` (L30), `STEP_CLEAN` (L31), `STEP_PLAN` (L32), `PIPELINE_STEPS` (L34), `PIPELINE_COMMANDS` (L35), `CONVERT_RUNNER` (L44), `REVIEW_RUNNER` (L45), `REVIEW_KIND` (L46), `IDMS_INPUT_DIR_KEY` (L48), `PYTHONPATH_KEY` (L49), `PYTHONPATH_ENTRIES` (L50), `UNBUFFERED_KEY` (L51), `STEP_TIMEOUT_SECONDS` (L52), `STATUS_OK` (L55), `STATUS_FAILED` (L56), `STATUS_SKIPPED` (L57), `STATUS_NOTHING` (L58), `EXIT_OK` (L60), `EXIT_NOTHING` (L61), `EXIT_ERROR` (L62), `PIPELINE_TITLE` (L65), `STEP_HEADER_TEMPLATE` (L66), `STEP_OK_TEMPLATE` (L67), `STEP_FAILED_TEMPLATE` (L68), `STEP_SKIPPED_TEMPLATE` (L69), `STEP_NOTHING_TEMPLATE` (L70), `SUMMARY_HEADER` (L71), `SUMMARY_ROW_TEMPLATE` (L72), `VERDICT_OK` (L73), `VERDICT_FAILED_TEMPLATE` (L74), `WORKSPACE_CREATED_TEMPLATE` (L75), `WORKSPACE_READY_TEMPLATE` (L76), `CLEAN_REMOVED_TEMPLATE` (L77), `MAPPING_MISSING_TEMPLATE` (L78), `RUNNER_MISSING_TEMPLATE` (L82), `FETCH_INVENTORY_FILENAME` (L85), `FETCH_SEARCH_HISTORY_FILENAME` (L87)

## Import declarations

```python
from __future__ import annotations
```

## Importers (1)

Static imports only; dependency injection, string imports and runtime dispatch can add edges.

- [mainframe/zowe_rules.py](zowe_rules.md)

## Change responsibility

After modifying this Python file, review [prompt/02_MAINFRAME_PIPELINE.md](../../02_MAINFRAME_PIPELINE.md), update any affected behavioral contracts, then run `python prompt/tools/maintain_docs.py refresh` and `python prompt/tools/maintain_docs.py check` from the repository root. Keep scratch Markdown only in `prompt/temp/`. Generated notes must not be hand-edited; add explanations to the owning guide.
