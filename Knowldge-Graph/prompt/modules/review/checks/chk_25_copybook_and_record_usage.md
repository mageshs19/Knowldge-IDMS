# `review/checks/chk_25_copybook_and_record_usage.py`

Source: [review/checks/chk_25_copybook_and_record_usage.py](../../../../review/checks/chk_25_copybook_and_record_usage.py) | 236 lines.
Owning logic guide: [prompt/09_REVIEW_AND_RELEASE_GATES.md](../../../09_REVIEW_AND_RELEASE_GATES.md).
Source SHA-256: `f76c235d10edfbbfc68e2dbbe0a3c39cc331388ed38ce544f34ab8322f88e1a6`.

Generated source map. Read this file to locate the relevant symbols, then inspect the touched source before changing behavior. Lexical calls/branches are not a proof of runtime wiring or semantic equivalence.

## Responsibility

Source-declared description (not an independently verified runtime claim):

> CHK-25 Copybook and record usage validation.

## Module-level bindings

`QUALIFIED` (L11), `COPY` (L14), `DATA_ITEM` (L15), `LITERAL` (L18)

## Import declarations

```python
from __future__ import annotations
import re
from review.engine import metadata as meta, sql_blocks as sql
from review.engine.check_base import MAJOR, BOTH, Check
from review.standards import cobol_standards as std
```

## Local dependency notes

- [review/engine/__init__.py](../engine/__init__.md)
- [review/engine/check_base.py](../engine/check_base.md)
- [review/engine/metadata.py](../engine/metadata.md)
- [review/engine/sql_blocks.py](../engine/sql_blocks.md)
- [review/standards/__init__.py](../standards/__init__.md)
- [review/standards/cobol_standards.py](../standards/cobol_standards.md)

## Symbol contracts and control points

### `without_literals` - L21-L28

```python
without_literals(text: str) -> str
```

Blank out quoted literals.

Observed calls (lexical order): `LITERAL.sub`, `str`.

### `CopybookAndRecordUsageCheck` - L31-L236

```python
class CopybookAndRecordUsageCheck(Check)
```

Declared class/data-model fields:

```python
CHECK_ID = 'CHK-25'
TITLE = 'Copybook and record usage validation'
SEVERITY = MAJOR
APPLIES_TO = BOTH
ORDER = 250
```

### `CopybookAndRecordUsageCheck.relevant` - L38-L39

```python
relevant(self, ctx, view) -> bool
```

Observed calls (lexical order): `bool`.

### `CopybookAndRecordUsageCheck.not_relevant_reason` - L41-L42

```python
not_relevant_reason(self) -> str
```

### `CopybookAndRecordUsageCheck.review` - L44-L169

```python
review(self, ctx, view, record)
```

Observed calls (lexical order): `std.DCLGEN_GROUP_PREFIX.upper`, `meta.mapped_records`, `self._qualifiers`, `self._copies`, `self._copybook_fields`, `self._declared_names`, `record.skip`, `record.expect_all`, `sorted`, `meta.dclgen_tables`, `set`, `self._undocumented`, `record.expect_none`, `any`, `group.startswith`, `view.has_code_token`.

Control points:

- L53: `if not std.ENFORCE_NO_IDMS_QUALIFIER`
- L58: `if not records`
- L74: `if not qualifiers`
- L98: `if not records`
- L104: `if not ctx.has_source`
- L131: `if not copybook`
- L136: `if not qualifiers`
- L155: `if not copies`

### `CopybookAndRecordUsageCheck._qualifiers` - L173-L179

```python
_qualifiers(view) -> set[tuple[str, str]]
```

Observed calls (lexical order): `set`, `sql.norm`, `without_literals`, `QUALIFIED.finditer`, `match.group`, `out.add`.

Control points:

- L175: `for line in view.code`
- L177: `for match in QUALIFIED.finditer(body)`

### `CopybookAndRecordUsageCheck._copies` - L182-L188

```python
_copies(view) -> set[str]
```

Observed calls (lexical order): `set`, `COPY.match`, `sql.norm`, `match.group`, `out.add`.

Control points:

- L184: `for line in view.code`
- L186: `if match`

### `CopybookAndRecordUsageCheck._copybook_fields` - L191-L196

```python
_copybook_fields(ctx) -> set[str]
```

Observed calls (lexical order): `meta.field`.

### `CopybookAndRecordUsageCheck._declared_names` - L199-L206

```python
_declared_names(view) -> set[str]
```

Every data name the program declares in its own DATA DIVISION.

Observed calls (lexical order): `set`, `DATA_ITEM.match`, `sql.norm`, `match.group`, `out.add`.

Control points:

- L202: `for line in view.code`
- L204: `if match`

### `CopybookAndRecordUsageCheck._table_variants` - L209-L218

```python
_table_variants(table: str) -> set[str]
```

Every equivalent DB2 table spelling, TB and TV included.

Observed calls (lexical order): `str`, `str(table or '').strip`, `str(table or '').strip().upper`, `set`, `text.endswith`, `len`, `out.add`.

Control points:

- L212: `if not text`
- L215: `for (source, target) in std.DB2_TABLE_SUFFIX_EQUIVALENTS`
- L216: `if text.endswith(source)`

### `CopybookAndRecordUsageCheck._undocumented` - L221-L236

```python
_undocumented(cls, ctx, view, records: set[str]) -> list[str]
```

Observed calls (lexical order): `sql.norm`, `' '.join`, `sorted`, `meta.table_for_record`, `any`, `view.has_code_token`, `cls._table_variants`, `out.append`.

Control points:

- L226: `for name in sorted((name for name in records if name in source))`
- L228: `if any((view.has_code_token(item) for item in cls._table_variants(table)))`
- L233: `if name in comments`

## Change responsibility

After modifying this Python file, review [prompt/09_REVIEW_AND_RELEASE_GATES.md](../../../09_REVIEW_AND_RELEASE_GATES.md), update any affected behavioral contracts, then run `python prompt/tools/maintain_docs.py refresh` and `python prompt/tools/maintain_docs.py check` from the repository root. Keep scratch Markdown only in `prompt/temp/`. Generated notes must not be hand-edited; add explanations to the owning guide.
