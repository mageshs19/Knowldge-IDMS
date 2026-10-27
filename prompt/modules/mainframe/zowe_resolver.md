# `mainframe/zowe_resolver.py`

Source: [mainframe/zowe_resolver.py](../../../mainframe/zowe_resolver.py) | 266 lines.
Owning logic guide: [prompt/02_MAINFRAME_PIPELINE.md](../../02_MAINFRAME_PIPELINE.md).
Source SHA-256: `f0b0a5f6dba8fbdcee36467e5b4cdb35200360fd84ea0f572df048ec137d3132`.

Generated source map. Read this file to locate the relevant symbols, then inspect the touched source before changing behavior. Lexical calls/branches are not a proof of runtime wiring or semantic equivalence.

## Responsibility

Source-declared description (not an independently verified runtime claim):

> Works out what ONE IDMS program needs.

## Module-level bindings

`_NOT_A_RECORD` (L50)

## Import declarations

```python
from __future__ import annotations
from dataclasses import dataclass, field
from collections.abc import Callable
from pathlib import Path
import re
from mainframe.zowe_patterns import COPY_IDMS_RECORD_PATTERN, COPY_IDMS_LR_PATTERN, FETCH_COPY_PATTERN, FETCH_SQL_INCLUDE_PATTERN, DB_WITHIN_PATTERN, FIXED_SEQUENCE_PATTERN, IDMS_VERB_RECORD_PATTERN, RECORD_VERSION_SUFFIX_PATTERN
from mainframe.zowe_rules import BODY_END_COLUMN, BODY_START_COLUMN, COMMENT_INDICATORS, DCLGEN_MEMBER_TEMPLATE, DCLGEN_PREFIX, DCLGEN_RECORD_TAIL_LENGTH, DCLGEN_SUFFIX, INDICATOR_COLUMN
from mainframe.zowe_subschema import element_records_for
```

## Local dependency notes

- [mainframe/zowe_patterns.py](zowe_patterns.md)
- [mainframe/zowe_rules.py](zowe_rules.md)
- [mainframe/zowe_subschema.py](zowe_subschema.md)

## Importers (7)

Static imports only; dependency injection, string imports and runtime dispatch can add edges.

- [mainframe/__init__.py](__init__.md)
- [mainframe/zowe_commands.py](zowe_commands.md)
- [mainframe/zowe_fetcher.py](zowe_fetcher.md)
- [mainframe/zowe_manifest.py](zowe_manifest.md)
- [tests/test_dzecabtv_fix.py](../tests/test_dzecabtv_fix.md)
- [tests/test_zowe_fetch_inventory.py](../tests/test_zowe_fetch_inventory.md)
- [tests/test_zowe_reports_history.py](../tests/test_zowe_reports_history.md)

## Symbol contracts and control points

### `logical_body` - L57-L78

```python
logical_body(line: str) -> str
```

Remove fixed sequence/indicator areas and non-executable comments.

Observed calls (lexical order): `str`, `str(line or '').rstrip`, `text.strip`, `FIXED_SEQUENCE_PATTERN.match`, `bool`, `len`, `text[72:80].isdigit`, `text[72:].strip`, `text[BODY_START_COLUMN:BODY_END_COLUMN].rstrip`, `text.lstrip`, `text.lstrip().startswith`, `text.rstrip`.

Control points:

- L64: `if not text.strip()`
- L71: `if fixed or blank_sequence`
- L73: `if indicator in (*COMMENT_INDICATORS, 'D', 'd')`
- L76: `if text.lstrip().startswith(('*', '/'))`

### `logical_text` - L81-L120

```python
logical_text(source_text: str) -> str
```

Executable source bodies with inline comments removed, literals intact.

Observed calls (lexical order): `str`, `str(source_text or '').splitlines`, `logical_body`, `re.match`, `out.append`, `len`, `body.lstrip`, `'\n'.join`.

Control points:

- L86: `for raw in str(source_text or '').splitlines()`
- L90: `if re.match('\\s*(?:IDENTIFICATION|ID)\\s+DIVISION\\b', body, re.I)`
- L92: `if re.match('\\s*(?:ENVIRONMENT|DATA|PROCEDURE)\\s+DIVISION\\b', body, re.I)`
- L95: `if identification`
- L98: `if quote and len(raw) > 6 and (raw[6] == '-')`
- L102: `if body[leading:leading + 1] == quote`
- L105: `while i < len(body)`
- L107: `if quote`
- Another 4 conditions/loops exist in this source span.

### `mask_literals` - L123-L143

```python
mask_literals(text: str) -> str
```

Mask quoted contents without moving line/character offsets.

Observed calls (lexical order): `list`, `len`, `''.join`.

Control points:

- L128: `while i < len(chars)`
- L130: `if quote`
- L131: `if char != '\n'`
- L133: `if char == quote`
- L134: `if i + 1 < len(chars) and text[i + 1] == quote`
- L139: `if char in '"\''`

### `base_record_name` - L146-L149

```python
base_record_name(record: str) -> str
```

VMBTL03-R01 -> VMBTL03. A view suffix is not part of the name.

Observed calls (lexical order): `str`, `str(record or '').strip`, `str(record or '').strip().upper`, `RECORD_VERSION_SUFFIX_PATTERN.sub`.

### `dclgen_member_for` - L152-L161

```python
dclgen_member_for(record: str) -> str
```

VMBEVEF -> DZEVEFTV, VMBTL03-R01 -> DZTL03TV

Observed calls (lexical order): `base_record_name`, `base_record_name(record).replace`, `len`, `DCLGEN_MEMBER_TEMPLATE.format`.

Control points:

- L155: `if len(name) < DCLGEN_RECORD_TAIL_LENGTH`

### `ProgramDependencies` - L165-L171

```python
class ProgramDependencies()
```

Declared class/data-model fields:

```python
program: str = ''
copybooks: list[str] = field(default_factory=list)
records: list[str] = field(default_factory=list)
dclgens: list[str] = field(default_factory=list)
subschema: str = ''
explicit_dclgens: list[str] = field(default_factory=list)
```

### `_unique` - L174-L180

```python
_unique(values) -> list[str]
```

Observed calls (lexical order): `str`, `str(value or '').strip`, `str(value or '').strip().upper`, `out.append`.

Control points:

- L176: `for value in values`
- L178: `if name and name not in out`

### `resolve_dependencies` - L183-L224

```python
resolve_dependencies(program: str, source_text: str) -> ProgramDependencies
```

Observed calls (lexical order): `logical_text`, `mask_literals`, `_unique`, `FETCH_COPY_PATTERN.finditer`, `match.group`, `match.end`, `match.start`, `text[match.start():match.end()].lstrip`, `text[match.start():match.end()].lstrip().upper`, `text[match.start():match.end()].lstrip().upper().startswith`, `FETCH_SQL_INCLUDE_PATTERN.finditer`, `match.group('member').upper`, `COPY_IDMS_RECORD_PATTERN.finditer`, `COPY_IDMS_LR_PATTERN.finditer`, `match.group('lr').strip`, `match.group('lr').strip().upper`.
Another 12 call expressions are in this source span; the list is intentionally bounded.

Control points:

- L201: `for match in COPY_IDMS_LR_PATTERN.finditer(text)`
- L203: `if name not in records`
- L205: `for match in IDMS_VERB_RECORD_PATTERN.finditer(text)`
- L207: `if name and name not in _NOT_A_RECORD and (name not in records)`
- L212: `if match`

### `expand_copy_dependencies` - L227-L259

```python
expand_copy_dependencies(deps: ProgramDependencies, load: Callable[[str], str | None]) -> list[tuple[str, str]]
```

Expand ordinary COPY references once per member, including cycles.

Observed calls (lexical order): `set`, `len`, `visited.add`, `ValueError`, `load`, `fragments.append`, `resolve_dependencies`, `_unique`.

Control points:

- L239: `while index < len(deps.copybooks)`
- L242: `if member in visited`
- L245: `if len(visited) > 10000`
- L248: `if source is None`
- L255: `if child.subschema`
- L256: `if deps.subschema and deps.subschema != child.subschema`

Explicit raises: `ValueError('COPY dependency closure exceeds 10000 members')`; `ValueError('Conflicting subschemas in program/COPY dependency closure')`.

### `dclgen_members_for_record` - L262-L266

```python
dclgen_members_for_record(record: str, subschema_path: Path | None) -> list[str]
```

Same LR element resolution for live fetch and offline inventories.

Observed calls (lexical order): `element_records_for`, `_unique`, `dclgen_member_for`.

## Change responsibility

After modifying this Python file, review [prompt/02_MAINFRAME_PIPELINE.md](../../02_MAINFRAME_PIPELINE.md), update any affected behavioral contracts, then run `python prompt/tools/maintain_docs.py refresh` and `python prompt/tools/maintain_docs.py check` from the repository root. Keep scratch Markdown only in `prompt/temp/`. Generated notes must not be hand-edited; add explanations to the owning guide.
