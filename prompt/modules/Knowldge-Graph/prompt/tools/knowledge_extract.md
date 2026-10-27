# `Knowldge-Graph/prompt/tools/knowledge_extract.py`

Source: [Knowldge-Graph/prompt/tools/knowledge_extract.py](../../../../../Knowldge-Graph/prompt/tools/knowledge_extract.py) | 194 lines.
Owning logic guide: [prompt/04_LR_IDMS_DB2_CONVERSION.md](../../../../04_LR_IDMS_DB2_CONVERSION.md).
Source SHA-256: `600b131745b519111d5e9932ea3f9444976a8aefb170b5b07e83e3651bd1f03e`.

Generated source map. Read this file to locate the relevant symbols, then inspect the touched source before changing behavior. Lexical calls/branches are not a proof of runtime wiring or semantic equivalence.

## Responsibility

Source-declared description (not an independently verified runtime claim):

> Independent, deliberately partial COBOL evidence inventory for System 2.

## Module-level bindings

`VERSION` (L11), `WORD` (L12), `LITERAL` (L13), `VERBS` (L14), `INLINE_PERFORM` (L24), `DATA` (L25)

## Import declarations

```python
from __future__ import annotations
import re
from collections import Counter
```

## Symbol contracts and control points

### `mask_literals` - L28-L29

```python
mask_literals(text: str) -> str
```

Observed calls (lexical order): `LITERAL.sub`, `len`, `m.group`.

### `canonical` - L32-L39

```python
canonical(text: str) -> str
```

Normalize nonliteral whitespace/case; never alter literal contents.

Observed calls (lexical order): `LITERAL.finditer`, `m.group`, `m.start`, `parts.extend`, `re.sub`, `re.sub('\\s+', ' ', text[pos:m.start()]).upper`, `m.end`, `parts.append`, `re.sub('\\s+', ' ', text[pos:]).upper`, `''.join`, `''.join(parts).strip`.

Control points:

- L35: `for m in LITERAL.finditer(text)`

### `source_lines` - L42-L57

```python
source_lines(text: str, source_format: str='fixed') -> list[dict]
```

Observed calls (lexical order): `ValueError`, `enumerate`, `text.splitlines`, `raw.lstrip`, `raw.lstrip().startswith`, `mask_literals`, `mask_literals(body).find`, `body.rstrip`, `result.append`, `indicator.upper`.

Control points:

- L43: `if source_format not in {'fixed', 'free'}`
- L46: `for (n, raw) in enumerate(text.splitlines(), 1)`
- L52: `if marker >= 0`

Explicit raises: `ValueError('Source format must explicitly be fixed or free')`.

### `split_list` - L60-L72

```python
split_list(value: str) -> list[str]
```

Top-level comma split; nested expressions stay together.

Observed calls (lexical order): `mask_literals`, `enumerate`, `canonical`, `parts.append`.

Control points:

- L63: `for (n, ch) in enumerate(masked)`
- L64: `if ch == '('`
- L66: `if ch == ')'`
- L68: `if ch == ',' and depth == 0`

### `profile` - L75-L194

```python
profile(text: str, source_format: str='fixed') -> dict
```

Observed calls (lexical order): `source_lines`, `r['body'].strip`, `'\n'.join`, `mask_literals`, `re.search`, `pid.group`, `pid.group(1).upper`, `len`, `any`, `result['limitations'].append`, `mask_literals(body).upper`, `flush`, `sql_rows.append`, `flush_sql`, `DATA.match`, `data.group`.
Another 29 call expressions are in this source span; the list is intentionally bounded.

Control points:

- L86: `if any((r['debug'] for r in rows))`
- L88: `if any((r['continuation'] for r in rows))`
- L90: `if re.search('\\b(COPY\\b.*\\bREPLACING|ALTER\\b|EXEC\\s+CICS|GO\\s+TO.*DEPENDING)', combined, re.I)`
- L136: `for row in executable`
- L139: `if sql_rows or re.search('\\bEXEC\\s+SQL\\b', clean)`
- L142: `if 'END-EXEC' in clean`
- L145: `if re.search('\\bPROCEDURE\\s+DIVISION\\b', clean)`
- L149: `if not proc`
- Another 12 conditions/loops exist in this source span.

### `profile.flush` - L94-L100

```python
flush() -> None
```

Observed calls (lexical order): `' '.join`, `statement.pop`, `canonical`, `result['statements'].append`.

Control points:

- L96: `if statement is not None`

### `profile.flush_sql` - L102-L134

```python
flush_sql() -> None
```

Observed calls (lexical order): `' '.join`, `x['body'].strip`, `mask_literals`, `mask_literals(value).upper`, `re.search`, `op.group`, `canonical`, `re.findall`, `set`, `sorted`, `sel.group`, `split_list`, `into.group`, `predicate.group`, `order.group`, `result['sql'].append`.
Another 2 call expressions are in this source span; the list is intentionally bounded.

Control points:

- L112: `if block['kind'] in {'SELECT', 'DECLARE'}`
- L114: `if sel`
- L117: `if into`
- L119: `if block['kind'] == 'FETCH'`
- L121: `if into`
- L125: `if predicate`
- L127: `if order`
- L130: `if block['kind'] == 'INCLUDE'`
- Another 1 conditions/loops exist in this source span.

## Change responsibility

After modifying this Python file, review [prompt/04_LR_IDMS_DB2_CONVERSION.md](../../../../04_LR_IDMS_DB2_CONVERSION.md), update any affected behavioral contracts, then run `python prompt/tools/maintain_docs.py refresh` and `python prompt/tools/maintain_docs.py check` from the repository root. Keep scratch Markdown only in `prompt/temp/`. Generated notes must not be hand-edited; add explanations to the owning guide.
