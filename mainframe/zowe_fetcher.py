# LOCATION: zowe/zowe_fetcher.py
# ACTION: REPLACE ENTIRE FILE
"""Program-driven fetch.

For every program in the selected array:
    1. download the program from the first program library holding it
    2. read its COPY names           -> copybook libraries, in order
    3. derive DCLGEN members         -> DCLGEN libraries
    4. read its subschema name       -> subschema library (production)

Mapping Sheet is local and is never fetched.
"""

from __future__ import annotations

import logging
from pathlib import Path
from collections.abc import Iterable
from typing import TYPE_CHECKING

from mainframe.zowe_libraries import LibrarySearch, application_code
from mainframe.zowe_search_history import SearchAttempt, SearchHistoryRecorder, write_search_history
from mainframe.zowe_resolver import (
    ProgramDependencies, resolve_dependencies, expand_copy_dependencies,
    dclgen_members_for_record,
)
from mainframe.zowe_rules import (
    ARTIFACT_COPYBOOK,
    ARTIFACT_DCLGEN,
    ARTIFACT_EXTENSIONS,
    ARTIFACT_LABELS,
    ARTIFACT_PROGRAM,
    ARTIFACT_SUBSCHEMA,
    DIAG_APPLICATION_TEMPLATE,
    DIAG_DEPENDENCIES_TEMPLATE,
    DIAG_DERIVED_DCLGEN_TEMPLATE,
    DIAG_END_FETCH,
    DIAG_FOUND_TEMPLATE,
    DIAG_LIBRARY_ORDER_TEMPLATE,
    DIAG_MAPPING_LOCAL,
    DIAG_NOT_FOUND_TEMPLATE,
    DIAG_PROGRAM_LIST_TEMPLATE,
    DIAG_START_FETCH,
    DIAG_SUBSCHEMA_DETECTED_TEMPLATE,
    DIAG_TOTAL_TEMPLATE,
    TEXT_ENCODING,
    ZOWE_ERROR_MESSAGES,
    ZOWE_WARNING_MESSAGES,
)
from mainframe.zowe_workspace import (
    copybook_dir,
    dclgen_dir,
    ensure_workspace,
    program_dir,
    subschema_dir,
)
from mainframe.zowe_rules import DIAG_ELEMENTS_TEMPLATE, DIAG_NO_ELEMENTS_TEMPLATE

if TYPE_CHECKING:
    from mainframe.zowe_manifest import InventoryRow

logger = logging.getLogger("idms_db2_zowe")

_LANDING = {
    ARTIFACT_PROGRAM: program_dir,
    ARTIFACT_COPYBOOK: copybook_dir,
    ARTIFACT_DCLGEN: dclgen_dir,
    ARTIFACT_SUBSCHEMA: subschema_dir,
}


class ZoweFetcher:
    def __init__(self, programs: list[str] | None = None) -> None:
        from mainframe.zowe_programs import selected_programs

        selected = selected_programs() if programs is None else programs
        self.programs = list(dict.fromkeys(str(name).strip().upper() for name in selected if str(name).strip()))
        if not self.programs:
            raise ValueError("No programs selected for fetch")
        self.diagnostics: list[str] = []
        self.warnings: list[str] = []
        self.saved: dict[str, list[Path]] = {}
        self._searches: dict[str, LibrarySearch] = {}
        self._member_paths: dict[tuple[str, str], Path] = {}
        self._observations: dict[tuple[str, str], str] = {}
        self._source_texts: dict[str, str] = {}
        self._copy_sources: dict[str, list[tuple[str, str]]] = {}
        self._active_program = ""
        self._member_attempts: dict[tuple[str, str], tuple[SearchAttempt, ...]] = {}
        self.search_history = SearchHistoryRecorder()

    # ---- helpers ----
    def _search(self, artifact: str) -> LibrarySearch:
        if artifact not in self._searches:
            search = LibrarySearch(artifact=artifact)
            self._searches[artifact] = search
            self.diagnostics.append(
                DIAG_LIBRARY_ORDER_TEMPLATE.format(
                    label=search.label, libraries=", ".join(search.libraries)
                )
            )
        return self._searches[artifact]

    def _save(self, artifact: str, member: str, dataset: str, content: bytes) -> Path:
        folder = _LANDING[artifact]()
        folder.mkdir(parents=True, exist_ok=True)
        target = folder / f"{member}{ARTIFACT_EXTENSIONS[artifact]}"
        target.write_bytes(content)
        self._member_paths[(artifact, member)] = target
        self._observations[(artifact, member)] = f"Fetched from {dataset}({member})"
        self.saved.setdefault(ARTIFACT_LABELS[artifact], []).append(target)
        self.diagnostics.append(
            DIAG_FOUND_TEMPLATE.format(
                label=ARTIFACT_LABELS[artifact],
                member=member,
                dataset=dataset,
                path=target,
            )
        )
        return target

    def _fetch_member(self, artifact: str, member: str, mandatory: bool) -> bool:
        # Shared dependencies are downloaded once per batch, but recorded for
        # every program that needs them. Never trust a stale local file after
        # a failed current download.
        key = (artifact, member)
        if key in self._observations:
            self.search_history.record(self._active_program, artifact, member,
                                       self._member_attempts.get(key, ()), cached=True)
            found = key in self._member_paths
            if mandatory and not found:
                raise ValueError(f"Required member unavailable: {member}")
            return found
        try:
            search = self._search(artifact)
        except Exception as exc:
            self.search_history.record(self._active_program, artifact, member, (
                SearchAttempt("", "Not Searched", f"{type(exc).__name__}: no usable library configuration; lookup not started."),
            ))
            raise
        try:
            dataset, content = search.download(member)
        finally:
            # Even an interrupted/failed download retains attempts already made.
            trace = tuple(getattr(search, "search_history", {}).get(member, ()))
            self._member_attempts[key] = trace
            self.search_history.record(self._active_program, artifact, member, trace)

        if not dataset:
            libraries = ", ".join(search.libraries)
            self._observations[key] = f"WARNING: not fetched from {libraries}"
            self.diagnostics.append(
                DIAG_NOT_FOUND_TEMPLATE.format(
                    label=search.label, member=member, libraries=libraries
                )
            )
            message = (
                ZOWE_ERROR_MESSAGES["program_not_found"]
                if mandatory
                else ZOWE_WARNING_MESSAGES["member_not_found"]
            )
            formatted = message.format(
                label=search.label, member=member, libraries=libraries
            )
            if mandatory:
                raise ValueError(formatted)
            self.warnings.append(formatted)
            return False

        try:
            self._save(artifact, member, dataset, content)
        except Exception as exc:
            self.search_history.issue(
                self._active_program, artifact, member, f"{dataset}({member})",
                f"{type(exc).__name__}: content retrieved but local save failed; member is not usable.",
            )
            raise
        return True

    # ---- one program ----
    def _fetch_program(self, program: str) -> ProgramDependencies:
        search = self._search(ARTIFACT_PROGRAM)
        dataset, content = search.download(program)
        if not dataset:
            raise ValueError(
                ZOWE_ERROR_MESSAGES["program_not_found"].format(
                    member=program, libraries=", ".join(search.libraries)
                )
            )

        path = self._save(ARTIFACT_PROGRAM, program, dataset, content)
        source_text = path.read_text(encoding=TEXT_ENCODING)
        self._source_texts[program] = source_text

        deps = resolve_dependencies(program, source_text)
        self.diagnostics.append(
            DIAG_DEPENDENCIES_TEMPLATE.format(
                program=program,
                copybooks=len(deps.copybooks),
                records=len(deps.records),
                subschema=deps.subschema or "(none)",
            )
        )
        return deps

    def _fetch_dependencies(self, deps: ProgramDependencies) -> None:
        def load_copy(member: str) -> str | None:
            if not self._fetch_member(ARTIFACT_COPYBOOK, member, mandatory=False):
                return None
            path = self._member_paths[(ARTIFACT_COPYBOOK, member)]
            try:
                return path.read_text(encoding=TEXT_ENCODING)
            except (OSError, UnicodeError) as exc:
                trace = self._member_attempts.get((ARTIFACT_COPYBOOK, member), ())
                self.search_history.issue(
                    deps.program, ARTIFACT_COPYBOOK, member,
                    trace[-1].library_path if trace else "",
                    f"{type(exc).__name__}: downloaded copybook cannot be read for dependency/mode analysis.",
                )
                self._observations[(ARTIFACT_COPYBOOK, member)] += (
                    "; WARNING: downloaded content cannot be analysed"
                )
                self.warnings.append(f"Copybook {member} cannot be analysed for dependencies/mode")
                return None

        self._copy_sources[deps.program] = expand_copy_dependencies(deps, load_copy)
        subschema_path = None
        if deps.subschema:
            self.diagnostics.append(
                DIAG_SUBSCHEMA_DETECTED_TEMPLATE.format(
                    program=deps.program, subschema=deps.subschema
                )
            )
            if self._fetch_member(ARTIFACT_SUBSCHEMA, deps.subschema, False):
                subschema_path = self._member_paths[(ARTIFACT_SUBSCHEMA, deps.subschema)]
        # No declared subschema means a blank inventory cell and no schema
        # lookup/history row. Incomplete COPY discovery is noted by the inventory.

        # Replace raw LR-name guesses with the actual subschema element members.
        members = list(deps.explicit_dclgens)
        for record in deps.records:
            for member in self._dclgen_members(record, subschema_path):
                self.diagnostics.append(DIAG_DERIVED_DCLGEN_TEMPLATE.format(record=record, member=member))
                if member not in members:
                    members.append(member)
        deps.dclgens = members
        for member in deps.dclgens:
            self._fetch_member(ARTIFACT_DCLGEN, member, mandatory=False)

    def _dclgen_members(self, record: str, subschema_path) -> list[str]:
        from mainframe.zowe_subschema import element_records_for

        elements = []
        if subschema_path is not None:
            elements = element_records_for(subschema_path, record)

        if elements:
            self.diagnostics.append(
                DIAG_ELEMENTS_TEMPLATE.format(
                    lr=record, elements=", ".join(elements)
                )
            )
        else:
            self.diagnostics.append(
                DIAG_NO_ELEMENTS_TEMPLATE.format(lr=record)
            )
            elements = [record]

        return dclgen_members_for_record(record, subschema_path)

    # ---- all programs ----
    def fetch_all(self) -> dict:
        from mainframe.zowe_manifest import HEADERS, InventoryRow, make_inventory_row

        self.diagnostics.clear()
        self.warnings.clear()
        ensure_workspace()
        self.diagnostics.append(DIAG_START_FETCH)
        self.diagnostics.append(DIAG_MAPPING_LOCAL)
        self.diagnostics.append(
            DIAG_APPLICATION_TEMPLATE.format(application=application_code())
        )
        self.diagnostics.append(
            DIAG_PROGRAM_LIST_TEMPLATE.format(
                count=len(self.programs), names=", ".join(self.programs)
            )
        )

        # Reset run-local caches when one fetcher object is reused.
        self._member_paths.clear()
        self._observations.clear()
        self._source_texts.clear()
        self._copy_sources.clear()
        self._member_attempts.clear()
        self._searches.clear()
        self.search_history = SearchHistoryRecorder()
        self.saved.clear()
        inventory = {name: InventoryRow(name, notes={
            HEADERS[0]: "WARNING: selected but not attempted in this fetch run.",
            HEADERS[4]: "WARNING: current source not analysed.",
        }) for name in self.programs}
        try:
            for program in self.programs:
                self._active_program = program
                deps = None
                try:
                    deps = self._fetch_program(program)
                    self._fetch_dependencies(deps)
                    inventory[program] = make_inventory_row(
                        deps, self._source_texts[program],
                        source_path=Path("Program") / f"{program}{ARTIFACT_EXTENSIONS[ARTIFACT_PROGRAM]}",
                        copy_sources=self._copy_sources.get(program, ()),
                        observations=self._observations,
                        origin=self._observations.get((ARTIFACT_PROGRAM, program), "Zowe fetch"),
                    )
                except Exception as exc:
                    # Do not retain a misleading successful row from an older run.
                    # Store the exception class, not raw transport text/credentials.
                    inventory[program] = InventoryRow(
                        program, list(deps.copybooks) if deps else [],
                        list(deps.dclgens) if deps else [], deps.subschema if deps else "",
                        notes={HEADERS[0]: f"WARNING: fetch incomplete ({type(exc).__name__}). See fetch diagnostics.",
                               HEADERS[4]: "WARNING: current fetch failed; mode not certified."},
                    )
                    raise
        except Exception:
            # A report failure must not hide the original fetch exception.
            try:
                self._publish_reports(inventory.values())
            except Exception as report_error:
                logger.error("Could not save one or more partial fetch reports (%s)", type(report_error).__name__)
            raise
        inventory_result, history_result = self._publish_reports(inventory.values())
        inventory_path, inventory_count = inventory_result
        history_path, history_count = history_result
        self.diagnostics.append(f"Dependency search history: {history_path} ({history_count} observations)")
        self.diagnostics.append(f"Program inventory: {inventory_path} ({inventory_count} programs)")

        total = sum(len(v) for v in self.saved.values())
        self.diagnostics.append(
            DIAG_TOTAL_TEMPLATE.format(count=total, artifacts=len(self.saved))
        )
        self.diagnostics.append(DIAG_END_FETCH)

        return {
            "fetched": self.saved,
            "total_files": total,
            "diagnostics": self.diagnostics,
            "warnings": self.warnings,
            "inventory_path": inventory_path,
            "inventory_programs": inventory_count,
            "search_history_path": history_path,
            "search_history_rows": history_count,
            "search_run_id": self.search_history.run_id,
        }

    def _publish_reports(
        self, inventory: Iterable[InventoryRow],
    ) -> tuple[tuple[Path, int], tuple[Path, int]]:
        """Try both durable reports independently; never hide a report failure."""
        from mainframe.zowe_manifest import write_inventory

        results: list[tuple[Path, int]] = []
        failures: list[Exception] = []
        for kind, writer in (
            ("inventory", lambda: write_inventory(inventory)),
            ("search history", lambda: write_search_history(self.search_history.rows)),
        ):
            try:
                results.append(writer())
            except Exception as exc:
                failures.append(exc)
                logger.error("Could not publish %s (%s)", kind, type(exc).__name__)
        if failures:
            raise RuntimeError("Fetch report publication failed; inspect the chained error and report diagnostics. Failed workbooks were not replaced.") from failures[0]
        return results[0], results[1]


def fetch_zowe_inputs(source_text: str = "") -> dict:  # noqa: ARG001
    return ZoweFetcher().fetch_all()