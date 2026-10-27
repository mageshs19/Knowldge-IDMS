# `mainframe/zowe_workspace.py`

Source: [mainframe/zowe_workspace.py](../../../mainframe/zowe_workspace.py) | 120 lines.
Owning logic guide: [prompt/02_MAINFRAME_PIPELINE.md](../../02_MAINFRAME_PIPELINE.md).
Source SHA-256: `a113696e5f7760a0ff1aac4be8ca687fed16d26d334c5c0eb78c9fe17736d46b`.

Generated source map. Read this file to locate the relevant symbols, then inspect the touched source before changing behavior. Lexical calls/branches are not a proof of runtime wiring or semantic equivalence.

## Responsibility

Source-declared description (not an independently verified runtime claim):

> Workspace layout. Every run artifact lives under zowe/workspace.

## Module-level bindings

`PACKAGE_DIR` (L23), `PROJECT_ROOT` (L24)

## Import declarations

```python
from __future__ import annotations
import shutil
from pathlib import Path
from mainframe.zowe_env import raw_setting
from mainframe.zowe_rules import FETCH_INVENTORY_FILENAME, FETCH_SEARCH_HISTORY_FILENAME, WORKSPACE_DIR_NAME, WORKSPACE_ROOT_KEY, WORKSPACE_SUBFOLDERS
from mainframe.zowe_manifest import migrate_legacy_inventory
```

## Local dependency notes

- [mainframe/zowe_env.py](zowe_env.md)
- [mainframe/zowe_manifest.py](zowe_manifest.md)
- [mainframe/zowe_rules.py](zowe_rules.md)

## Importers (12)

Static imports only; dependency injection, string imports and runtime dispatch can add edges.

- [mainframe/__init__.py](__init__.md)
- [mainframe/zowe_commands.py](zowe_commands.md)
- [mainframe/zowe_fetcher.py](zowe_fetcher.md)
- [mainframe/zowe_manifest.py](zowe_manifest.md)
- [mainframe/zowe_pipeline.py](zowe_pipeline.md)
- [mainframe/zowe_pipeline_steps.py](zowe_pipeline_steps.md)
- [mainframe/zowe_search_history.py](zowe_search_history.md)
- [mainframe/zowe_semantic_release_gate.py](zowe_semantic_release_gate.md)
- [mainframe/zowe_settings.py](zowe_settings.md)
- [mainframe/zowe_steps.py](zowe_steps.md)
- [tests/test_zowe_fetch_inventory.py](../tests/test_zowe_fetch_inventory.md)
- [tests/test_zowe_reports_history.py](../tests/test_zowe_reports_history.md)

## Symbol contracts and control points

### `workspace_root` - L27-L32

```python
workspace_root() -> Path
```

Override with ZOWE_WORKSPACE_ROOT, else zowe/workspace.

Observed calls (lexical order): `raw_setting`, `Path`.

Control points:

- L30: `if configured`

### `mapping_dir` - L36-L37

```python
mapping_dir() -> Path
```

Observed calls (lexical order): `workspace_root`.

### `program_dir` - L40-L41

```python
program_dir() -> Path
```

Observed calls (lexical order): `workspace_root`.

### `copybook_dir` - L44-L45

```python
copybook_dir() -> Path
```

Observed calls (lexical order): `workspace_root`.

### `dclgen_dir` - L48-L49

```python
dclgen_dir() -> Path
```

Observed calls (lexical order): `workspace_root`.

### `subschema_dir` - L52-L53

```python
subschema_dir() -> Path
```

Observed calls (lexical order): `workspace_root`.

### `output_dir` - L56-L57

```python
output_dir() -> Path
```

Observed calls (lexical order): `workspace_root`.

### `review_dir` - L60-L61

```python
review_dir() -> Path
```

Observed calls (lexical order): `workspace_root`.

### `reports_dir` - L64-L66

```python
reports_dir() -> Path
```

Durable fetch reports, separate from regenerated code review results.

Observed calls (lexical order): `workspace_root`.

### `inventory_path` - L69-L70

```python
inventory_path() -> Path
```

Observed calls (lexical order): `reports_dir`.

### `search_history_path` - L73-L74

```python
search_history_path() -> Path
```

Observed calls (lexical order): `reports_dir`.

### `logs_dir` - L77-L78

```python
logs_dir() -> Path
```

Observed calls (lexical order): `workspace_root`.

### `ensure_workspace` - L82-L93

```python
ensure_workspace() -> list[Path]
```

Create every folder. Safe to call repeatedly.

Observed calls (lexical order): `workspace_root`, `folder.exists`, `created.append`, `folder.mkdir`.

Control points:

- L87: `for sub in WORKSPACE_SUBFOLDERS`
- L89: `if not folder.exists()`

### `clean_generated` - L96-L114

```python
clean_generated() -> list[Path]
```

Migrate the legacy inventory, then clear only Output and Review.

Observed calls (lexical order): `migrate_legacy_inventory`, `output_dir`, `review_dir`, `folder.is_symlink`, `folder.unlink`, `removed.append`, `folder.exists`, `shutil.rmtree`, `folder.mkdir`.

Control points:

- L106: `for folder in (output_dir(), review_dir())`
- L107: `if folder.is_symlink()`
- L110: `if folder.exists()`

### `count_files` - L117-L120

```python
count_files(folder: Path, pattern: str='*') -> int
```

Observed calls (lexical order): `folder.exists`, `folder.glob`, `path.is_file`, `sum`.

Control points:

- L118: `if not folder.exists()`

## Change responsibility

After modifying this Python file, review [prompt/02_MAINFRAME_PIPELINE.md](../../02_MAINFRAME_PIPELINE.md), update any affected behavioral contracts, then run `python prompt/tools/maintain_docs.py refresh` and `python prompt/tools/maintain_docs.py check` from the repository root. Keep scratch Markdown only in `prompt/temp/`. Generated notes must not be hand-edited; add explanations to the owning guide.
