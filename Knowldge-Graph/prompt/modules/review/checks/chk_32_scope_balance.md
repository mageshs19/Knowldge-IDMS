# `review/checks/chk_32_scope_balance.py`

Source: [review/checks/chk_32_scope_balance.py](../../../../review/checks/chk_32_scope_balance.py) | 144 lines.
Owning logic guide: [prompt/09_REVIEW_AND_RELEASE_GATES.md](../../../09_REVIEW_AND_RELEASE_GATES.md).
Source SHA-256: `1533d5af79dd1b2e28b96da7bacc57754a97fa35cfdf4bde0c0300be13373bd2`.

Generated source map. Read this file to locate the relevant symbols, then inspect the touched source before changing behavior. Lexical calls/branches are not a proof of runtime wiring or semantic equivalence.

## Responsibility

Source-declared description (not an independently verified runtime claim):

> CHK-32 Scope terminator balance.

## Module-level bindings

`SCOPED_VERBS` (L30), `ORPHAN_NOTE` (L32), `UNCLOSED_NOTE` (L33)

## Import declarations

```python
from __future__ import annotations
from review.engine.check_base import CRITICAL, BOTH, Check
from review.standards import cobol_standards as std
```

## Local dependency notes

- [review/engine/check_base.py](../engine/check_base.md)
- [review/standards/__init__.py](../standards/__init__.md)
- [review/standards/cobol_standards.py](../standards/cobol_standards.md)

## Symbol contracts and control points

### `ScopeBalanceCheck` - L36-L144

```python
class ScopeBalanceCheck(Check)
```

Declared class/data-model fields:

```python
CHECK_ID = 'CHK-32'
TITLE = 'Scope terminator balance (IF / EVALUATE)'
SEVERITY = CRITICAL
APPLIES_TO = BOTH
ORDER = 320
```

### `ScopeBalanceCheck.review` - L43-L65

```python
review(self, ctx, view, record) -> None
```

Observed calls (lexical order): `self._walk`, `record.expect_all`, `ORPHAN_NOTE.format`, `UNCLOSED_NOTE.format`.

### `ScopeBalanceCheck._walk` - L68-L101

```python
_walk(self, view)
```

One pass over the PROCEDURE DIVISION, depth per paragraph.

Observed calls (lexical order): `self._body`, `self._is_paragraph_header`, `self._drain`, `unclosed.extend`, `body.rstrip`, `self._opens`, `self._closes`, `orphans.append`.

Control points:

- L76: `for line in view.lines`
- L78: `if not body`
- L81: `if self._is_paragraph_header(body)`
- L88: `if verb`
- L93: `if not verb`
- L95: `if depth[verb] <= 0`

### `ScopeBalanceCheck._body` - L105-L108

```python
_body(line) -> str
```

The logical body, uppercased, comments and blanks dropped.

Observed calls (lexical order): `getattr`, `str`, `str(getattr(line, 'logical', '') or '').strip`, `str(getattr(line, 'logical', '') or '').strip().upper`, `' '.join`, `text.split`.

### `ScopeBalanceCheck._opens` - L111-L115

```python
_opens(body: str) -> str
```

Observed calls (lexical order): `body.startswith`.

Control points:

- L112: `for verb in SCOPED_VERBS`
- L113: `if body == verb or body.startswith(verb + ' ')`

### `ScopeBalanceCheck._closes` - L118-L123

```python
_closes(body: str) -> str
```

Observed calls (lexical order): `body.rstrip`, `body.rstrip('.').strip`.

Control points:

- L120: `for verb in SCOPED_VERBS`
- L121: `if bare == f'END-{verb}'`

### `ScopeBalanceCheck._is_paragraph_header` - L126-L134

```python
_is_paragraph_header(body: str) -> bool
```

Observed calls (lexical order): `body.endswith`, `body.rstrip`, `body.rstrip('.').strip`, `word[0].isalnum`.

Control points:

- L127: `if not body.endswith('.')`
- L130: `if not word or ' ' in word`
- L132: `if word in std.NON_PARAGRAPH_WORDS`

### `ScopeBalanceCheck._drain` - L137-L144

```python
_drain(paragraph: str, depth: dict) -> list
```

Observed calls (lexical order): `depth.items`, `sorted`.

Control points:

- L138: `if not paragraph`

## Change responsibility

After modifying this Python file, review [prompt/09_REVIEW_AND_RELEASE_GATES.md](../../../09_REVIEW_AND_RELEASE_GATES.md), update any affected behavioral contracts, then run `python prompt/tools/maintain_docs.py refresh` and `python prompt/tools/maintain_docs.py check` from the repository root. Keep scratch Markdown only in `prompt/temp/`. Generated notes must not be hand-edited; add explanations to the owning guide.
