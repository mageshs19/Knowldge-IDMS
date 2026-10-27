# `Knowldge-Graph/prompt/tools/maintain_docs.py`

Source: [Knowldge-Graph/prompt/tools/maintain_docs.py](../../../../../Knowldge-Graph/prompt/tools/maintain_docs.py) | 469 lines.
Owning logic guide: [prompt/04_LR_IDMS_DB2_CONVERSION.md](../../../../04_LR_IDMS_DB2_CONVERSION.md).
Source SHA-256: `e2d6f1e9024449d6ef47e852f669241c10160536b821fe78c034e6425809c651`.

Generated source map. Read this file to locate the relevant symbols, then inspect the touched source before changing behavior. Lexical calls/branches are not a proof of runtime wiring or semantic equivalence.

## Responsibility

Source-declared description (not an independently verified runtime claim):

> Build/check source-linked Markdown without importing or running the engine.

## Module-level bindings

`ROOT` (L26), `MANIFEST` (L27), `SKIP_DIRS` (L28), `GUIDES` (L29)

## Import declarations

```python
from __future__ import annotations
import argparse
import ast
import hashlib
import json
import os
import re
import sys
import tokenize
from collections import defaultdict
from pathlib import Path
from urllib.parse import quote, unquote, urlsplit
```

## Symbol contracts and control points

### `digest` - L46-L47

```python
digest(path: Path) -> str
```

Observed calls (lexical order): `hashlib.sha256`, `hashlib.sha256(path.read_bytes()).hexdigest`, `path.read_bytes`.

### `sources` - L50-L54

```python
sources(root: Path) -> list[Path]
```

Cover every engine/test Python file; documentation tooling is separate.

Observed calls (lexical order): `root.rglob`, `sorted`, `p.relative_to`, `set`.

### `guide_for` - L57-L83

```python
guide_for(name: str) -> str
```

Observed calls (lexical order): `name.lower`, `low.startswith`, `any`.

Control points:

- L59: `if low.startswith('tests/')`
- L61: `if low.startswith(('review/', 'mainframe/verification/')) or 'semantic_release_gate' in low`
- L63: `if low.startswith('mainframe/')`
- L65: `if low.startswith(('rules/', 'patterns/', 'catalogs/', 'converter/rules/'))`
- L67: `if low.startswith(('config/', 'converter/config/')) or low == 'main.py'`
- L69: `if low.startswith(('tool/', 'converter/ui/', 'converter/logging_utils/')) or low == 'converter/app.py' or 'logger' in low or ('logging' in low)`
- L71: `if 'restart' in low or low.startswith(('runners/update/', 'converter/composers/update', 'converter/postprocess/update')) or 'update_program' in low or ('commit' in low)`
- L73: `if low.startswith(('converter/parsers/', 'converter/repositories/', 'converter/resolvers/', 'converter/domain/', 'converter/analyzers/', 'converter/infrastructure/')) or 'input_loa...`
- Another 4 conditions/loops exist in this source span.

### `short` - L86-L88

```python
short(text: str, limit: int=380) -> str
```

Observed calls (lexical order): `re.sub`, `re.sub('\\s+', ' ', text).strip`, `len`.

### `safe` - L91-L92

```python
safe(text: str) -> str
```

Observed calls (lexical order): `str`, `str(text).replace`, `str(text).replace('|', '\\|').replace`, `str(text).replace('|', '\\|').replace('[', '\\[').replace`, `str(text).replace('|', '\\|').replace('[', '\\[').replace(']', '\\]').replace`.

### `inline` - L95-L96

```python
inline(text: str) -> str
```

Observed calls (lexical order): `str`, `str(text).replace`, `str(text).replace(''', "'").replace`.

### `link` - L99-L101

```python
link(from_doc: str, target: str, label: str | None=None) -> str
```

Observed calls (lexical order): `Path`, `Path(os.path.relpath(target, Path(from_doc).parent)).as_posix`, `os.path.relpath`, `quote`.

### `doc_for` - L104-L105

```python
doc_for(source: str) -> str
```

Observed calls (lexical order): `Path`, `Path(source).with_suffix`, `str`, `str(Path(source).with_suffix('.md')).replace`.

### `module_name` - L108-L112

```python
module_name(source: str) -> str
```

Observed calls (lexical order): `Path`, `Path(source).with_suffix`, `list`, `parts.pop`, `'.'.join`.

Control points:

- L110: `if parts[-1] == '__init__'`

### `local_imports` - L115-L133

```python
local_imports(tree: ast.AST, name: str, modules: dict[str, str]) -> list[str]
```

Observed calls (lexical order): `set`, `module_name`, `module_name(name).split`, `Path`, `ast.walk`, `isinstance`, `len`, `'.'.join`, `found.add`, `sorted`.

Control points:

- L118: `if Path(name).name != '__init__.py'`
- L120: `for node in ast.walk(tree)`
- L122: `if isinstance(node, ast.Import)`
- L124: `if isinstance(node, ast.ImportFrom)`
- L126: `if node.level`
- L130: `for candidate in names`
- L131: `if candidate in modules and modules[candidate] != name`

### `symbol_nodes` - L136-L152

```python
symbol_nodes(tree: ast.AST) -> list[tuple[str, ast.AST]]
```

Observed calls (lexical order): `collect`.

### `symbol_nodes.collect` - L138-L150

```python
collect(body: list, prefix: str='') -> None
```

Observed calls (lexical order): `isinstance`, `result.append`, `collect`.

Control points:

- L139: `for node in body`
- L140: `if isinstance(node, (ast.ClassDef, ast.FunctionDef, ast.AsyncFunctionDef))`
- L144: `if isinstance(node, (ast.If, ast.Try))`
- L147: `if isinstance(node, ast.Try)`
- L149: `for handler in node.handlers`

### `Behavior` - L155-L190

```python
class Behavior(ast.NodeVisitor)
```

Lexical facts inside one callable; not runtime dispatch or path analysis.

Declared class/data-model fields:

```python
visit_AsyncFunctionDef = visit_FunctionDef
visit_AsyncFor = visit_For
```

### `Behavior.__init__` - L157-L160

```python
__init__(self) -> None
```

### `Behavior.visit_FunctionDef` - L162-L163

```python
visit_FunctionDef(self, node: ast.FunctionDef) -> None
```

### `Behavior.visit_ClassDef` - L167-L168

```python
visit_ClassDef(self, node: ast.ClassDef) -> None
```

### `Behavior.visit_Call` - L170-L172

```python
visit_Call(self, node: ast.Call) -> None
```

Observed calls (lexical order): `ast.unparse`, `self.calls.append`, `short`, `self.generic_visit`.

### `Behavior.visit_If` - L174-L176

```python
visit_If(self, node: ast.If) -> None
```

Observed calls (lexical order): `ast.unparse`, `self.branches.append`, `short`, `self.generic_visit`.

### `Behavior.visit_For` - L178-L180

```python
visit_For(self, node: ast.For) -> None
```

Observed calls (lexical order): `ast.unparse`, `self.branches.append`, `short`, `self.generic_visit`.

### `Behavior.visit_While` - L184-L186

```python
visit_While(self, node: ast.While) -> None
```

Observed calls (lexical order): `ast.unparse`, `self.branches.append`, `short`, `self.generic_visit`.

### `Behavior.visit_Raise` - L188-L190

```python
visit_Raise(self, node: ast.Raise) -> None
```

Observed calls (lexical order): `ast.unparse`, `self.raises.append`, `short`, `self.generic_visit`.

### `unique` - L193-L194

```python
unique(values: list[str]) -> list[str]
```

Observed calls (lexical order): `dict.fromkeys`, `list`.

### `inspect_source` - L197-L238

```python
inspect_source(root: Path, path: Path, modules: dict[str, str]) -> dict
```

Observed calls (lexical order): `path.relative_to`, `path.relative_to(root).as_posix`, `tokenize.open`, `stream.read`, `ast.parse`, `ast.get_docstring`, `short`, `top.split`, `symbol_nodes`, `Behavior`, `isinstance`, `', '.join`, `ast.unparse`, `body.visit`, `symbols.append`, `(ast.get_docstring(node) or '').split`.
Another 11 call expressions are in this source span; the list is intentionally bounded.

Control points:

- L205: `for (label, node) in symbol_nodes(tree)`
- L207: `if isinstance(node, ast.ClassDef)`
- L212: `if node.returns`
- L215: `for stmt in node.body`
- L225: `for node in tree.body`
- L226: `if isinstance(node, (ast.Assign, ast.AnnAssign))`
- L228: `for target in targets`
- L229: `if isinstance(target, ast.Name)`
- Another 2 conditions/loops exist in this source span.

### `render_module` - L241-L298

```python
render_module(info: dict, reverse: dict[str, list[str]]) -> str
```

Observed calls (lexical order): `link`, `safe`, `', '.join`, `doc_for`, `reverse.get`, `x.startswith`, `len`, `inline`, `'; '.join`, `'\n'.join`.

Control points:

- L247: `if info['description']`
- L249: `if not info['symbols'] and (not info['constants']) and (not info['import_statements'])`
- L251: `if not info['symbols']`
- L255: `if info['constants']`
- L257: `if info['import_statements']`
- L259: `if info['imports']`
- L264: `if callers`
- L270: `if len(shown) < len(callers)`
- Another 9 conditions/loops exist in this source span.

### `write_if_changed` - L301-L306

```python
write_if_changed(root: Path, name: str, text: str) -> None
```

Observed calls (lexical order): `path.parent.mkdir`, `text.encode`, `path.is_file`, `path.read_bytes`, `path.write_bytes`.

Control points:

- L305: `if not path.is_file() or path.read_bytes() != data`

### `load_manifest` - L309-L311

```python
load_manifest(root: Path) -> dict
```

Observed calls (lexical order): `json.loads`, `path.exists`, `path.read_text`.

### `tooling` - L314-L316

```python
tooling(root: Path) -> dict[str, str]
```

Observed calls (lexical order): `digest`, `p.relative_to`, `p.relative_to(root).as_posix`, `(root / 'prompt/tools').glob`, `sorted`.

### `build` - L319-L392

```python
build(root: Path, reviewed: list[str]) -> int
```

Observed calls (lexical order): `sources`, `module_name`, `p.relative_to`, `p.relative_to(root).as_posix`, `inspect_source`, `load_manifest`, `old.get`, `set`, `sorted`, `guide_for`, `tooling`, `required.add`, `(root / g).is_file`, `GUIDES.values`, `', '.join`, `ValueError`.
Another 24 call expressions are in this source span; the list is intentionally bounded.

Control points:

- L329: `if old and old.get('tooling') != tooling(root)`
- L332: `if missing_guides`
- L336: `if invalid_review`
- L339: `if old`
- L341: `if pending`
- L348: `for info in infos`
- L349: `for imported in info['imports']`
- L352: `for info in infos`
- Another 6 conditions/loops exist in this source span.

Explicit raises: `ValueError('Missing guides: ' + ', '.join(missing_guides))`; `ValueError('Unknown reviewed guide: ' + ', '.join(sorted(invalid_review)))`.

### `markdown_links` - L395-L409

```python
markdown_links(root: Path, path: Path) -> list[str]
```

Observed calls (lexical order): `path.read_text`, `re.sub`, `re.findall`, `urlsplit`, `(path.parent / unquote(parsed.path)).resolve`, `unquote`, `resolved.is_relative_to`, `root.resolve`, `errors.append`, `path.relative_to`, `resolved.exists`.

Control points:

- L400: `for target in re.findall('(?<!!)\\[[^\\]\\n]*(?<!\\\\)\\]\\(([^\\s)]+)\\)', text)`
- L402: `if parsed.scheme or not parsed.path`
- L405: `if not resolved.is_relative_to(root.resolve())`
- L407: `if not resolved.exists()`

### `check` - L412-L452

```python
check(root: Path) -> int
```

Observed calls (lexical order): `load_manifest`, `ValueError`, `digest`, `p.relative_to`, `p.relative_to(root).as_posix`, `sources`, `manifest.get`, `set`, `sorted`, `errors.append`, `manifest.get('generated_docs', {}).items`, `(root / name).is_file`, `GUIDES.values`, `tooling`, `p.is_file`, `p.suffix.lower`.
Another 11 call expressions are in this source span; the list is intentionally bounded.

Control points:

- L414: `if not manifest`
- L419: `for name in sorted(set(current) | set(saved))`
- L420: `if name not in saved`
- L422: `if name not in current`
- L424: `if current[name] != saved[name]['sha256']`
- L426: `for (name, expected) in manifest.get('generated_docs', {}).items()`
- L427: `if not (root / name).is_file()`
- L429: `if digest(root / name) != expected`
- Another 8 conditions/loops exist in this source span.

Explicit raises: `ValueError('Missing prompt/source_manifest.json; run refresh first.')`.

### `main` - L455-L465

```python
main() -> int
```

Observed calls (lexical order): `argparse.ArgumentParser`, `parser.add_argument`, `parser.parse_args`, `args.root.resolve`, `build`, `check`, `print`.

## Change responsibility

After modifying this Python file, review [prompt/04_LR_IDMS_DB2_CONVERSION.md](../../../../04_LR_IDMS_DB2_CONVERSION.md), update any affected behavioral contracts, then run `python prompt/tools/maintain_docs.py refresh` and `python prompt/tools/maintain_docs.py check` from the repository root. Keep scratch Markdown only in `prompt/temp/`. Generated notes must not be hand-edited; add explanations to the owning guide.
