# LOCATION: zowe/zowe_resolver.py
# ACTION: REPLACE ENTIRE FILE
"""Works out what ONE IDMS program needs.

CORRECTION - every dependency was invisible

The patterns were anchored at the start of the physical line, but a
mainframe source member is FIXED FORMAT:

    001234     COPY VMBZ270I.                              01234000
    |----|     |----------------------------------------|  |------|
    cols 1-6   cols 8-72 body                              cols 73-80

so "^\\s*COPY" never matched and the program reported zero copybooks
and no subschema. Every line is now reduced to its BODY before any
pattern is applied, and comment lines (indicator * or / in column 7)
are dropped.
"""

from __future__ import annotations

from dataclasses import dataclass, field
from collections.abc import Callable
from pathlib import Path
import re

from mainframe.zowe_patterns import (
    COPY_IDMS_RECORD_PATTERN,
    COPY_IDMS_LR_PATTERN,
    FETCH_COPY_PATTERN,
    FETCH_SQL_INCLUDE_PATTERN,
    DB_WITHIN_PATTERN,
    FIXED_SEQUENCE_PATTERN,
    IDMS_VERB_RECORD_PATTERN,
    RECORD_VERSION_SUFFIX_PATTERN,
)
from mainframe.zowe_rules import (
    BODY_END_COLUMN,
    BODY_START_COLUMN,
    COMMENT_INDICATORS,
    DCLGEN_MEMBER_TEMPLATE,
    DCLGEN_PREFIX,
    DCLGEN_RECORD_TAIL_LENGTH,
    DCLGEN_SUFFIX,
    INDICATOR_COLUMN,
)

# Verb operands that are never record names. FFRECAB is a restart control
# structure, not a data table: it must never generate a DCLGEN.
_NOT_A_RECORD = {
    "CURRENT", "WITHIN", "USING", "SET", "AREA", "RECORD",
    "DB", "IDMS", "ALL", "SELECTIVE", "NEXT", "FIRST", "LAST",
    "FFRECAB",
}


def logical_body(line: str) -> str:
    """Remove fixed sequence/indicator areas and non-executable comments.

    Numeric or blank sequence areas are supported. Unframed free-format lines
    retain all columns. Debug indicator D is not active source for this report.
    """
    text = str(line or "").rstrip("\r\n")
    if not text.strip():
        return ""
    fixed = bool(FIXED_SEQUENCE_PATTERN.match(text))
    blank_sequence = (len(text) >= 7 and text[:6] == " " * 6
                      and text[6] in " */-Dd"
                      and (len(text) <= 72 or text[72:80].isdigit()
                           or not text[72:].strip()))
    if fixed or blank_sequence:
        indicator = text[INDICATOR_COLUMN] if len(text) > INDICATOR_COLUMN else " "
        if indicator in (*COMMENT_INDICATORS, "D", "d"):
            return ""
        return text[BODY_START_COLUMN:BODY_END_COLUMN].rstrip()
    if text.lstrip().startswith(("*", "/")):
        return ""
    return text.rstrip()


def logical_text(source_text: str) -> str:
    """Executable source bodies with inline comments removed, literals intact."""
    out: list[str] = []
    quote = ""
    identification = False
    for raw in str(source_text or "").splitlines():
        body = logical_body(raw)
        # AUTHOR and other Identification Division comment-entries may contain
        # unmatched apostrophes (for example a surname). They are not literals.
        if re.match(r"\s*(?:IDENTIFICATION|ID)\s+DIVISION\b", body, re.I):
            identification = True
        elif re.match(r"\s*(?:ENVIRONMENT|DATA|PROCEDURE)\s+DIVISION\b", body, re.I):
            identification = False
            quote = ""
        if identification:
            out.append("")
            continue
        if quote and len(raw) > 6 and raw[6] == "-":
            # The leading quote on a fixed-format literal continuation resumes
            # the existing literal; it does not terminate it.
            leading = len(body) - len(body.lstrip())
            if body[leading:leading + 1] == quote:
                body = body[:leading] + " " + body[leading + 1:]
        i = 0
        while i < len(body):
            char = body[i]
            if quote:
                if char == quote:
                    if i + 1 < len(body) and body[i + 1] == quote:
                        i += 2
                        continue
                    quote = ""
            elif char in "\"'":
                quote = char
            elif body[i:i + 2] == "*>":
                body = body[:i]
                break
            i += 1
        out.append(body)
    return "\n".join(out)


def mask_literals(text: str) -> str:
    """Mask quoted contents without moving line/character offsets."""
    chars = list(text)
    quote = ""
    i = 0
    while i < len(chars):
        char = text[i]
        if quote:
            if char != "\n":
                chars[i] = " "
            if char == quote:
                if i + 1 < len(chars) and text[i + 1] == quote:
                    chars[i + 1] = " "
                    i += 2
                    continue
                quote = ""
        elif char in "\"'":
            quote = char
            chars[i] = " "
        i += 1
    return "".join(chars)


def base_record_name(record: str) -> str:
    """VMBTL03-R01 -> VMBTL03. A view suffix is not part of the name."""
    name = str(record or "").strip().upper()
    return RECORD_VERSION_SUFFIX_PATTERN.sub("", name)


def dclgen_member_for(record: str) -> str:
    """VMBEVEF -> DZEVEFTV,  VMBTL03-R01 -> DZTL03TV"""
    name = base_record_name(record).replace("-", "")
    if len(name) < DCLGEN_RECORD_TAIL_LENGTH:
        return ""
    return DCLGEN_MEMBER_TEMPLATE.format(
        prefix=DCLGEN_PREFIX,
        tail=name[-DCLGEN_RECORD_TAIL_LENGTH:],
        suffix=DCLGEN_SUFFIX,
    )


@dataclass
class ProgramDependencies:
    program: str = ""
    copybooks: list[str] = field(default_factory=list)
    records: list[str] = field(default_factory=list)
    dclgens: list[str] = field(default_factory=list)
    subschema: str = ""
    explicit_dclgens: list[str] = field(default_factory=list)


def _unique(values) -> list[str]:
    out: list[str] = []
    for value in values:
        name = str(value or "").strip().upper()
        if name and name not in out:
            out.append(name)
    return out


def resolve_dependencies(program: str, source_text: str) -> ProgramDependencies:
    original = logical_text(source_text)
    text = mask_literals(original)

    # Quoted member names are allowed, but COPY text inside a literal is not.
    copybooks = _unique(
        match.group("member") for match in FETCH_COPY_PATTERN.finditer(original)
        if text[match.start():match.end()].lstrip().upper().startswith("COPY")
    )
    explicit = _unique(
        match.group("member") for match in FETCH_SQL_INCLUDE_PATTERN.finditer(original)
        if text[match.start():match.end()].lstrip().upper().startswith("EXEC")
        and match.group("member").upper() not in {"SQLCA", "SQLDA", "SQLERRWS", "SQLERROR"}
    )

    records = _unique(
        match.group("record") for match in COPY_IDMS_RECORD_PATTERN.finditer(text)
    )
    for match in COPY_IDMS_LR_PATTERN.finditer(text):
        name = match.group("lr").strip().upper()
        if name not in records:
            records.append(name)
    for match in IDMS_VERB_RECORD_PATTERN.finditer(text):
        name = match.group("record").strip().upper()
        if name and name not in _NOT_A_RECORD and name not in records:
            records.append(name)

    subschema = ""
    match = DB_WITHIN_PATTERN.search(text)
    if match:
        subschema = match.group("subschema").strip().upper()

    dclgens = _unique([*(dclgen_member_for(record) for record in records), *explicit])

    return ProgramDependencies(
        program=str(program or "").strip().upper(),
        copybooks=copybooks,
        records=records,
        dclgens=dclgens,
        subschema=subschema,
        explicit_dclgens=explicit,
    )


def expand_copy_dependencies(
    deps: ProgramDependencies, load: Callable[[str], str | None],
) -> list[tuple[str, str]]:
    """Expand ordinary COPY references once per member, including cycles.

    The loader owns transport and diagnostics. None means unavailable; the
    dependency stays in the inventory. COPY REPLACING does not remove a
    member dependency, but this scan does not claim full preprocessor expansion.
    """
    fragments: list[tuple[str, str]] = []
    visited: set[str] = set()
    index = 0
    while index < len(deps.copybooks):
        member = deps.copybooks[index]
        index += 1
        if member in visited:
            continue
        visited.add(member)
        if len(visited) > 10000:
            raise ValueError("COPY dependency closure exceeds 10000 members")
        source = load(member)
        if source is None:
            continue
        fragments.append((member, source))
        child = resolve_dependencies(member, source)
        deps.copybooks = _unique([*deps.copybooks, *child.copybooks])
        deps.records = _unique([*deps.records, *child.records])
        deps.explicit_dclgens = _unique([*deps.explicit_dclgens, *child.explicit_dclgens])
        if child.subschema:
            if deps.subschema and deps.subschema != child.subschema:
                raise ValueError("Conflicting subschemas in program/COPY dependency closure")
            deps.subschema = child.subschema
    return fragments


def dclgen_members_for_record(record: str, subschema_path: Path | None) -> list[str]:
    """Same LR element resolution for live fetch and offline inventories."""
    from mainframe.zowe_subschema import element_records_for
    elements = element_records_for(subschema_path, record) if subschema_path else []
    return _unique(dclgen_member_for(element) for element in (elements or [record]))
