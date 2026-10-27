# `Knowldge-Graph/prompt/tools/knowledge_pipeline.py`

Source: [Knowldge-Graph/prompt/tools/knowledge_pipeline.py](../../../../../Knowldge-Graph/prompt/tools/knowledge_pipeline.py) | 214 lines.
Owning logic guide: [prompt/04_LR_IDMS_DB2_CONVERSION.md](../../../../04_LR_IDMS_DB2_CONVERSION.md).
Source SHA-256: `94c0d04c729434f48e50a2e900097365d1c3e96717298447a5923dba027c89c5`.

Generated source map. Read this file to locate the relevant symbols, then inspect the touched source before changing behavior. Lexical calls/branches are not a proof of runtime wiring or semantic equivalence.

## Responsibility

Source-declared description (not an independently verified runtime claim):

> System 2 evidence collection and System 1 knowledge handoff.

## Module-level bindings

`ROOT` (L26)

## Import declarations

```python
from __future__ import annotations
import argparse
import json
import sys
from pathlib import Path
from knowledge_core import DEFAULT_CONFIG, KNOWLEDGE, analyze_inputs, artifact_text, csv_register, current_analysis, engine_identity, file_hash, load_config, read_json, safe_path, write_json
from knowledge_extract import profile
from knowledge_reports import comparison_leads, save_analysis
from knowledge_review import aggregate, current_review, export_handoff, import_review, packet, require_fresh, validate_review, verify_handoff
from knowledge_engine import run_engine
```

## Symbol contracts and control points

### `inventory` - L29-L59

```python
inventory(root: Path, source: str, manual: str, generated: str, encoding: str, source_format: str) -> dict
```

Observed calls (lexical order): `safe_path`, `directory.is_dir`, `result['errors'].append`, `directory.iterdir`, `sorted`, `file.is_file`, `file.suffix.lower`, `file.relative_to`, `file.relative_to(root).as_posix`, `file.read_bytes`, `file.read_bytes().decode`, `profile`, `file_hash`, `result['files'].append`, `duplicates.setdefault`, `duplicates.setdefault(key, []).append`.
Another 3 call expressions are in this source span; the list is intentionally bounded.

Control points:

- L31: `for (role, folder) in (('idms', source), ('manual', manual), ('generated', generated))`
- L32: `if not folder`
- L35: `if not directory.is_dir()`
- L39: `for file in sorted(directory.iterdir())`
- L40: `if not file.is_file() or file.suffix.lower() not in {'.cbl', '.cob', '.cobol', '.txt'}`
- L47: `if not p['program_id']`
- L52: `for item in result['files']`
- L55: `for ((role, pid), paths) in duplicates.items()`
- Another 1 conditions/loops exist in this source span.

### `build` - L62-L82

```python
build(root: Path, config: dict, selected: list[dict], tracks: list[str]) -> dict
```

Observed calls (lexical order): `engine_identity`, `analyze_inputs`, `read_json`, `safe_path`, `safe_path(root, previous_file).is_file`, `result['reused'].append`, `comparison_leads`, `result['built'].append`, `current_review`, `save_analysis`, `result['errors'].append`, `str`, `write_json`.

Control points:

- L65: `for program in selected`
- L66: `for track in tracks`
- L71: `if previous and previous['fingerprint'] == analysis['fingerprint']`

### `verify` - L85-L101

```python
verify(root: Path, config: dict) -> dict
```

Observed calls (lexical order): `engine_identity`, `require_fresh`, `file_hash`, `safe_path`, `ValueError`, `current_review`, `validate_review`, `errors.append`.

Control points:

- L88: `for p in config['programs']`
- L89: `for track in ('baseline', 'gap')`
- L93: `for artifact in analysis['artifacts']`
- L94: `if file_hash(safe_path(root, artifact['snapshot'], exists=True)) != artifact['sha256']`
- L97: `if review`

Explicit raises: `ValueError('Evidence snapshot hash mismatch')`.

### `parse_args` - L104-L151

```python
parse_args() -> argparse.Namespace
```

Observed calls (lexical order): `argparse.ArgumentParser`, `parser.add_argument`, `parser.add_subparsers`, `sub.add_parser`, `inv.add_argument`, `reg.add_argument`, `b.add_argument`, `pack.add_argument`, `imp.add_argument`, `excerpt.add_argument`, `exp.add_argument`, `handoff.add_argument`, `run.add_argument`, `parser.parse_args`.

### `main` - L154-L210

```python
main() -> int
```

Observed calls (lexical order): `parse_args`, `args.root.resolve`, `inventory`, `verify_handoff`, `read_json`, `isinstance`, `ValueError`, `csv_register`, `len`, `load_config`, `getattr`, `set`, `build`, `packet`, `import_review`, `require_fresh`.
Another 12 call expressions are in this source span; the list is intentionally bounded.

Control points:

- L158: `if args.command == 'inventory'`
- L161: `if args.command == 'verify-handoff'`
- L163: `if args.command == 'register'`
- L165: `if not isinstance(metadata, list)`
- L174: `if wanted and set(wanted) - {p['id'] for p in selected}`
- L176: `if args.command == 'build'`
- L180: `if args.command == 'packet'`
- L182: `if args.command == 'review-import'`
- Another 7 conditions/loops exist in this source span.

Explicit raises: `ValueError('--metadata must contain a JSON array')`; `ValueError('Unknown program ID; use the exact knowledge manifest ID')`; `ValueError('Unknown artifact ID')`; `ValueError('Evidence range must exist and contain at most 200 lines')`; `ValueError('Unimplemented command')`.

## Change responsibility

After modifying this Python file, review [prompt/04_LR_IDMS_DB2_CONVERSION.md](../../../../04_LR_IDMS_DB2_CONVERSION.md), update any affected behavioral contracts, then run `python prompt/tools/maintain_docs.py refresh` and `python prompt/tools/maintain_docs.py check` from the repository root. Keep scratch Markdown only in `prompt/temp/`. Generated notes must not be hand-edited; add explanations to the owning guide.
