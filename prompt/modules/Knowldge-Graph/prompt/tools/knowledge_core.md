# `Knowldge-Graph/prompt/tools/knowledge_core.py`

Source: [Knowldge-Graph/prompt/tools/knowledge_core.py](../../../../../Knowldge-Graph/prompt/tools/knowledge_core.py) | 307 lines.
Owning logic guide: [prompt/04_LR_IDMS_DB2_CONVERSION.md](../../../../04_LR_IDMS_DB2_CONVERSION.md).
Source SHA-256: `fc76022ac8f8fa43b43920fa931ebd00f3638fe4a5cc551dee73c6d5e3df486c`.

Generated source map. Read this file to locate the relevant symbols, then inspect the touched source before changing behavior. Lexical calls/branches are not a proof of runtime wiring or semantic equivalence.

## Responsibility

Source-declared description (not an independently verified runtime claim):

> Immutable input identities, explicit program registration and bounded evidence.

## Module-level bindings

`VERSION` (L19), `DEFAULT_CONFIG` (L20), `KNOWLEDGE` (L21), `TOPICS` (L22), `GUIDES` (L27), `ROLES_A` (L41), `ROLES_B` (L42), `TEXT_EXTENSIONS` (L43), `SAFE_ID` (L44)

## Import declarations

```python
from __future__ import annotations
import csv
import hashlib
import json
import os
import re
import tempfile
from pathlib import Path
from typing import Any
from knowledge_extract import profile
```

## Symbol contracts and control points

### `hash_bytes` - L47-L48

```python
hash_bytes(data: bytes) -> str
```

Observed calls (lexical order): `hashlib.sha256`, `hashlib.sha256(data).hexdigest`.

### `hash_json` - L51-L52

```python
hash_json(data: Any) -> str
```

Observed calls (lexical order): `hash_bytes`, `json.dumps`, `json.dumps(data, sort_keys=True, ensure_ascii=True, separators=(',', ':')).encode`.

### `file_hash` - L55-L60

```python
file_hash(path: Path) -> str
```

Observed calls (lexical order): `hashlib.sha256`, `path.open`, `handle.read`, `iter`, `digest.update`, `digest.hexdigest`.

Control points:

- L58: `for part in iter(lambda: handle.read(1024 * 1024), b'')`

### `safe_path` - L63-L74

```python
safe_path(root: Path, name: str, *, exists: bool=False) -> Path
```

Observed calls (lexical order): `isinstance`, `ValueError`, `Path`, `relative.is_absolute`, `(root / relative).resolve`, `root.resolve`, `target.is_relative_to`, `target.is_file`.

Control points:

- L64: `if not isinstance(name, str) or not name or '\\' in name`
- L67: `if relative.is_absolute() or '..' in relative.parts or ':' in name`
- L70: `if not target.is_relative_to(root.resolve())`
- L72: `if exists and (not target.is_file())`

Explicit raises: `ValueError('Use nonempty workspace-relative forward-slash paths')`; `ValueError(f'Unsafe relative path: {name}')`; `ValueError(f'Path escapes workspace: {name}')`; `ValueError(f'Missing file: {name}')`.

### `write_text` - L77-L92

```python
write_text(root: Path, name: str, content: str) -> None
```

Observed calls (lexical order): `name.startswith`, `ValueError`, `safe_path`, `path.parent.mkdir`, `content.encode`, `path.is_file`, `path.read_bytes`, `tempfile.mkstemp`, `os.fdopen`, `handle.write`, `os.replace`, `os.path.exists`, `os.unlink`.

Control points:

- L78: `if not (name.startswith('prompt/') or name == 'readme.md')`
- L83: `if path.is_file() and path.read_bytes() == data`
- L91: `if os.path.exists(temp)`

Explicit raises: `ValueError(f'Knowledge output outside approved prompt location: {name}')`.

### `write_json` - L95-L96

```python
write_json(root: Path, name: str, data: Any) -> None
```

Observed calls (lexical order): `json.dumps`, `write_text`.

### `read_json` - L99-L100

```python
read_json(root: Path, name: str) -> Any
```

Observed calls (lexical order): `json.loads`, `safe_path`, `safe_path(root, name, exists=True).read_text`.

### `tool_fingerprint` - L103-L104

```python
tool_fingerprint() -> str
```

Observed calls (lexical order): `Path`, `Path(__file__).parent.glob`, `file_hash`, `hash_json`, `sorted`.

### `descriptor` - L107-L112

```python
descriptor(value: str | dict, role: str) -> dict
```

Observed calls (lexical order): `dict`, `isinstance`, `data.setdefault`.

### `load_config` - L115-L154

```python
load_config(root: Path, name: str=DEFAULT_CONFIG) -> dict
```

Observed calls (lexical order): `read_json`, `config.get`, `ValueError`, `len`, `set`, `program.get`, `SAFE_ID.fullmatch`, `identity.casefold`, `seen_ids.add`, `descriptor`, `safe_path`, `seen_primary.add`, `path.read_bytes`, `path.read_bytes().decode`, `profile`, `spec.get`.
Another 3 call expressions are in this source span; the list is intentionally bounded.

Control points:

- L117: `if config.get('schema_version') != 1`
- L120: `if not programs`
- L122: `if config.get('expected_programs') != len(programs)`
- L125: `for program in programs`
- L127: `if not SAFE_ID.fullmatch(identity) or identity.casefold() in seen_ids`
- L130: `if program.get('pairing_confirmed') is not True`
- L132: `for role in ('idms', 'manual')`
- L133: `if not program.get(role)`
- Another 6 conditions/loops exist in this source span.

Explicit raises: `ValueError('Unsupported knowledge manifest schema_version')`; `ValueError('No explicit program pairs registered')`; `ValueError(f"Expected {config.get('expected_programs')} programs, registered {len(programs)}")`; `ValueError(f'Invalid/duplicate program knowledge ID: {identity}')`; `ValueError(f'Pairing must be explicitly confirmed: {identity}')`; `ValueError(f'{identity}: missing required {role} file')`; `ValueError(f"Reused original/manual file: {spec['path']}")`; `ValueError(f"Unreadable/mismatched PROGRAM-ID: {spec['path']}")`.

### `program_specs` - L157-L172

```python
program_specs(config: dict, program: dict, track: str) -> list[dict]
```

Observed calls (lexical order): `descriptor`, `program.get`, `config.get`, `raw.get`, `result.append`, `set`, `unique.append`, `seen.add`.

Control points:

- L160: `for raw in config.get('metadata', []) + program.get('metadata', [])`
- L161: `if raw.get('role') in roles and (not raw.get('programs') or program['id'] in raw['programs'])`
- L163: `if track == 'gap' and program.get('engine_receipt')`
- L167: `for spec in result`
- L169: `if key not in seen`

### `load_artifact` - L175-L206

```python
load_artifact(root: Path, spec: dict) -> dict
```

Observed calls (lexical order): `safe_path`, `path.read_bytes`, `hash_bytes`, `hash_json`, `path.suffix.lower`, `spec.get`, `raw.decode`, `len`, `text.splitlines`, `ValueError`, `profile`, `spec['program_id'].upper`, `target.parent.mkdir`, `target.exists`, `file_hash`, `target.open`.
Another 1 call expressions are in this source span; the list is intentionally bounded.

Control points:

- L181: `if path.suffix.lower() in TEXT_EXTENSIONS or spec.get('text', False)`
- L188: `if spec['role'] in {'idms', 'manual', 'generated', 'original_lr', 'expanded_idms'}`
- L189: `if text is None`
- L193: `if not actual`
- L195: `if spec.get('program_id') and actual != spec['program_id'].upper()`
- L199: `if target.exists()`
- L200: `if file_hash(target) != sha`

Explicit raises: `ValueError(f"Primary COBOL must be a text artifact: {spec['path']}")`; `ValueError(f"No readable PROGRAM-ID in {spec['path']}; check encoding/format")`; `ValueError(f"PROGRAM-ID mismatch in {spec['path']}: expected {spec['program_id']}, found {actual}")`; `ValueError(f"Immutable evidence snapshot altered: {item['snapshot']}")`.

### `engine_identity` - L209-L220

```python
engine_identity(root: Path) -> dict
```

Observed calls (lexical order): `path.exists`, `json.loads`, `path.read_text`, `manifest.get`, `manifest.get('sources', {}).items`, `(root / n).is_file`, `file_hash`, `identities.items`, `sum`, `len`, `hash_json`.

Control points:

- L211: `if not path.exists()`

### `analyze_inputs` - L223-L264

```python
analyze_inputs(root: Path, config: dict, program: dict, track: str, engine: dict | None=None) -> dict
```

Observed calls (lexical order): `ValueError`, `load_artifact`, `program_specs`, `next`, `tool_fingerprint`, `engine_identity`, `engine.items`, `hash_json`, `config.get`, `int`, `range`, `min`, `chunks.append`, `json.loads`, `record.get`, `x.get`.
Another 7 call expressions are in this source span; the list is intentionally bounded.

Control points:

- L224: `if track not in {'baseline', 'gap'}`
- L228: `for a in artifacts`
- L229: `if a['role'] == 'generated' and a['profile']['program_id'] != manual_id`
- L233: `if track == 'gap'`
- L240: `if not 10 <= chunk_lines <= 200`
- L242: `for a in artifacts`
- L243: `if a['lines'] and a['role'] in {'idms', 'manual', 'generated', 'original_lr', 'expanded_idms'}`
- L244: `for start in range(1, a['lines'] + 1, chunk_lines)`
- Another 2 conditions/loops exist in this source span.

Explicit raises: `ValueError('Track must be baseline or gap')`; `ValueError(f"Generated PROGRAM-ID {a['profile']['program_id']} differs from manual {manual_id}")`; `ValueError('chunk_lines must be 10..200')`.

### `current_analysis` - L267-L270

```python
current_analysis(root: Path, program_id: str, track: str) -> dict
```

Observed calls (lexical order): `SAFE_ID.fullmatch`, `ValueError`, `read_json`.

Control points:

- L268: `if not SAFE_ID.fullmatch(program_id)`

Explicit raises: `ValueError('Invalid program identifier')`.

### `artifact_text` - L273-L279

```python
artifact_text(root: Path, item: dict) -> str
```

Observed calls (lexical order): `safe_path`, `file_hash`, `ValueError`, `path.read_bytes`, `path.read_bytes().decode`.

Control points:

- L275: `if file_hash(path) != item['sha256']`
- L277: `if item['lines'] is None`

Explicit raises: `ValueError('Corrupted evidence snapshot')`; `ValueError('Opaque/binary metadata requires its original reader; no invented line references')`.

### `ev` - L282-L283

```python
ev(item: dict, start: int, end: int | None=None) -> dict
```

### `csv_register` - L286-L307

```python
csv_register(root: Path, csv_path: str, config_path: str, expected: int, metadata: list[dict] | None=None) -> dict
```

Observed calls (lexical order): `safe_path`, `safe_path(root, csv_path, exists=True).open`, `csv.DictReader`, `list`, `len`, `ValueError`, `row.get`, `row.get('pairing_confirmed', '').strip`, `row.get('pairing_confirmed', '').strip().lower`, `row['id'].strip`, `row.get(role, '').strip`, `row.get('encoding', '').strip`, `row.get('format', '').strip`, `row.get(role + '_encoding', '').strip`, `row.get(role + '_format', '').strip`, `row[role].strip`.
Another 4 call expressions are in this source span; the list is intentionally bounded.

Control points:

- L289: `if len(rows) != expected`
- L292: `for row in rows`
- L293: `if row.get('pairing_confirmed', '').strip().lower() != 'yes'`
- L296: `for role in ('idms', 'manual', 'generated')`
- L297: `if row.get(role, '').strip()`

Explicit raises: `ValueError(f'Expected {expected} explicitly paired rows, found {len(rows)}')`; `ValueError('Each pairing_confirmed CSV value must be yes; file naming is not pairing evidence')`.

## Change responsibility

After modifying this Python file, review [prompt/04_LR_IDMS_DB2_CONVERSION.md](../../../../04_LR_IDMS_DB2_CONVERSION.md), update any affected behavioral contracts, then run `python prompt/tools/maintain_docs.py refresh` and `python prompt/tools/maintain_docs.py check` from the repository root. Keep scratch Markdown only in `prompt/temp/`. Generated notes must not be hand-edited; add explanations to the owning guide.
