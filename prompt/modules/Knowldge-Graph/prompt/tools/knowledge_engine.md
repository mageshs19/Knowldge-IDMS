# `Knowldge-Graph/prompt/tools/knowledge_engine.py`

Source: [Knowldge-Graph/prompt/tools/knowledge_engine.py](../../../../../Knowldge-Graph/prompt/tools/knowledge_engine.py) | 199 lines.
Owning logic guide: [prompt/04_LR_IDMS_DB2_CONVERSION.md](../../../../04_LR_IDMS_DB2_CONVERSION.md).
Source SHA-256: `7f042c981d86275fde43f9b505ac67230f573f0e53ed3712834dfb920d5d4448`.

Generated source map. Read this file to locate the relevant symbols, then inspect the touched source before changing behavior. Lexical calls/branches are not a proof of runtime wiring or semantic equivalence.

## Responsibility

Source-declared description (not an independently verified runtime claim):

> Optional frozen-engine adapter: isolated copies, convert -> review only.

## Import declarations

```python
from __future__ import annotations
import json
import os
import signal
import subprocess
import sys
import uuid
from datetime import datetime, timezone
from pathlib import Path
from knowledge_core import DEFAULT_CONFIG, descriptor, engine_identity, file_hash, hash_json, program_specs, safe_path, write_json
from knowledge_extract import profile
```

## Symbol contracts and control points

### `run_engine` - L25-L199

```python
run_engine(root: Path, config: dict, config_name: str, engine_root: Path, programs: list[dict], execute: bool, timeout: int, python: str) -> tuple[int, dict]
```

Observed calls (lexical order): `engine_root.resolve`, `engine_identity`, `ValueError`, `(engine_root / 'mainframe/zowe_pipeline.py').is_file`, `datetime.now`, `datetime.now(timezone.utc).strftime`, `uuid.uuid4`, `safe_path`, `staging.mkdir`, `identity['sources'].items`, `name.startswith`, `target.parent.mkdir`, `original.read_bytes`, `target.write_bytes`, `(engine_root / directory).rglob`, `original.is_file`.
Another 72 call expressions are in this source span; the list is intentionally bounded.

Control points:

- L29: `if identity['status'] != 'SOURCE_HASHES_VERIFIED'`
- L31: `if not (engine_root / 'mainframe/zowe_pipeline.py').is_file()`
- L33: `if not 1 <= timeout <= 7200`
- L39: `if not execute`
- L48: `for (name, info) in identity['sources'].items()`
- L49: `if name.startswith('tests/')`
- L57: `for directory in ('config', 'converter', 'rules', 'patterns', 'catalogs', 'runners', 'review', 'mainframe')`
- L58: `for original in (engine_root / directory).rglob('*')`
- Another 27 conditions/loops exist in this source span.

Explicit raises: `ValueError('A complete current engine snapshot is required for execution. Prompt-only mode supports baseline and imported generated output.')`; `ValueError('Supplied snapshot has no mainframe.zowe_pipeline adapter')`; `ValueError('Timeout must be 1..7200 seconds')`; `ValueError('Missing or duplicate DB2 target identity')`; `ValueError('Input PROGRAM-ID is not readable')`; `ValueError('The existing adapter has only been wired for fixed-format COBOL; do not silently reformat free source')`; `ValueError(f'Conflicting input member names: {destination}')`; `ValueError('Original input hashes changed during execution; inspect receipt and do not proceed')`.

## Change responsibility

After modifying this Python file, review [prompt/04_LR_IDMS_DB2_CONVERSION.md](../../../../04_LR_IDMS_DB2_CONVERSION.md), update any affected behavioral contracts, then run `python prompt/tools/maintain_docs.py refresh` and `python prompt/tools/maintain_docs.py check` from the repository root. Keep scratch Markdown only in `prompt/temp/`. Generated notes must not be hand-edited; add explanations to the owning guide.
