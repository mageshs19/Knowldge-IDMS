# knowledge_docs.py

Source: [Python](../../tools/knowledge_docs.py); SHA-256 `9e11b642d26068645714592e54a81ca7474fbc04708ebe199bf80aa080b5b738`.
Owning guide: [contract](../01_ARCHITECTURE_AND_CONTRACTS.md).

Maintain the System 2 tooling notes; no engine import or code execution.

Update owning guides when behavior changes, then refresh. This tool checks source
and doc freshness, not whether prose fully proves the implementation correct.

## Symbols

### refresh (L33-L62)

```python
refresh(root: Path, reviewed: list[str])
```

Read the owning guide and this source span for the actual contract.

### check (L65-L77)

```python
check(root: Path)
```

Read the owning guide and this source span for the actual contract.

### main (L80-L92)

```python
main()
```

Read the owning guide and this source span for the actual contract.

## Update rule

Change the owning guide together with this source; refresh these generated notes instead of hand-editing them. Scratch Markdown goes only in prompt/temp/. Existing engine source notes are maintained separately by maintain_docs.py.
