# knowledge_core.py

Source: [Python](../../tools/knowledge_core.py); SHA-256 `fc76022ac8f8fa43b43920fa931ebd00f3638fe4a5cc551dee73c6d5e3df486c`.
Owning guide: [contract](../01_ARCHITECTURE_AND_CONTRACTS.md).

Immutable input identities, explicit program registration and bounded evidence.

Owned by prompt/system2/01_ARCHITECTURE_AND_CONTRACTS.md. No converter imports.
All paths are workspace-relative. Original inputs are never rewritten.

## Symbols

### hash_bytes (L47-L48)

```python
hash_bytes(data: bytes)
```

Read the owning guide and this source span for the actual contract.

### hash_json (L51-L52)

```python
hash_json(data: Any)
```

Read the owning guide and this source span for the actual contract.

### file_hash (L55-L60)

```python
file_hash(path: Path)
```

Read the owning guide and this source span for the actual contract.

### safe_path (L63-L74)

```python
safe_path(root: Path, name: str, *, exists: bool=False)
```

Read the owning guide and this source span for the actual contract.

### write_text (L77-L92)

```python
write_text(root: Path, name: str, content: str)
```

Read the owning guide and this source span for the actual contract.

### write_json (L95-L96)

```python
write_json(root: Path, name: str, data: Any)
```

Read the owning guide and this source span for the actual contract.

### read_json (L99-L100)

```python
read_json(root: Path, name: str)
```

Read the owning guide and this source span for the actual contract.

### tool_fingerprint (L103-L104)

```python
tool_fingerprint()
```

Read the owning guide and this source span for the actual contract.

### descriptor (L107-L112)

```python
descriptor(value: str | dict, role: str)
```

Read the owning guide and this source span for the actual contract.

### load_config (L115-L154)

```python
load_config(root: Path, name: str=DEFAULT_CONFIG)
```

Read the owning guide and this source span for the actual contract.

### program_specs (L157-L172)

```python
program_specs(config: dict, program: dict, track: str)
```

Read the owning guide and this source span for the actual contract.

### load_artifact (L175-L206)

```python
load_artifact(root: Path, spec: dict)
```

Read the owning guide and this source span for the actual contract.

### engine_identity (L209-L220)

```python
engine_identity(root: Path)
```

Read the owning guide and this source span for the actual contract.

### analyze_inputs (L223-L264)

```python
analyze_inputs(root: Path, config: dict, program: dict, track: str, engine: dict | None=None)
```

Read the owning guide and this source span for the actual contract.

### current_analysis (L267-L270)

```python
current_analysis(root: Path, program_id: str, track: str)
```

Read the owning guide and this source span for the actual contract.

### artifact_text (L273-L279)

```python
artifact_text(root: Path, item: dict)
```

Read the owning guide and this source span for the actual contract.

### ev (L282-L283)

```python
ev(item: dict, start: int, end: int | None=None)
```

Read the owning guide and this source span for the actual contract.

### csv_register (L286-L307)

```python
csv_register(root: Path, csv_path: str, config_path: str, expected: int, metadata: list[dict] | None=None)
```

Read the owning guide and this source span for the actual contract.

## Update rule

Change the owning guide together with this source; refresh these generated notes instead of hand-editing them. Scratch Markdown goes only in prompt/temp/. Existing engine source notes are maintained separately by maintain_docs.py.
