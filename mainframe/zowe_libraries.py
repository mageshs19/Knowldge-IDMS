# LOCATION: zowe/zowe_libraries.py
# ACTION: REPLACE ENTIRE FILE
"""Member lookup across an ordered library list.

A member is taken from the FIRST library that holds it.

The lookup PROBES the member directly rather than listing the library.
A library larger than the z/OSMF item limit truncates its member list,
and a truncated list is indistinguishable from a missing member.
"""

from __future__ import annotations

import logging
from dataclasses import dataclass, field

import requests

from mainframe.zowe_client import ZoweClient
from mainframe.zowe_rules import ARTIFACT_LABELS
from mainframe.zowe_search_history import SearchAttempt, http_attempt, exception_attempt
from mainframe.zowe_settings import (
    ZoweConnection,
    application_code,
    artifact_connection,
    expand,
    require_libraries,
)

logger = logging.getLogger("idms_db2_zowe")

__all__ = [
    "LibrarySearch",
    "application_code",
    "expand",
    "libraries_for",
]


def libraries_for(artifact: str) -> list[str]:
    return list(require_libraries(artifact))


@dataclass
class LibrarySearch:
    """Searches one artifact's libraries, member by member."""

    artifact: str
    label: str = ""
    libraries: list[str] = field(default_factory=list)
    _client: ZoweClient | None = None
    # member -> ordered HTTP statuses for the most recent search, including success
    attempts: dict[str, dict[str, int]] = field(default_factory=dict)
    search_history: dict[str, list[SearchAttempt]] = field(default_factory=dict)

    def __post_init__(self) -> None:
        self.label = self.label or ARTIFACT_LABELS[self.artifact]
        if not self.libraries:
            self.libraries = libraries_for(self.artifact)

    @property
    def client(self) -> ZoweClient:
        if self._client is None:
            connection: ZoweConnection = artifact_connection(self.artifact)
            self._client = ZoweClient(connection, self.artifact, self.label)
        return self._client

    def _lookup(self, member: str, *, probe: bool = False) -> tuple[str, bytes]:
        """Keep every tried library, even when a later library succeeds.

        Do not serialize exception strings: request errors can contain endpoints,
        credentials or response bodies. Typed diagnostics are sufficient here.
        """
        wanted = str(member or "").strip().upper()
        if not wanted:
            return "", b""
        statuses: dict[str, int] = {}
        trace: list[SearchAttempt] = []
        self.attempts[wanted] = statuses
        self.search_history[wanted] = trace
        for dataset in self.libraries:
            try:
                if probe:
                    found, status = self.client.member_exists(dataset, wanted)
                    content = b""
                else:
                    content, status = self.client.fetch_member(dataset, wanted)
                    found = status == 200
            except Exception as exc:
                statuses[dataset] = -1
                trace.append(exception_attempt(dataset, wanted, exc))
                logger.warning("%s lookup failed on %s (%s)", self.label, dataset, type(exc).__name__)
                if isinstance(exc, (requests.RequestException, ValueError)):
                    continue
                raise
            statuses[dataset] = status
            trace.append(http_attempt(dataset, wanted, status, probe=probe))
            if found:
                return dataset, content
        return "", b""

    def locate(self, member: str) -> str:
        """First library holding the member, or an empty string."""
        return self._lookup(member, probe=True)[0]

    def download(self, member: str) -> tuple[str, bytes]:
        """(dataset, content); complete attempt evidence is in search_history."""
        return self._lookup(member)

    def why_not_found(self, member: str) -> str:
        """Per-library HTTP status for the most recent lookup."""
        statuses = self.attempts.get(str(member or "").strip().upper(), {})
        if not statuses:
            return ", ".join(self.libraries)
        return ", ".join(
            f"{dataset} (HTTP {status})" for dataset, status in statuses.items()
        )

    def list_members(self, dataset: str) -> list[str]:
        """Diagnostic only. Never used for lookup."""
        return self.client.list_members(expand(dataset))