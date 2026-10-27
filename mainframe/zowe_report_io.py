"""Shared, local-only locking and atomic publication for fetch workbooks."""
from __future__ import annotations

from contextlib import contextmanager
import os
from pathlib import Path
import tempfile
from collections.abc import Iterator
from typing import Any


@contextmanager
def report_lock(path: Path) -> Iterator[None]:
    """Refuse concurrent writers/symlink destinations; never replace on failure."""
    path = Path(path)
    if path.is_symlink() or path.parent.is_symlink():
        raise ValueError(f"Refusing a report symlink: {path}")
    path.parent.mkdir(parents=True, exist_ok=True)
    lock = path.with_suffix(path.suffix + ".lock")
    try:
        descriptor = os.open(lock, os.O_CREAT | os.O_EXCL | os.O_WRONLY, 0o600)
    except FileExistsError as exc:
        raise RuntimeError(f"Report is being written: {lock}. Do not run parallel fetches.") from exc
    try:
        os.close(descriptor)
        yield
    finally:
        lock.unlink(missing_ok=True)


def atomic_save_workbook(book: Any, path: Path) -> None:
    """Publish a completed workbook on the same filesystem, retaining old bytes."""
    temporary: Path | None = None
    try:
        with tempfile.NamedTemporaryFile(dir=path.parent, prefix=".report_",
                                         suffix=".xlsx", delete=False) as stream:
            temporary = Path(stream.name)
        book.save(temporary)
        with temporary.open("rb") as stream:
            os.fsync(stream.fileno())
        os.replace(temporary, path)
    finally:
        if temporary is not None:
            temporary.unlink(missing_ok=True)
