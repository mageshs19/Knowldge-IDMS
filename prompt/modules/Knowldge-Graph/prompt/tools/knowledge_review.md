# `Knowldge-Graph/prompt/tools/knowledge_review.py`

Source: [Knowldge-Graph/prompt/tools/knowledge_review.py](../../../../../Knowldge-Graph/prompt/tools/knowledge_review.py) | 313 lines.
Owning logic guide: [prompt/04_LR_IDMS_DB2_CONVERSION.md](../../../../04_LR_IDMS_DB2_CONVERSION.md).
Source SHA-256: `66c142d8ebf935fe78cb24b072f52e327a97177ec649a339301127188768371c`.

Generated source map. Read this file to locate the relevant symbols, then inspect the touched source before changing behavior. Lexical calls/branches are not a proof of runtime wiring or semantic equivalence.

## Responsibility

Source-declared description (not an independently verified runtime claim):

> Bounded AI work packets, cited-review admission, knowledge catalog and handoff.

## Module-level bindings

`CONCLUSIONS` (L21)

## Import declarations

```python
from __future__ import annotations
import json
import re
import zipfile
from collections import defaultdict
from pathlib import Path
from knowledge_core import DEFAULT_CONFIG, GUIDES, KNOWLEDGE, SAFE_ID, TOPICS, analyze_inputs, artifact_text, current_analysis, engine_identity, file_hash, hash_json, load_config, read_json, safe_path, write_json, write_text
from knowledge_reports import safe, save_analysis
import hashlib
```

## Symbol contracts and control points

### `current_review` - L24-L38

```python
current_review(root: Path, analysis: dict) -> dict | None
```

Observed calls (lexical order): `safe_path`, `safe_path(root, path).is_file`, `read_json`, `review.get`, `safe_path(root, base_path).is_file`, `hash_json`.

Control points:

- L26: `if not safe_path(root, path).is_file()`
- L29: `if review.get('fingerprint') != analysis['fingerprint']`
- L31: `if analysis['track'] == 'gap' and review.get('review_status') == 'reviewed'`
- L33: `if not safe_path(root, base_path).is_file()`
- L36: `if review.get('baseline_review_sha256') != hash_json(baseline)`

### `require_fresh` - L41-L46

```python
require_fresh(root: Path, config: dict, program: dict, track: str, engine: dict | None=None) -> dict
```

Observed calls (lexical order): `current_analysis`, `analyze_inputs`, `ValueError`.

Control points:

- L44: `if actual['fingerprint'] != saved['fingerprint']`

Explicit raises: `ValueError(f"{program['id']} {track}: source, engine identity or tooling changed; run build again")`.

### `validate_evidence` - L49-L56

```python
validate_evidence(analysis: dict, entry: dict) -> None
```

Observed calls (lexical order): `entry.get`, `items.get`, `ValueError`, `type`.

Control points:

- L52: `if item is None or entry.get('sha256') != item['sha256']`
- L55: `if type(start) is not int or type(end) is not int or item['lines'] is None or (not 1 <= start <= end <= item['lines'])`

Explicit raises: `ValueError('Evidence must identify a real artifact and its exact SHA-256')`; `ValueError('Invalid evidence line range; opaque binary metadata cannot have invented line numbers')`.

### `validate_review` - L59-L116

```python
validate_review(analysis: dict, review: dict) -> None
```

Observed calls (lexical order): `review.get`, `ValueError`, `str`, `str(review.get('author', '')).strip`, `review['author'].strip`, `isinstance`, `len`, `set`, `v.get`, `entry.get`, `str(entry.get('reason', '')).strip`, `claim.get`, `SAFE_ID.fullmatch`, `seen.add`, `str(claim.get('summary', '')).strip`, `validate_evidence`.
Another 5 call expressions are in this source span; the list is intentionally bounded.

Control points:

- L60: `for key in ('program_id', 'track', 'fingerprint')`
- L61: `if review.get(key) != analysis[key]`
- L63: `if review.get('schema_version') != 1 or review.get('scope') != 'static_only'`
- L65: `if review.get('review_status') not in {'draft', 'reviewed'} or not str(review.get('author', '')).strip()`
- L67: `if review['review_status'] == 'reviewed' and review['author'].strip() == 'REPLACE_WITH_REVIEWER'`
- L71: `if not isinstance(covered, list) or len(covered) != len(set(covered)) or (not set(covered) <= required_chunks)`
- L73: `if review['review_status'] == 'reviewed' and set(covered) != required_chunks`
- L76: `if len(coverage) != len(TOPICS) or {v.get('topic') for v in coverage} != set(TOPICS)`
- Another 18 conditions/loops exist in this source span.

Explicit raises: `ValueError(f'Review identity mismatch: {key}')`; `ValueError('Review schema_version=1 and scope=static_only are required')`; `ValueError('Named reviewer and draft/reviewed state required')`; `ValueError('Replace the template reviewer name before declaring reviewed status')`; `ValueError('Invalid/duplicate chunk coverage')`; `ValueError('Reviewed status requires explicit coverage of every primary-source chunk')`; `ValueError('All twelve semantic topics require a coverage disposition')`; `ValueError('Coverage needs analyzed/unknown/not_applicable and an explanation')`.

### `import_review` - L119-L135

```python
import_review(root: Path, config: dict, program: dict, track: str, path: str) -> dict
```

Observed calls (lexical order): `require_fresh`, `read_json`, `validate_review`, `current_review`, `ValueError`, `hash_json`, `review.get`, `write_json`, `save_analysis`.

Control points:

- L123: `if track == 'gap' and review['review_status'] == 'reviewed'`
- L126: `if not reference or reference['review_status'] != 'reviewed'`
- L128: `if review.get('baseline_review_sha256') != hash_json(reference)`

Explicit raises: `ValueError('Finish the independent baseline review before admitting a reviewed engine-gap analysis')`; `ValueError('Gap review must bind to the exact independent baseline review hash')`.

### `packet` - L138-L185

```python
packet(root: Path, config: dict, program: dict, track: str, part: int, per_packet: int, max_chars: int) -> dict
```

Observed calls (lexical order): `require_fresh`, `ValueError`, `len`, `max`, `safe_path`, `safe_path(root, directive, exists=True).read_text`, `current_review`, `hash_json`, `artifact_text`, `artifact_text(root, item).splitlines`, `range`, `'\n'.join`, `write_text`, `safe_path(root, template_path).exists`, `write_json`.

Control points:

- L140: `if not 1 <= per_packet <= 8 or not 1 <= part`
- L144: `if part > total`
- L155: `if track == 'gap'`
- L162: `for chunk in selected`
- L169: `if len(content) > max_chars`
- L178: `if track == 'gap'`
- L181: `if not safe_path(root, template_path).exists()`

Explicit raises: `ValueError('part >= 1; chunks-per-packet must be 1..8')`; `ValueError(f'Only {total} packets exist')`; `ValueError(f'Packet would be {len(content)} characters; reduce --chunks-per-packet. No source was truncated.')`.

### `aggregate` - L188-L234

```python
aggregate(root: Path, config: dict) -> dict
```

Observed calls (lexical order): `engine_identity`, `defaultdict`, `require_fresh`, `current_review`, `save_analysis`, `any`, `len`, `claim.get`, `families[rule['key']].append`, `families['REVIEW_TOPIC_' + lead['topic'].upper()].append`, `lead['topic'].upper`, `str`, `matrix.append`, `families.items`, `sorted`, `catalog.append`.
Another 5 call expressions are in this source span; the list is intentionally bounded.

Control points:

- L191: `for program in config['programs']`
- L193: `for track in ('baseline', 'gap')`
- L201: `if review`
- L202: `for claim in review['claims']`
- L204: `if rule`
- L208: `for lead in analysis['leads']`
- L215: `for (family, occurrences) in sorted(families.items())`
- L227: `for row in matrix`
- Another 1 conditions/loops exist in this source span.

### `export_handoff` - L237-L278

```python
export_handoff(root: Path, config: dict, name: str, include_evidence: bool) -> dict
```

Observed calls (lexical order): `SAFE_ID.fullmatch`, `ValueError`, `aggregate`, `any`, `p['tracks'].values`, `current_analysis`, `safe_path`, `safe_path(root, relative, exists=True).read_bytes`, `current_review`, `(json.dumps(review, indent=2, sort_keys=True) + '\n').encode`, `json.dumps`, `artifact.items`, `safe_path(root, artifact['snapshot'], exists=True).read_bytes`, `safe_path(root, rel, exists=True).read_bytes`, `len`, `artifacts.values`.
Another 12 call expressions are in this source span; the list is intentionally bounded.

Control points:

- L238: `if not SAFE_ID.fullmatch(name)`
- L241: `if any((t['status'] == 'STALE_OR_MISSING' for p in catalog['matrix'] for t in p['tracks'].values()))`
- L245: `for p in config['programs']`
- L246: `for (track, md) in (('baseline', '01_idms_manual.md'), ('gap', '02_engine_gaps.md'))`
- L249: `for relative in (f'{base}/{track}.json', f'{base}/{md}')`
- L252: `if review`
- L254: `for artifact in a['artifacts']`
- L256: `if include_evidence`
- Another 3 conditions/loops exist in this source span.

Explicit raises: `ValueError('Unsafe handoff name')`; `ValueError('Rebuild stale/missing dossiers before export; prior-run knowledge must not masquerade as current')`; `ValueError('Handoff already exists; use a new name to preserve provenance')`.

### `verify_handoff` - L281-L313

```python
verify_handoff(root: Path, name: str) -> dict
```

Validate a knowledge ZIP without extracting or executing anything.

Observed calls (lexical order): `safe_path`, `zipfile.ZipFile`, `archive.infolist`, `len`, `n.casefold`, `set`, `ValueError`, `sum`, `n.startswith`, `archive.read`, `json.loads`, `manifest.get`, `expected.items`, `hashlib.sha256`, `archive.open`, `iter`.
Another 4 call expressions are in this source span; the list is intentionally bounded.

Control points:

- L288: `if len(names) != len(set(names)) or len(names) != len({n.casefold() for n in names})`
- L290: `if sum((i.file_size for i in infos)) > 500 * 1024 * 1024`
- L292: `for n in names`
- L294: `if not n.startswith('prompt/')`
- L297: `if manifest_name not in names`
- L300: `if manifest.get('schema_version') != 1 or manifest.get('release_decision') != 'KNOWLEDGE_ONLY_NOT_PRODUCTION_APPROVAL'`
- L303: `if set(expected) | {manifest_name} != set(names)`
- L305: `for (n, sha) in expected.items()`
- Another 2 conditions/loops exist in this source span.

Explicit raises: `ValueError('Duplicate/case-colliding ZIP members')`; `ValueError('Handoff exceeds 500 MiB uncompressed inspection limit')`; `ValueError('Handoff entry outside prompt/ namespace')`; `ValueError('Missing handoff manifest')`; `ValueError('Unsupported handoff contract')`; `ValueError('ZIP payload does not match its declared file inventory')`; `ValueError(f'Handoff checksum mismatch: {n}')`.

## Change responsibility

After modifying this Python file, review [prompt/04_LR_IDMS_DB2_CONVERSION.md](../../../../04_LR_IDMS_DB2_CONVERSION.md), update any affected behavioral contracts, then run `python prompt/tools/maintain_docs.py refresh` and `python prompt/tools/maintain_docs.py check` from the repository root. Keep scratch Markdown only in `prompt/temp/`. Generated notes must not be hand-edited; add explanations to the owning guide.
