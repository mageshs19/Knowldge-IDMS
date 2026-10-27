# `mainframe/zowe_search_history.py`

Source: [mainframe/zowe_search_history.py](../../../mainframe/zowe_search_history.py) | 259 lines.
Owning logic guide: [prompt/02_MAINFRAME_PIPELINE.md](../../02_MAINFRAME_PIPELINE.md).
Source SHA-256: `dabcb890b9b2dcc9915bada6e5d0f037d9e83c3e563d6acc4662f7f61c06a271`.

Generated source map. Read this file to locate the relevant symbols, then inspect the touched source before changing behavior. Lexical calls/branches are not a proof of runtime wiring or semantic equivalence.

## Responsibility

Source-declared description (not an independently verified runtime claim):

> Per-program dependency search evidence and an append-only Excel history.

## Module-level bindings

`HEADERS` (L22), `SHEET_NAME` (L26), `HEADER_ROW` (L27), `TYPE_LABELS` (L28), `RESULTS` (L29), `MAX_ROWS` (L30)

## Import declarations

```python
from __future__ import annotations
from collections.abc import Iterable
from dataclasses import dataclass, field
from datetime import datetime, timezone
from pathlib import Path
from uuid import uuid4
from openpyxl import Workbook, load_workbook
from openpyxl.styles import Alignment, Font, PatternFill
from openpyxl.worksheet.table import Table, TableStyleInfo
from mainframe.zowe_report_io import atomic_save_workbook, report_lock
from mainframe.zowe_workspace import search_history_path
import requests
```

## Local dependency notes

- [mainframe/zowe_report_io.py](zowe_report_io.md)
- [mainframe/zowe_workspace.py](zowe_workspace.md)

## Importers (4)

Static imports only; dependency injection, string imports and runtime dispatch can add edges.

- [mainframe/zowe_fetcher.py](zowe_fetcher.md)
- [mainframe/zowe_libraries.py](zowe_libraries.md)
- [tests/test_zowe_fetch_inventory.py](../tests/test_zowe_fetch_inventory.md)
- [tests/test_zowe_reports_history.py](../tests/test_zowe_reports_history.md)

## Symbol contracts and control points

### `utc_now` - L33-L34

```python
utc_now() -> str
```

Observed calls (lexical order): `datetime.now`, `datetime.now(timezone.utc).isoformat`.

### `SearchAttempt` - L38-L42

```python
class SearchAttempt()
```

Declared class/data-model fields:

```python
library_path: str
result: str
remarks: str
observed_at: str = field(default_factory=utc_now)
```

### `http_attempt` - L45-L61

```python
http_attempt(dataset: str, member: str, status: int, *, probe: bool=False) -> SearchAttempt
```

Classify observed status without mistaking access/transport errors for absence.

Observed calls (lexical order): `SearchAttempt`, `descriptions.get`.

Control points:

- L48: `if status == 200`
- L51: `if status == 404`

### `exception_attempt` - L64-L78

```python
exception_attempt(dataset: str, member: str, exc: Exception) -> SearchAttempt
```

Record safe diagnostic categories, never raw response bodies or credentials.

Observed calls (lexical order): `isinstance`, `SearchAttempt`, `type`.

Control points:

- L67: `if isinstance(exc, requests.Timeout)`
- L69: `if isinstance(exc, requests.exceptions.SSLError)`
- L71: `if isinstance(exc, requests.ConnectionError)`
- L73: `if isinstance(exc, ValueError)`

### `HistoryRow` - L82-L94

```python
class HistoryRow()
```

Declared class/data-model fields:

```python
program: str
artifact_type: str
member: str
library_path: str
result: str
remarks: str
run_id: str
observed_at: str
```

### `HistoryRow.values` - L92-L94

```python
values(self) -> tuple[str, ...]
```

### `SearchHistoryRecorder` - L98-L131

```python
class SearchHistoryRecorder()
```

Run-scoped association: one trace per program/type/member, even on cache reuse.

Declared class/data-model fields:

```python
run_id: str = field(default_factory=lambda: str(uuid4()))
rows: list[HistoryRow] = field(default_factory=list)
_recorded: set[tuple[str, str, str]] = field(default_factory=set)
```

### `SearchHistoryRecorder.record` - L104-L125

```python
record(self, program: str, artifact: str, member: str, attempts: Iterable[SearchAttempt], *, cached: bool=False) -> None
```

Observed calls (lexical order): `artifact.upper`, `member.strip`, `member.strip().upper`, `program.strip`, `program.strip().upper`, `ValueError`, `tuple`, `SearchAttempt`, `utc_now`, `HistoryRow`, `self.rows.append`, `self._recorded.add`.

Control points:

- L107: `if artifact not in TYPE_LABELS or not member or (not program)`
- L110: `if key in self._recorded`
- L113: `if not trace`
- L115: `for attempt in trace`
- L118: `if cached`

Explicit raises: `ValueError('History needs a program, member and supported dependency type')`.

### `SearchHistoryRecorder.issue` - L127-L131

```python
issue(self, program: str, artifact: str, member: str, library_path: str, remarks: str) -> None
```

A download can succeed yet fail local saving/analysis: retain both facts.

Observed calls (lexical order): `HistoryRow`, `member.upper`, `program.upper`, `self.rows.append`, `utc_now`.

### `_validate` - L134-L147

```python
_validate(values: tuple[str, ...]) -> None
```

Observed calls (lexical order): `any`, `isinstance`, `len`, `ValueError`, `values[0].strip`, `values[2].strip`, `values[6].strip`, `TYPE_LABELS.values`, `datetime.fromisoformat`, `observed.utcoffset`, `observed.utcoffset().total_seconds`.

Control points:

- L135: `if len(values) != len(HEADERS) or any((not isinstance(v, str) for v in values))`
- L137: `if any((len(v) > 32767 for v in values))`
- L139: `if not values[0].strip() or not values[2].strip() or (not values[6].strip())`
- L141: `if values[1] not in TYPE_LABELS.values() or values[4] not in RESULTS`
- L144: `if observed.utcoffset() is None or observed.utcoffset().total_seconds() != 0`
- L146: `if values[4] in {'Found', 'Not Found'} and (not values[3])`

Explicit raises: `ValueError('Search history rows must contain eight text fields')`; `ValueError('Excel cell limit exceeded; history will not be truncated')`; `ValueError('History requires program, member and Run ID')`; `ValueError('Unsupported dependency type or result in search history')`; `ValueError('History timestamp must include UTC timezone')`; `ValueError('Found/Not Found needs the actual observed library/member path')`.

### `_new_workbook` - L150-L185

```python
_new_workbook() -> Workbook
```

Observed calls (lexical order): `Workbook`, `sheet.merge_cells`, `Font`, `PatternFill`, `Alignment`, `enumerate`, `sheet.cell`, `zip`.

Control points:

- L170: `for (c, title) in enumerate(HEADERS, 1)`
- L176: `for (c, width) in zip('ABCDEFGH', (24, 18, 24, 49, 19, 82, 39, 36))`

### `write_search_history` - L188-L259

```python
write_search_history(rows: Iterable[HistoryRow], path: Path | None=None) -> tuple[Path, int]
```

Append observations atomically; exact replay is idempotent, new runs append.

Observed calls (lexical order): `Path`, `search_history_path`, `list`, `_validate`, `row.values`, `report_lock`, `_new_workbook`, `load_workbook`, `path.exists`, `ValueError`, `len`, `tuple`, `range`, `sheet.cell`, `set`, `sheet.iter_rows`.
Another 14 call expressions are in this source span; the list is intentionally bounded.

Control points:

- L196: `for row in incoming`
- L201: `if book.sheetnames != [SHEET_NAME]`
- L204: `if sheet.max_column != len(HEADERS) or tuple((sheet.cell(HEADER_ROW, c).value for c in range(1, 9))) != HEADERS`
- L209: `for cells in sheet.iter_rows(min_row=HEADER_ROW + 1, max_col=8)`
- L210: `if not any((c.value is not None for c in cells))`
- L212: `if any((c.data_type == 'f' for c in cells))`
- L216: `if values in seen`
- L219: `for row in incoming`
- Another 6 conditions/loops exist in this source span.

Explicit raises: `ValueError('Unexpected search history sheet; original retained')`; `ValueError('Unexpected search history columns; original retained')`; `ValueError('Unexpected blank row in search history; original retained')`; `ValueError('Formula in search history; original retained')`; `ValueError('Duplicate historical observation; original retained')`; `ValueError('Excel row limit reached; archive history before continuing')`.

## Change responsibility

After modifying this Python file, review [prompt/02_MAINFRAME_PIPELINE.md](../../02_MAINFRAME_PIPELINE.md), update any affected behavioral contracts, then run `python prompt/tools/maintain_docs.py refresh` and `python prompt/tools/maintain_docs.py check` from the repository root. Keep scratch Markdown only in `prompt/temp/`. Generated notes must not be hand-edited; add explanations to the owning guide.
