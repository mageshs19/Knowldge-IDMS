# `Knowldge-Graph/prompt/tools/knowledge_reports.py`

Source: [Knowldge-Graph/prompt/tools/knowledge_reports.py](../../../../../Knowldge-Graph/prompt/tools/knowledge_reports.py) | 167 lines.
Owning logic guide: [prompt/04_LR_IDMS_DB2_CONVERSION.md](../../../../04_LR_IDMS_DB2_CONVERSION.md).
Source SHA-256: `724baaa470bc6c33b7ebccf17378c609f5cee8882f351646c7afc8b4e75e6fc0`.

Generated source map. Read this file to locate the relevant symbols, then inspect the touched source before changing behavior. Lexical calls/branches are not a proof of runtime wiring or semantic equivalence.

## Responsibility

Source-declared description (not an independently verified runtime claim):

> Render per-program evidence and comparison leads without claiming equivalence.

## Import declarations

```python
from __future__ import annotations
from collections import Counter
from pathlib import Path
import re
from knowledge_core import GUIDES, KNOWLEDGE, TOPICS, ev, hash_json, write_json, write_text
from knowledge_extract import canonical, mask_literals
```

## Symbol contracts and control points

### `safe` - L16-L17

```python
safe(text: object) -> str
```

Observed calls (lexical order): `str`, `str(text).replace`, `str(text).replace('|', '\\|').replace`, `str(text).replace('|', '\\|').replace('\n', ' ').replace`.

### `evidence_label` - L20-L22

```python
evidence_label(analysis: dict, evidence: dict) -> str
```

Observed calls (lexical order): `next`.

### `comparison_leads` - L25-L100

```python
comparison_leads(analysis: dict) -> list[dict]
```

Observed calls (lexical order): `artifacts.items`, `add`, `ev`, `Path`, `Path(a['path']).stem.upper`, `Counter`, `Counter(sql['projection']).items`, `next`, `len`, `set`, `sorted`, `compare_sql_kind`, `'/'.join`, `declarations`.

Control points:

- L33: `for (role, item) in artifacts.items()`
- L35: `for call in p['unresolved_calls']`
- L39: `for name in p['duplicate_labels']`
- L43: `for dep in p['dependencies']`
- L44: `if dep['name'] not in known`
- L47: `for sql in p['sql']`
- L49: `if duplicates`
- L51: `if analysis['track'] == 'baseline'`
- Another 9 conditions/loops exist in this source span.

### `comparison_leads.add` - L28-L32

```python
add(topic: str, title: str, evidence: list[dict], details: dict | None=None) -> None
```

Observed calls (lexical order): `hash_json`, `leads.append`.

### `comparison_leads.compare_sql_kind` - L64-L71

```python
compare_sql_kind(kind: str) -> None
```

Observed calls (lexical order): `Counter`, `ev`, `add`, `len`.

Control points:

- L68: `if Counter((s['normalized'] for s in ls)) != Counter((s['normalized'] for s in rs))`

### `comparison_leads.declarations` - L83-L91

```python
declarations(item: dict) -> dict
```

Observed calls (lexical order): `re.search`, `canonical`, `grouped.setdefault`, `grouped.setdefault(d['name'], []).append`, `pic.group`.

Control points:

- L85: `for d in item['profile']['data']`
- L86: `if d['name'] == 'FILLER'`
- L89: `if pic`

### `render_report` - L103-L160

```python
render_report(analysis: dict, review: dict | None=None) -> str
```

Observed calls (lexical order): `parts.append`, `safe`, `analysis.get`, `len`, `', '.join`, `evidence_label`, `lead['details'].items`, `(review or {}).get`, `obligations.get`, `obligations.get(topic, {}).get`, `review.get`, `set`, `claim.get`, `'\n'.join`.

Control points:

- L110: `for a in analysis['artifacts']`
- L112: `if track == 'gap'`
- L115: `for a in analysis['artifacts']`
- L116: `if 'profile' not in a`
- L123: `for call in p['calls']`
- L127: `for sql in p['sql']`
- L132: `if not leads`
- L134: `for lead in leads`
- Another 5 conditions/loops exist in this source span.

### `save_analysis` - L163-L167

```python
save_analysis(root: Path, analysis: dict, review: dict | None=None) -> None
```

Observed calls (lexical order): `write_json`, `render_report`, `write_text`.

## Change responsibility

After modifying this Python file, review [prompt/04_LR_IDMS_DB2_CONVERSION.md](../../../../04_LR_IDMS_DB2_CONVERSION.md), update any affected behavioral contracts, then run `python prompt/tools/maintain_docs.py refresh` and `python prompt/tools/maintain_docs.py check` from the repository root. Keep scratch Markdown only in `prompt/temp/`. Generated notes must not be hand-edited; add explanations to the owning guide.
