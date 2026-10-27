# `mainframe/zowe_report_io.py`

Source: [mainframe/zowe_report_io.py](../../../mainframe/zowe_report_io.py) | 44 lines.
Owning logic guide: [prompt/02_MAINFRAME_PIPELINE.md](../../02_MAINFRAME_PIPELINE.md).
Source SHA-256: `bfb4fc4de340a1e2ed5e7b03732befbc1e75186c866abe24d71472a0b5fab8e5`.

Generated source map. Read this file to locate the relevant symbols, then inspect the touched source before changing behavior. Lexical calls/branches are not a proof of runtime wiring or semantic equivalence.

## Responsibility

Source-declared description (not an independently verified runtime claim):

> Shared, local-only locking and atomic publication for fetch workbooks.

## Import declarations

```python
from __future__ import annotations
from contextlib import contextmanager
import os
from pathlib import Path
import tempfile
from collections.abc import Iterator
from typing import Any
```

## Importers (2)

Static imports only; dependency injection, string imports and runtime dispatch can add edges.

- [mainframe/zowe_manifest.py](zowe_manifest.md)
- [mainframe/zowe_search_history.py](zowe_search_history.md)

## Symbol contracts and control points

### `report_lock` - L13-L28

```python
report_lock(path: Path) -> Iterator[None]
```

Refuse concurrent writers/symlink destinations; never replace on failure.

Observed calls (lexical order): `Path`, `path.is_symlink`, `path.parent.is_symlink`, `ValueError`, `path.parent.mkdir`, `path.with_suffix`, `os.open`, `RuntimeError`, `os.close`, `lock.unlink`.

Control points:

- L16: `if path.is_symlink() or path.parent.is_symlink()`

Explicit raises: `ValueError(f'Refusing a report symlink: {path}')`; `RuntimeError(f'Report is being written: {lock}. Do not run parallel fetches.')`.

### `atomic_save_workbook` - L31-L44

```python
atomic_save_workbook(book: Any, path: Path) -> None
```

Publish a completed workbook on the same filesystem, retaining old bytes.

Observed calls (lexical order): `tempfile.NamedTemporaryFile`, `Path`, `book.save`, `temporary.open`, `os.fsync`, `stream.fileno`, `os.replace`, `temporary.unlink`.

Control points:

- L43: `if temporary is not None`

## Change responsibility

After modifying this Python file, review [prompt/02_MAINFRAME_PIPELINE.md](../../02_MAINFRAME_PIPELINE.md), update any affected behavioral contracts, then run `python prompt/tools/maintain_docs.py refresh` and `python prompt/tools/maintain_docs.py check` from the repository root. Keep scratch Markdown only in `prompt/temp/`. Generated notes must not be hand-edited; add explanations to the owning guide.
