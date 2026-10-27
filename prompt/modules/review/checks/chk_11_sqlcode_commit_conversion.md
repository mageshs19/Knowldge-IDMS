# `review/checks/chk_11_sqlcode_commit_conversion.py`

Source: [review/checks/chk_11_sqlcode_commit_conversion.py](../../../../review/checks/chk_11_sqlcode_commit_conversion.py) | 288 lines.
Owning logic guide: [prompt/09_REVIEW_AND_RELEASE_GATES.md](../../../09_REVIEW_AND_RELEASE_GATES.md).
Source SHA-256: `7e032840ccb01efc0dcec311d6402499eeb7bbb707b35ffb4f6b405e9888858e`.

Generated source map. Read this file to locate the relevant symbols, then inspect the touched source before changing behavior. Lexical calls/branches are not a proof of runtime wiring or semantic equivalence.

## Responsibility

Source-declared description (not an independently verified runtime claim):

> CHK-11 SQLCODE and COMMIT conversion.

## Module-level bindings

`EVALUATE_ANY` (L9), `PERIOD` (L10)

## Import declarations

```python
from __future__ import annotations
from review.engine import sql_blocks as sql
from review.engine.check_base import MAJOR, BOTH, Check
from review.standards import cobol_standards as std
```

## Local dependency notes

- [review/engine/__init__.py](../engine/__init__.md)
- [review/engine/check_base.py](../engine/check_base.md)
- [review/engine/sql_blocks.py](../engine/sql_blocks.md)
- [review/standards/__init__.py](../standards/__init__.md)
- [review/standards/cobol_standards.py](../standards/cobol_standards.md)

## Symbol contracts and control points

### `SqlcodeCommitConversionCheck` - L13-L288

```python
class SqlcodeCommitConversionCheck(Check)
```

Declared class/data-model fields:

```python
CHECK_ID = 'CHK-11'
TITLE = 'SQLCODE and COMMIT conversion'
SEVERITY = MAJOR
APPLIES_TO = BOTH
ORDER = 110
```

### `SqlcodeCommitConversionCheck.relevant` - L20-L21

```python
relevant(self, ctx, view) -> bool
```

Observed calls (lexical order): `view.has_code_token`.

### `SqlcodeCommitConversionCheck.not_relevant_reason` - L23-L24

```python
not_relevant_reason(self) -> str
```

### `SqlcodeCommitConversionCheck.review` - L26-L212

```python
review(self, ctx, view, record)
```

Observed calls (lexical order): `list`, `sql.norm`, `sql.sql_blocks`, `self._evaluate_spans`, `self._sql_block_indexes`, `record.expect_none`, `any`, `record.skip`, `record.expect`, `bool`, `record.expect_all`, `self._span_has`, `self._checked_after`, `view.has_code_token`, `line.startswith`, `self._interior_periods`.

Control points:

- L60: `if not std.USE_EVALUATE_SQLCODE`
- L65: `if not executable`
- L83: `if not spans`
- L99: `if not spans`
- L119: `if not spans`
- L138: `if not executable`
- L150: `if not any((b.verb == 'FETCH' for b in blocks))`
- L168: `if not ctx.has_source`
- Another 3 conditions/loops exist in this source span.

### `SqlcodeCommitConversionCheck._evaluate_spans` - L216-L239

```python
_evaluate_spans(code: list[str]) -> list[tuple[int, int]]
```

Start and end index of each EVALUATE SQLCODE block.

Observed calls (lexical order): `enumerate`, `line.startswith`, `len`, `range`, `current.startswith`, `spans.append`.

Control points:

- L224: `for (index, line) in enumerate(code)`
- L225: `if not line.startswith(std.SQLCODE_EVALUATE_START)`
- L229: `for cursor in range(index, len(code))`
- L231: `if current.startswith(std.SQLCODE_EVALUATE_END)`
- L233: `if depth <= 0`
- L236: `if current.startswith(EVALUATE_ANY)`

### `SqlcodeCommitConversionCheck._sql_block_indexes` - L242-L251

```python
_sql_block_indexes(blocks) -> set[int]
```

Code indexes occupied by EXEC SQL blocks.

Observed calls (lexical order): `set`, `out.update`, `range`.

Control points:

- L249: `for block in blocks`

### `SqlcodeCommitConversionCheck._interior_periods` - L254-L272

```python
_interior_periods(lines: list, code: list[str], spans: list[tuple[int, int]], sql_indexes: set[int]) -> list
```

Lines inside an EVALUATE that end with a period.

Observed calls (lexical order): `set`, `len`, `range`, `code[index].endswith`, `seen.add`, `out.append`.

Control points:

- L264: `for (start, end) in spans`
- L266: `for index in range(start + 1, stop)`
- L267: `if index in sql_indexes or index in seen`
- L269: `if code[index].endswith(PERIOD)`

### `SqlcodeCommitConversionCheck._span_has` - L275-L278

```python
_span_has(code: list[str], start: int, end: int, token: str) -> bool
```

Observed calls (lexical order): `len`, `sql.norm`, `any`.

### `SqlcodeCommitConversionCheck._checked_after` - L281-L288

```python
_checked_after(view, block) -> bool
```

Observed calls (lexical order): `sql.lines_after`, `any`, `line.startswith`.

## Change responsibility

After modifying this Python file, review [prompt/09_REVIEW_AND_RELEASE_GATES.md](../../../09_REVIEW_AND_RELEASE_GATES.md), update any affected behavioral contracts, then run `python prompt/tools/maintain_docs.py refresh` and `python prompt/tools/maintain_docs.py check` from the repository root. Keep scratch Markdown only in `prompt/temp/`. Generated notes must not be hand-edited; add explanations to the owning guide.
