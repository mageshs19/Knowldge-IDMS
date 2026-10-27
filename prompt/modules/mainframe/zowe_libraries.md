# `mainframe/zowe_libraries.py`

Source: [mainframe/zowe_libraries.py](../../../mainframe/zowe_libraries.py) | 121 lines.
Owning logic guide: [prompt/02_MAINFRAME_PIPELINE.md](../../02_MAINFRAME_PIPELINE.md).
Source SHA-256: `26601f4b86a1d7cef1aa0d0e75eb5264510afbe09b6bcf1b44431577d3af44f5`.

Generated source map. Read this file to locate the relevant symbols, then inspect the touched source before changing behavior. Lexical calls/branches are not a proof of runtime wiring or semantic equivalence.

## Responsibility

Source-declared description (not an independently verified runtime claim):

> Member lookup across an ordered library list.

## Module-level bindings

`logger` (L30), `__all__` (L32)

## Import declarations

```python
from __future__ import annotations
import logging
from dataclasses import dataclass, field
import requests
from mainframe.zowe_client import ZoweClient
from mainframe.zowe_rules import ARTIFACT_LABELS
from mainframe.zowe_search_history import SearchAttempt, http_attempt, exception_attempt
from mainframe.zowe_settings import ZoweConnection, application_code, artifact_connection, expand, require_libraries
```

## Local dependency notes

- [mainframe/zowe_client.py](zowe_client.md)
- [mainframe/zowe_rules.py](zowe_rules.md)
- [mainframe/zowe_search_history.py](zowe_search_history.md)
- [mainframe/zowe_settings.py](zowe_settings.md)

## Importers (4)

Static imports only; dependency injection, string imports and runtime dispatch can add edges.

- [mainframe/__init__.py](__init__.md)
- [mainframe/zowe_commands.py](zowe_commands.md)
- [mainframe/zowe_fetcher.py](zowe_fetcher.md)
- [tests/test_zowe_reports_history.py](../tests/test_zowe_reports_history.md)

## Symbol contracts and control points

### `libraries_for` - L40-L41

```python
libraries_for(artifact: str) -> list[str]
```

Observed calls (lexical order): `list`, `require_libraries`.

### `LibrarySearch` - L45-L121

```python
class LibrarySearch()
```

Searches one artifact's libraries, member by member.

Declared class/data-model fields:

```python
artifact: str
label: str = ''
libraries: list[str] = field(default_factory=list)
_client: ZoweClient | None = None
attempts: dict[str, dict[str, int]] = field(default_factory=dict)
search_history: dict[str, list[SearchAttempt]] = field(default_factory=dict)
```

### `LibrarySearch.__post_init__` - L56-L59

```python
__post_init__(self) -> None
```

Observed calls (lexical order): `libraries_for`.

Control points:

- L58: `if not self.libraries`

### `LibrarySearch.client` - L62-L66

```python
client(self) -> ZoweClient
```

Observed calls (lexical order): `artifact_connection`, `ZoweClient`.

Control points:

- L63: `if self._client is None`

### `LibrarySearch._lookup` - L68-L100

```python
_lookup(self, member: str, *, probe: bool=False) -> tuple[str, bytes]
```

Keep every tried library, even when a later library succeeds.

Observed calls (lexical order): `str`, `str(member or '').strip`, `str(member or '').strip().upper`, `self.client.member_exists`, `self.client.fetch_member`, `exception_attempt`, `trace.append`, `logger.warning`, `type`, `isinstance`, `http_attempt`.

Control points:

- L75: `if not wanted`
- L81: `for dataset in self.libraries`
- L83: `if probe`
- L93: `if isinstance(exc, (requests.RequestException, ValueError))`
- L98: `if found`

Explicit raises: `re-raise`.

### `LibrarySearch.locate` - L102-L104

```python
locate(self, member: str) -> str
```

First library holding the member, or an empty string.

Observed calls (lexical order): `self._lookup`.

### `LibrarySearch.download` - L106-L108

```python
download(self, member: str) -> tuple[str, bytes]
```

(dataset, content); complete attempt evidence is in search_history.

Observed calls (lexical order): `self._lookup`.

### `LibrarySearch.why_not_found` - L110-L117

```python
why_not_found(self, member: str) -> str
```

Per-library HTTP status for the most recent lookup.

Observed calls (lexical order): `self.attempts.get`, `str`, `str(member or '').strip`, `str(member or '').strip().upper`, `', '.join`, `statuses.items`.

Control points:

- L113: `if not statuses`

### `LibrarySearch.list_members` - L119-L121

```python
list_members(self, dataset: str) -> list[str]
```

Diagnostic only. Never used for lookup.

Observed calls (lexical order): `expand`, `self.client.list_members`.

## Change responsibility

After modifying this Python file, review [prompt/02_MAINFRAME_PIPELINE.md](../../02_MAINFRAME_PIPELINE.md), update any affected behavioral contracts, then run `python prompt/tools/maintain_docs.py refresh` and `python prompt/tools/maintain_docs.py check` from the repository root. Keep scratch Markdown only in `prompt/temp/`. Generated notes must not be hand-edited; add explanations to the owning guide.
