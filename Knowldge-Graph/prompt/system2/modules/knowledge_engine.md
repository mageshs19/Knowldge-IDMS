# knowledge_engine.py

Source: [Python](../../tools/knowledge_engine.py); SHA-256 `7f042c981d86275fde43f9b505ac67230f573f0e53ed3712834dfb920d5d4448`.
Owning guide: [contract](../06_RUNBOOK.md).

Optional frozen-engine adapter: isolated copies, convert -> review only.

This is filesystem isolation for trusted project code, NOT an OS security sandbox.
No fetch, upload, package installation, generated-source patching, or credential
copying is performed by this adapter. See the System 2 runbook.

## Symbols

### run_engine (L25-L199)

```python
run_engine(root: Path, config: dict, config_name: str, engine_root: Path, programs: list[dict], execute: bool, timeout: int, python: str)
```

Read the owning guide and this source span for the actual contract.

## Update rule

Change the owning guide together with this source; refresh these generated notes instead of hand-editing them. Scratch Markdown goes only in prompt/temp/. Existing engine source notes are maintained separately by maintain_docs.py.
