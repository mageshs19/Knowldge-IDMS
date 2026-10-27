# `tests/test_lrf_vmdz4310_latest_artifact.py`

Source: [tests/test_lrf_vmdz4310_latest_artifact.py](../../../tests/test_lrf_vmdz4310_latest_artifact.py) | 38 lines.
Owning logic guide: [prompt/10_TESTING_AND_VALIDATION.md](../../10_TESTING_AND_VALIDATION.md).
Source SHA-256: `7cb073714c9672c032b186ef59b698f43691c698b154faf6c289faffb82bf214`.

Generated source map. Read this file to locate the relevant symbols, then inspect the touched source before changing behavior. Lexical calls/branches are not a proof of runtime wiring or semantic equivalence.

## Responsibility

No module-level purpose docstring. The symbol contracts and observed dependencies below are extracted from source; use the owning guide for subsystem context.

## Module-level bindings

`ROOT` (L4), `LATEST` (L5)

## Import declarations

```python
from pathlib import Path
import re
```

## Symbol contracts and control points

### `test_latest_vmdz4310_artifact_is_singleton_not_cursor_based` - L8-L38

```python
test_latest_vmdz4310_artifact_is_singleton_not_cursor_based()
```

Observed calls (lexical order): `LATEST.read_text`, `text.upper`, `text.splitlines`, `len`, `line[:6].isdigit`, `line[7:72].rstrip`, `upper.index`, `block.split`, `re.findall`.

Control points:

- L26: `for line in text.splitlines()`
- L27: `if len(line) >= 7 and line[:6].isdigit()`

## Change responsibility

After modifying this Python file, review [prompt/10_TESTING_AND_VALIDATION.md](../../10_TESTING_AND_VALIDATION.md), update any affected behavioral contracts, then run `python prompt/tools/maintain_docs.py refresh` and `python prompt/tools/maintain_docs.py check` from the repository root. Keep scratch Markdown only in `prompt/temp/`. Generated notes must not be hand-edited; add explanations to the owning guide.
