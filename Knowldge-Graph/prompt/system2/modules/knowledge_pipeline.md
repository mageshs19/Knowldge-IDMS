# knowledge_pipeline.py

Source: [Python](../../tools/knowledge_pipeline.py); SHA-256 `94c0d04c729434f48e50a2e900097365d1c3e96717298447a5923dba027c89c5`.
Owning guide: [contract](../06_RUNBOOK.md).

System 2 evidence collection and System 1 knowledge handoff.

Python standard library only. Run from the copied workspace root. This CLI does
not call an AI API, prove equivalence, or grant production approval.

## Symbols

### inventory (L29-L59)

```python
inventory(root: Path, source: str, manual: str, generated: str, encoding: str, source_format: str)
```

Read the owning guide and this source span for the actual contract.

### build (L62-L82)

```python
build(root: Path, config: dict, selected: list[dict], tracks: list[str])
```

Read the owning guide and this source span for the actual contract.

### verify (L85-L101)

```python
verify(root: Path, config: dict)
```

Read the owning guide and this source span for the actual contract.

### parse_args (L104-L151)

```python
parse_args()
```

Read the owning guide and this source span for the actual contract.

### main (L154-L210)

```python
main()
```

Read the owning guide and this source span for the actual contract.

## Update rule

Change the owning guide together with this source; refresh these generated notes instead of hand-editing them. Scratch Markdown goes only in prompt/temp/. Existing engine source notes are maintained separately by maintain_docs.py.
