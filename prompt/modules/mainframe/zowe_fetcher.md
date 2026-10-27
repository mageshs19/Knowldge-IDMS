# `mainframe/zowe_fetcher.py`

Source: [mainframe/zowe_fetcher.py](../../../mainframe/zowe_fetcher.py) | 380 lines.
Owning logic guide: [prompt/02_MAINFRAME_PIPELINE.md](../../02_MAINFRAME_PIPELINE.md).
Source SHA-256: `4b1ad20210cb93d080093499d4708646e39c61c080fcca207715fd11b97a8c16`.

Generated source map. Read this file to locate the relevant symbols, then inspect the touched source before changing behavior. Lexical calls/branches are not a proof of runtime wiring or semantic equivalence.

## Responsibility

Source-declared description (not an independently verified runtime claim):

> Program-driven fetch.

## Module-level bindings

`logger` (L62), `_LANDING` (L64)

## Import declarations

```python
from __future__ import annotations
import logging
from pathlib import Path
from collections.abc import Iterable
from typing import TYPE_CHECKING
from mainframe.zowe_libraries import LibrarySearch, application_code
from mainframe.zowe_search_history import SearchAttempt, SearchHistoryRecorder, write_search_history
from mainframe.zowe_resolver import ProgramDependencies, resolve_dependencies, expand_copy_dependencies, dclgen_members_for_record
from mainframe.zowe_rules import ARTIFACT_COPYBOOK, ARTIFACT_DCLGEN, ARTIFACT_EXTENSIONS, ARTIFACT_LABELS, ARTIFACT_PROGRAM, ARTIFACT_SUBSCHEMA, DIAG_APPLICATION_TEMPLATE, DIAG_DEPENDENCIES_TEMPLATE, DIAG_DERIVED_DCLGEN_TEMPLATE, DIAG_END_FETCH, DIAG_FOUND_TEMPLATE, DIAG_LIBRARY_ORDER_TEMPLATE, DIAG_MAPPING_LOCAL, DIAG_NOT_FOUND_TEMPLATE, DIAG_PROGRAM_LIST_TEMPLATE, DIAG_START_FETCH, DIAG_SUBSCHEMA_DETECTED_TEMPLATE, DIAG_TOTAL_TEMPLATE, TEXT_ENCODING, ZOWE_ERROR_MESSAGES, ZOWE_WARNING_MESSAGES
from mainframe.zowe_workspace import copybook_dir, dclgen_dir, ensure_workspace, program_dir, subschema_dir
from mainframe.zowe_rules import DIAG_ELEMENTS_TEMPLATE, DIAG_NO_ELEMENTS_TEMPLATE
from mainframe.zowe_manifest import InventoryRow
from mainframe.zowe_programs import selected_programs
from mainframe.zowe_subschema import element_records_for
from mainframe.zowe_manifest import HEADERS, InventoryRow, make_inventory_row
from mainframe.zowe_manifest import write_inventory
```

## Local dependency notes

- [mainframe/zowe_libraries.py](zowe_libraries.md)
- [mainframe/zowe_manifest.py](zowe_manifest.md)
- [mainframe/zowe_programs.py](zowe_programs.md)
- [mainframe/zowe_resolver.py](zowe_resolver.md)
- [mainframe/zowe_rules.py](zowe_rules.md)
- [mainframe/zowe_search_history.py](zowe_search_history.md)
- [mainframe/zowe_subschema.py](zowe_subschema.md)
- [mainframe/zowe_workspace.py](zowe_workspace.md)

## Importers (4)

Static imports only; dependency injection, string imports and runtime dispatch can add edges.

- [mainframe/__init__.py](__init__.md)
- [mainframe/zowe_pipeline_steps.py](zowe_pipeline_steps.md)
- [tests/test_zowe_fetch_inventory.py](../tests/test_zowe_fetch_inventory.md)
- [tests/test_zowe_reports_history.py](../tests/test_zowe_reports_history.md)

## Symbol contracts and control points

### `ZoweFetcher` - L72-L376

```python
class ZoweFetcher()
```

### `ZoweFetcher.__init__` - L73-L90

```python
__init__(self, programs: list[str] | None=None) -> None
```

Observed calls (lexical order): `selected_programs`, `dict.fromkeys`, `list`, `str`, `str(name).strip`, `str(name).strip().upper`, `ValueError`, `SearchHistoryRecorder`.

Control points:

- L78: `if not self.programs`

Explicit raises: `ValueError('No programs selected for fetch')`.

### `ZoweFetcher._search` - L93-L102

```python
_search(self, artifact: str) -> LibrarySearch
```

Observed calls (lexical order): `LibrarySearch`, `self.diagnostics.append`, `DIAG_LIBRARY_ORDER_TEMPLATE.format`, `', '.join`.

Control points:

- L94: `if artifact not in self._searches`

### `ZoweFetcher._save` - L104-L120

```python
_save(self, artifact: str, member: str, dataset: str, content: bytes) -> Path
```

Observed calls (lexical order): `_LANDING[artifact]`, `folder.mkdir`, `target.write_bytes`, `self.saved.setdefault`, `self.saved.setdefault(ARTIFACT_LABELS[artifact], []).append`, `self.diagnostics.append`, `DIAG_FOUND_TEMPLATE.format`.

### `ZoweFetcher._fetch_member` - L122-L178

```python
_fetch_member(self, artifact: str, member: str, mandatory: bool) -> bool
```

Observed calls (lexical order): `self.search_history.record`, `self._member_attempts.get`, `ValueError`, `self._search`, `SearchAttempt`, `type`, `search.download`, `getattr`, `getattr(search, 'search_history', {}).get`, `tuple`, `', '.join`, `self.diagnostics.append`, `DIAG_NOT_FOUND_TEMPLATE.format`, `message.format`, `self.warnings.append`, `self._save`.
Another 1 call expressions are in this source span; the list is intentionally bounded.

Control points:

- L127: `if key in self._observations`
- L131: `if mandatory and (not found)`
- L149: `if not dataset`
- L165: `if mandatory`

Explicit raises: `ValueError(f'Required member unavailable: {member}')`; `re-raise`; `ValueError(formatted)`.

### `ZoweFetcher._fetch_program` - L181-L204

```python
_fetch_program(self, program: str) -> ProgramDependencies
```

Observed calls (lexical order): `self._search`, `search.download`, `ValueError`, `ZOWE_ERROR_MESSAGES['program_not_found'].format`, `', '.join`, `self._save`, `path.read_text`, `resolve_dependencies`, `self.diagnostics.append`, `DIAG_DEPENDENCIES_TEMPLATE.format`, `len`.

Control points:

- L184: `if not dataset`

Explicit raises: `ValueError(ZOWE_ERROR_MESSAGES['program_not_found'].format(member=program, libraries=', '.join(search.libraries)))`.

### `ZoweFetcher._fetch_dependencies` - L206-L248

```python
_fetch_dependencies(self, deps: ProgramDependencies) -> None
```

Observed calls (lexical order): `expand_copy_dependencies`, `self.diagnostics.append`, `DIAG_SUBSCHEMA_DETECTED_TEMPLATE.format`, `self._fetch_member`, `list`, `self._dclgen_members`, `DIAG_DERIVED_DCLGEN_TEMPLATE.format`, `members.append`.

Control points:

- L228: `if deps.subschema`
- L234: `if self._fetch_member(ARTIFACT_SUBSCHEMA, deps.subschema, False)`
- L241: `for record in deps.records`
- L242: `for member in self._dclgen_members(record, subschema_path)`
- L244: `if member not in members`
- L247: `for member in deps.dclgens`

### `ZoweFetcher._fetch_dependencies.load_copy` - L207-L224

```python
load_copy(member: str) -> str | None
```

Observed calls (lexical order): `self._fetch_member`, `path.read_text`, `self._member_attempts.get`, `self.search_history.issue`, `type`, `self.warnings.append`.

Control points:

- L208: `if not self._fetch_member(ARTIFACT_COPYBOOK, member, mandatory=False)`

### `ZoweFetcher._dclgen_members` - L250-L269

```python
_dclgen_members(self, record: str, subschema_path) -> list[str]
```

Observed calls (lexical order): `element_records_for`, `self.diagnostics.append`, `DIAG_ELEMENTS_TEMPLATE.format`, `', '.join`, `DIAG_NO_ELEMENTS_TEMPLATE.format`, `dclgen_members_for_record`.

Control points:

- L254: `if subschema_path is not None`
- L257: `if elements`

### `ZoweFetcher.fetch_all` - L272-L355

```python
fetch_all(self) -> dict
```

Observed calls (lexical order): `self.diagnostics.clear`, `self.warnings.clear`, `ensure_workspace`, `self.diagnostics.append`, `DIAG_APPLICATION_TEMPLATE.format`, `application_code`, `DIAG_PROGRAM_LIST_TEMPLATE.format`, `', '.join`, `len`, `self._member_paths.clear`, `self._observations.clear`, `self._source_texts.clear`, `self._copy_sources.clear`, `self._member_attempts.clear`, `self._searches.clear`, `SearchHistoryRecorder`.
Another 16 call expressions are in this source span; the list is intentionally bounded.

Control points:

- L303: `for program in self.programs`

Explicit raises: `re-raise`.

### `ZoweFetcher._publish_reports` - L357-L376

```python
_publish_reports(self, inventory: Iterable[InventoryRow]) -> tuple[tuple[Path, int], tuple[Path, int]]
```

Try both durable reports independently; never hide a report failure.

Observed calls (lexical order): `write_inventory`, `write_search_history`, `results.append`, `writer`, `failures.append`, `logger.error`, `type`, `RuntimeError`.

Control points:

- L365: `for (kind, writer) in (('inventory', lambda: write_inventory(inventory)), ('search history', lambda: write_search_history(self.search_history.rows)))`
- L374: `if failures`

Explicit raises: `RuntimeError('Fetch report publication failed; inspect the chained error and report diagnostics. Failed workbooks were not replaced.')`.

### `fetch_zowe_inputs` - L379-L380

```python
fetch_zowe_inputs(source_text: str='') -> dict
```

Observed calls (lexical order): `ZoweFetcher`, `ZoweFetcher().fetch_all`.

## Change responsibility

After modifying this Python file, review [prompt/02_MAINFRAME_PIPELINE.md](../../02_MAINFRAME_PIPELINE.md), update any affected behavioral contracts, then run `python prompt/tools/maintain_docs.py refresh` and `python prompt/tools/maintain_docs.py check` from the repository root. Keep scratch Markdown only in `prompt/temp/`. Generated notes must not be hand-edited; add explanations to the owning guide.
