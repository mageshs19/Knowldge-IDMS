# `Knowldge-Graph/prompt/tools/knowledge_docs.py`

Source: [Knowldge-Graph/prompt/tools/knowledge_docs.py](../../../../../Knowldge-Graph/prompt/tools/knowledge_docs.py) | 96 lines.
Owning logic guide: [prompt/04_LR_IDMS_DB2_CONVERSION.md](../../../../04_LR_IDMS_DB2_CONVERSION.md).
Source SHA-256: `9e11b642d26068645714592e54a81ca7474fbc04708ebe199bf80aa080b5b738`.

Generated source map. Read this file to locate the relevant symbols, then inspect the touched source before changing behavior. Lexical calls/branches are not a proof of runtime wiring or semantic equivalence.

## Responsibility

Source-declared description (not an independently verified runtime claim):

> Maintain the System 2 tooling notes; no engine import or code execution.

## Module-level bindings

`ROOT` (L16), `MANIFEST` (L17), `ARCH` (L18), `REVIEW` (L19), `RUNBOOK` (L20), `SOURCES` (L21)

## Import declarations

```python
from __future__ import annotations
import argparse
import ast
import json
from pathlib import Path
from knowledge_core import file_hash, read_json, safe_path, write_json, write_text
```

## Symbol contracts and control points

### `refresh` - L33-L62

```python
refresh(root: Path, reviewed: list[str]) -> dict
```

Observed calls (lexical order): `read_json`, `safe_path`, `safe_path(root, MANIFEST).is_file`, `file_hash`, `SOURCES.values`, `set`, `ValueError`, `Path`, `current.items`, `old.get`, `old.get('sources', {}).get`, `old.get('sources', {}).get(n, {}).get`, `old.get('guides', {}).get`, `', '.join`, `sorted`, `SOURCES.items`.
Another 11 call expressions are in this source span; the list is intentionally bounded.

Control points:

- L36: `if set(reviewed) - set(SOURCES.values())`
- L39: `if old`
- L41: `if pending`
- L45: `for (filename, guide) in SOURCES.items()`
- L52: `for node in tree.body`
- L53: `if isinstance(node, (ast.FunctionDef, ast.AsyncFunctionDef, ast.ClassDef))`

Explicit raises: `ValueError('Unknown System 2 owning guide')`; `ValueError('Update/review System 2 guides first: ' + ', '.join(sorted(pending)))`.

### `check` - L65-L77

```python
check(root: Path) -> dict
```

Observed calls (lexical order): `read_json`, `manifest['sources'].items`, `file_hash`, `safe_path`, `safe_path(root, name).is_file`, `errors.append`, `manifest['guides'].items`, `safe_path(root, guide).is_file`, `set`, `len`.

Control points:

- L68: `for (relative, row) in manifest['sources'].items()`
- L69: `for (name, sha) in ((relative, row['sha256']), (row['doc'], row['doc_sha256']))`
- L70: `if not safe_path(root, name).is_file() or file_hash(safe_path(root, name)) != sha`
- L72: `for (guide, sha) in manifest['guides'].items()`
- L73: `if not safe_path(root, guide).is_file() or file_hash(safe_path(root, guide)) != sha`
- L75: `if set(manifest['sources']) != {'prompt/tools/' + n for n in SOURCES}`

### `main` - L80-L92

```python
main() -> int
```

Observed calls (lexical order): `argparse.ArgumentParser`, `parser.add_argument`, `parser.parse_args`, `args.root.resolve`, `check`, `refresh`, `json.dumps`, `print`, `result.get`, `str`.

## Change responsibility

After modifying this Python file, review [prompt/04_LR_IDMS_DB2_CONVERSION.md](../../../../04_LR_IDMS_DB2_CONVERSION.md), update any affected behavioral contracts, then run `python prompt/tools/maintain_docs.py refresh` and `python prompt/tools/maintain_docs.py check` from the repository root. Keep scratch Markdown only in `prompt/temp/`. Generated notes must not be hand-edited; add explanations to the owning guide.
