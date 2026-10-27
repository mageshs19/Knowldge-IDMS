# `converter/transformers/field_reference_rewriter.py`

Source: [converter/transformers/field_reference_rewriter.py](../../../../converter/transformers/field_reference_rewriter.py) | 404 lines.
Owning logic guide: [prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md](../../../06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md).
Source SHA-256: `feb1e7db646395d61328152a242fad428d1ec244e3dc3f42aefd195b50d9ab87`.

Generated source map. Read this file to locate the relevant symbols, then inspect the touched source before changing behavior. Lexical calls/branches are not a proof of runtime wiring or semantic equivalence.

## Responsibility

No module-level purpose docstring. The symbol contracts and observed dependencies below are extracted from source; use the owning guide for subsystem context.

## Module-level bindings

`PROCEDURE_DIVISION_NAME` (L35), `BLANK_INDICATOR` (L36), `LINE_ENDINGS` (L37), `__all__` (L402)

## Import declarations

```python
from __future__ import annotations
from converter.repositories.mapping_repository import MappingRepository
from converter.resolvers.host_variable_resolver import HostVariableResolver
from converter.resolvers.table_name_resolver import TableNameResolver
from converter.services.fixed_format_line_service import FixedFormatLineService
from converter.transformers.field_reference_context_builder import FieldReferenceContextBuilder
from converter.transformers.field_reference_line_utils import FieldReferenceLineUtils
from converter.transformers.field_reference_record_context import FieldReferenceRecordContext
from converter.transformers.field_reference_replacement_engine import FieldReferenceReplacementEngine
from patterns.field_reference_rewriter_patterns import DIVISION_PATTERN, END_EXEC_PATTERN, EXEC_SQL_PATTERN
from rules.field_reference_rewriter_rules import ALLOW_REWRITE_WRAPPING, ENFORCE_FIXED_FORMAT_REWRITE, FIELD_REFERENCE_GEOMETRY_MESSAGES
```

## Local dependency notes

- [converter/repositories/mapping_repository.py](../repositories/mapping_repository.md)
- [converter/resolvers/host_variable_resolver.py](../resolvers/host_variable_resolver.md)
- [converter/resolvers/table_name_resolver.py](../resolvers/table_name_resolver.md)
- [converter/services/fixed_format_line_service.py](../services/fixed_format_line_service.md)
- [converter/transformers/field_reference_context_builder.py](field_reference_context_builder.md)
- [converter/transformers/field_reference_line_utils.py](field_reference_line_utils.md)
- [converter/transformers/field_reference_record_context.py](field_reference_record_context.md)
- [converter/transformers/field_reference_replacement_engine.py](field_reference_replacement_engine.md)
- [patterns/field_reference_rewriter_patterns.py](../../patterns/field_reference_rewriter_patterns.md)
- [rules/field_reference_rewriter_rules.py](../../rules/field_reference_rewriter_rules.md)

## Importers (3)

Static imports only; dependency injection, string imports and runtime dispatch can add edges.

- [converter/pipeline/conversion/conversion_component_factory.py](../pipeline/conversion/conversion_component_factory.md)
- [tests/test_field_reference_geometry.py](../../tests/test_field_reference_geometry.md)
- [tests/test_transformers.py](../../tests/test_transformers.md)

## Symbol contracts and control points

### `FieldReferenceRewriter` - L40-L399

```python
class FieldReferenceRewriter()
```

Generic IDMS field reference to DB2 DCLGEN reference rewriter.

### `FieldReferenceRewriter.__init__` - L123-L148

```python
__init__(self, mapping_repository: MappingRepository, table_name_resolver: TableNameResolver, host_variable_resolver: HostVariableResolver, fixed_format: FixedFormatLineService | None=None) -> None
```

Observed calls (lexical order): `FieldReferenceLineUtils`, `FixedFormatLineService`, `FieldReferenceContextBuilder`.

### `FieldReferenceRewriter._build_reference_maps` - L150-L158

```python
_build_reference_maps(self) -> None
```

Retained for any external caller. rewrite() does not need it.

Observed calls (lexical order): `self.context_builder.build_reference_maps`, `self.rewrite_messages.extend`.

### `FieldReferenceRewriter.rewrite` - L163-L262

```python
rewrite(self, text: str) -> str
```

Observed calls (lexical order): `self.context_builder.build_reference_maps`, `self.rewrite_messages.extend`, `str`, `str(text or '').rstrip`, `str(text or '').splitlines`, `any`, `DIVISION_PATTERN.match`, `self.line_utils.logical_line`, `FieldReferenceRecordContext`, `FieldReferenceReplacementEngine`, `getattr`, `raw_line.rstrip`, `division_match.group`, `division_match.group(1).upper`, `output_lines.append`, `record_context.detect_active_record_from_line`.
Another 6 call expressions are in this source span; the list is intentionally bounded.

Control points:

- L170: `if not text`
- L187: `if not self.record_field_map`
- L217: `for raw_line in lines`
- L226: `if division_match`
- L237: `if detected_context`
- L240: `if EXEC_SQL_PATTERN.match(logical)`
- L245: `if inside_exec_sql`
- L248: `if END_EXEC_PATTERN.match(logical)`

### `FieldReferenceRewriter._rewrite_line` - L267-L327

```python
_rewrite_line(self, *, line: str, current_division: str, active_record: str, replacement_engine: FieldReferenceReplacementEngine) -> list[str]
```

Rewrite one line. Returns one line, or several when wrapped.

Observed calls (lexical order): `self.line_utils.is_comment_or_blank`, `self.line_utils.has_existing_dclgen_reference`, `self._is_fixed`, `self._rewrite_text`, `self._split`, `self._build`, `self._wrap`, `self.rewrite_messages.append`, `FIELD_REFERENCE_GEOMETRY_MESSAGES['wrapped'].format`, `len`, `list`, `FIELD_REFERENCE_GEOMETRY_MESSAGES['refused'].format`, `new_body.strip`.

Control points:

- L276: `if self.line_utils.is_comment_or_blank(line)`
- L279: `if current_division != PROCEDURE_DIVISION_NAME`
- L282: `if self.line_utils.has_existing_dclgen_reference(line)`
- L285: `if not ENFORCE_FIXED_FORMAT_REWRITE or not self._is_fixed(line)`
- L302: `if new_body == body`
- L307: `if rebuilt is not None`
- L310: `if ALLOW_REWRITE_WRAPPING`
- L313: `if wrapped`

### `FieldReferenceRewriter._rewrite_text` - L329-L353

```python
_rewrite_text(self, *, text: str, active_record: str, replacement_engine: FieldReferenceReplacementEngine) -> str
```

Apply both rewrites to one span, string literals protected.

Observed calls (lexical order): `self.line_utils.split_string_segments`, `rewritten_segments.append`, `replacement_engine.rewrite_qualified_references`, `replacement_engine.rewrite_bare_references`, `''.join`.

Control points:

- L340: `for (segment, is_string) in segments`
- L341: `if is_string`

### `FieldReferenceRewriter._is_fixed` - L358-L362

```python
_is_fixed(self, line: str) -> bool
```

Observed calls (lexical order): `bool`, `self.fixed_format.is_fixed_line`.

### `FieldReferenceRewriter._split` - L364-L374

```python
_split(self, line: str) -> tuple[str, str, str, str]
```

Observed calls (lexical order): `self.fixed_format.split`, `str`.

### `FieldReferenceRewriter._build` - L376-L391

```python
_build(self, left: str, indicator: str, body: str, right: str) -> str | None
```

Observed calls (lexical order): `self.fixed_format.build_or_none`.

### `FieldReferenceRewriter._wrap` - L393-L399

```python
_wrap(self, line: str, body: str) -> list[str]
```

Observed calls (lexical order): `list`, `self.fixed_format.replace_body_wrapped`.

## Change responsibility

After modifying this Python file, review [prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md](../../../06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md), update any affected behavioral contracts, then run `python prompt/tools/maintain_docs.py refresh` and `python prompt/tools/maintain_docs.py check` from the repository root. Keep scratch Markdown only in `prompt/temp/`. Generated notes must not be hand-edited; add explanations to the owning guide.
