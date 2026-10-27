# `converter/analyzers/field_usage_capture_service.py`

Source: [converter/analyzers/field_usage_capture_service.py](../../../../converter/analyzers/field_usage_capture_service.py) | 235 lines.
Owning logic guide: [prompt/03_INPUT_METADATA_AND_RESOLUTION.md](../../../03_INPUT_METADATA_AND_RESOLUTION.md).
Source SHA-256: `739649cfd64ce9718b74e201edd7df190d0d7af161c8420bef5919b960d0e748`.

Generated source map. Read this file to locate the relevant symbols, then inspect the touched source before changing behavior. Lexical calls/branches are not a proof of runtime wiring or semantic equivalence.

## Responsibility

No module-level purpose docstring. The symbol contracts and observed dependencies below are extracted from source; use the owning guide for subsystem context.

## Import declarations

```python
from __future__ import annotations
from converter.analyzers.field_usage_models import FieldUsage, FieldUsageAnalysis
from converter.services.name_normalizer import NameNormalizer
from patterns.field_usage_analysis_patterns import DCLGEN_DOT_PATTERN, DCLGEN_OF_PATTERN, MOVE_PATTERN, QUALIFIED_REFERENCE_PATTERN
from rules.field_usage_rules import DCLGEN_GROUP_PREFIX, OUTPUT_TARGET_PREFIXES
```

## Local dependency notes

- [converter/analyzers/field_usage_models.py](field_usage_models.md)
- [converter/services/name_normalizer.py](../services/name_normalizer.md)
- [patterns/field_usage_analysis_patterns.py](../../patterns/field_usage_analysis_patterns.md)
- [rules/field_usage_rules.py](../../rules/field_usage_rules.md)

## Importers (1)

Static imports only; dependency injection, string imports and runtime dispatch can add edges.

- [converter/analyzers/field_usage_analyzer.py](field_usage_analyzer.md)

## Symbol contracts and control points

### `FieldUsageCaptureService` - L20-L235

```python
class FieldUsageCaptureService()
```

Captures field usage from individual COBOL logical statements.

### `FieldUsageCaptureService.__init__` - L28-L35

```python
__init__(self, *, mapping_records: set[str], group_to_record: dict[str, str]) -> None
```

### `FieldUsageCaptureService.capture_idms_qualified_references` - L37-L61

```python
capture_idms_qualified_references(self, *, logical: str, result: FieldUsageAnalysis, is_condition: bool) -> None
```

Observed calls (lexical order): `QUALIFIED_REFERENCE_PATTERN.finditer`, `NameNormalizer.to_cobol`, `match.group`, `NameNormalizer.normalize`, `record_name.startswith`, `self.usage_for_record`, `usage.all_fields.add`, `usage.condition_fields.add`.

Control points:

- L44: `for match in QUALIFIED_REFERENCE_PATTERN.finditer(logical)`
- L48: `if not field_name or not record_name`
- L51: `if record_name.startswith(DCLGEN_GROUP_PREFIX)`
- L54: `if record_name not in self.mapping_records`
- L60: `if is_condition`

### `FieldUsageCaptureService.capture_dclgen_references` - L63-L82

```python
capture_dclgen_references(self, *, logical: str, result: FieldUsageAnalysis, is_condition: bool, is_output: bool) -> None
```

Observed calls (lexical order): `self._capture_dclgen_of_references`, `self._capture_dclgen_dot_references`.

### `FieldUsageCaptureService.capture_move_usage` - L84-L107

```python
capture_move_usage(self, *, logical: str, result: FieldUsageAnalysis) -> None
```

Observed calls (lexical order): `MOVE_PATTERN.search`, `match.group`, `self._is_output_target`, `self._capture_move_source_usage`, `self._capture_move_target_usage`.

Control points:

- L92: `if not match`

### `FieldUsageCaptureService.usage_for_record` - L109-L119

```python
usage_for_record(self, result: FieldUsageAnalysis, record_name: str) -> FieldUsage
```

Observed calls (lexical order): `NameNormalizer.normalize`, `FieldUsage`.

Control points:

- L116: `if record not in result.usage_by_record`

### `FieldUsageCaptureService._capture_dclgen_of_references` - L121-L144

```python
_capture_dclgen_of_references(self, *, logical: str, result: FieldUsageAnalysis, is_condition: bool, is_output: bool) -> None
```

Observed calls (lexical order): `DCLGEN_OF_PATTERN.finditer`, `NameNormalizer.to_cobol`, `match.group`, `NameNormalizer.normalize`, `self.group_to_record.get`, `self.usage_for_record`, `usage.dclgen_host_fields.add`, `usage.condition_fields.add`, `usage.output_fields.add`.

Control points:

- L129: `for match in DCLGEN_OF_PATTERN.finditer(logical)`
- L134: `if not field_name or not record_name`
- L140: `if is_condition`
- L143: `if is_output`

### `FieldUsageCaptureService._capture_dclgen_dot_references` - L146-L169

```python
_capture_dclgen_dot_references(self, *, logical: str, result: FieldUsageAnalysis, is_condition: bool, is_output: bool) -> None
```

Observed calls (lexical order): `DCLGEN_DOT_PATTERN.finditer`, `NameNormalizer.to_cobol`, `match.group`, `NameNormalizer.normalize`, `self.group_to_record.get`, `self.usage_for_record`, `usage.dclgen_host_fields.add`, `usage.condition_fields.add`, `usage.output_fields.add`.

Control points:

- L154: `for match in DCLGEN_DOT_PATTERN.finditer(logical)`
- L159: `if not field_name or not record_name`
- L165: `if is_condition`
- L168: `if is_output`

### `FieldUsageCaptureService._capture_move_source_usage` - L171-L202

```python
_capture_move_source_usage(self, *, source_text: str, result: FieldUsageAnalysis, is_output: bool) -> None
```

Observed calls (lexical order): `QUALIFIED_REFERENCE_PATTERN.finditer`, `NameNormalizer.to_cobol`, `source_match.group`, `NameNormalizer.normalize`, `record_name.startswith`, `self.usage_for_record`, `usage.move_source_fields.add`, `usage.output_fields.add`, `self.capture_dclgen_references`.

Control points:

- L178: `for source_match in QUALIFIED_REFERENCE_PATTERN.finditer(source_text)`
- L182: `if not field_name or not record_name`
- L185: `if record_name.startswith(DCLGEN_GROUP_PREFIX)`
- L188: `if record_name not in self.mapping_records`
- L194: `if is_output`

### `FieldUsageCaptureService._capture_move_target_usage` - L204-L224

```python
_capture_move_target_usage(self, *, target_text: str, result: FieldUsageAnalysis) -> None
```

Observed calls (lexical order): `QUALIFIED_REFERENCE_PATTERN.finditer`, `NameNormalizer.to_cobol`, `target_match.group`, `NameNormalizer.normalize`, `record_name.startswith`, `self.usage_for_record`, `usage.move_target_fields.add`.

Control points:

- L210: `for target_match in QUALIFIED_REFERENCE_PATTERN.finditer(target_text)`
- L214: `if not field_name or not record_name`
- L217: `if record_name.startswith(DCLGEN_GROUP_PREFIX)`
- L220: `if record_name not in self.mapping_records`

### `FieldUsageCaptureService._is_output_target` - L226-L235

```python
_is_output_target(self, target_text: str) -> bool
```

Observed calls (lexical order): `str`, `str(target_text or '').upper`, `any`.

## Change responsibility

After modifying this Python file, review [prompt/03_INPUT_METADATA_AND_RESOLUTION.md](../../../03_INPUT_METADATA_AND_RESOLUTION.md), update any affected behavioral contracts, then run `python prompt/tools/maintain_docs.py refresh` and `python prompt/tools/maintain_docs.py check` from the repository root. Keep scratch Markdown only in `prompt/temp/`. Generated notes must not be hand-edited; add explanations to the owning guide.
