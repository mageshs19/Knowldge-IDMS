"""Independent, deliberately partial COBOL evidence inventory for System 2.

No converter imports. Inventories are navigation evidence, not compiler results,
full COBOL parsing, a complete CFG, or proof of business equivalence.
"""
from __future__ import annotations

import re
from collections import Counter

VERSION = "1.0"
WORD = r"[A-Z0-9][A-Z0-9_-]*"
LITERAL = re.compile(r"'(?:''|[^'])*'|\"(?:\"\"|[^\"])*\"")
VERBS = {
    "ACCEPT", "ADD", "ALTER", "CALL", "CANCEL", "CLOSE", "COMMIT", "COMPUTE",
    "CONNECT", "CONTINUE", "DELETE", "DISCONNECT", "DISPLAY", "DIVIDE", "ELSE",
    "END-IF", "END-EVALUATE", "END-PERFORM", "END-READ", "END-WRITE", "ERASE",
    "EVALUATE", "EXIT", "FIND", "FINISH", "GET", "GO", "GOBACK", "IF",
    "INITIALIZE", "INSPECT", "MODIFY", "MOVE", "MULTIPLY", "OBTAIN", "OPEN",
    "PERFORM", "READ", "READY", "RELEASE", "RETURN", "REWRITE", "ROLLBACK",
    "RUN", "SET", "SORT", "START", "STOP", "STORE", "STRING", "SUBTRACT",
    "UNSTRING", "WHEN", "WRITE", "BIND", "IF-NOT-FOUND", "IF-FOUND",
}
INLINE_PERFORM = {"UNTIL", "VARYING", "WITH", "TEST", "TIMES"}
DATA = re.compile(r"^\s*(\d{1,2})\s+(" + WORD + r")\b(.*)", re.I)


def mask_literals(text: str) -> str:
    return LITERAL.sub(lambda m: " " * len(m.group()), text)


def canonical(text: str) -> str:
    """Normalize nonliteral whitespace/case; never alter literal contents."""
    parts, pos = [], 0
    for m in LITERAL.finditer(text):
        parts.extend((re.sub(r"\s+", " ", text[pos:m.start()]).upper(), m.group()))
        pos = m.end()
    parts.append(re.sub(r"\s+", " ", text[pos:]).upper())
    return "".join(parts).strip()


def source_lines(text: str, source_format: str = "fixed") -> list[dict]:
    if source_format not in {"fixed", "free"}:
        raise ValueError("Source format must explicitly be fixed or free")
    result = []
    for n, raw in enumerate(text.splitlines(), 1):
        indicator = raw[6:7] if source_format == "fixed" else ""
        comment = indicator in {"*", "/"} if source_format == "fixed" else raw.lstrip().startswith("*>")
        body = raw[7:72] if source_format == "fixed" else raw
        # Inline comments outside string literals only.
        marker = mask_literals(body).find("*>")
        if marker >= 0:
            body = body[:marker]
        result.append({"line": n, "body": body.rstrip(), "comment": comment,
                       "indicator": indicator, "debug": indicator.upper() == "D",
                       "continuation": indicator == "-"})
    return result


def split_list(value: str) -> list[str]:
    """Top-level comma split; nested expressions stay together."""
    masked, depth, start, parts = mask_literals(value), 0, 0, []
    for n, ch in enumerate(masked):
        if ch == "(":
            depth += 1
        elif ch == ")":
            depth -= 1
        elif ch == "," and depth == 0:
            parts.append(canonical(value[start:n]))
            start = n + 1
    parts.append(canonical(value[start:]))
    return [x for x in parts if x]


def profile(text: str, source_format: str = "fixed") -> dict:
    rows = source_lines(text, source_format)
    executable = [r for r in rows if not r["comment"] and r["body"].strip()]
    combined = "\n".join(r["body"] for r in executable)
    pid = re.search(r"\bPROGRAM-ID\s*\.\s*([A-Z0-9_-]+)", mask_literals(combined), re.I)
    result = {
        "program_id": pid.group(1).upper() if pid else None,
        "lines": len(rows), "format": source_format, "paragraphs": [], "calls": [],
        "sql": [], "statements": [], "data": [], "dependencies": [],
        "limitations": ["Lexical inventory only; no COPY expansion, full CFG, byte-layout proof, compiler, or runtime execution."],
    }
    if any(r["debug"] for r in rows):
        result["limitations"].append("Debug indicator lines exist; compiler debug mode is not established.")
    if any(r["continuation"] for r in rows):
        result["limitations"].append("Fixed-format continuation lines exist; continued literals need direct review.")
    if re.search(r"\b(COPY\b.*\bREPLACING|ALTER\b|EXEC\s+CICS|GO\s+TO.*DEPENDING)", combined, re.I):
        result["limitations"].append("Complex dialect/control constructs need source-level review; inventory does not execute them.")
    proc, paragraph, sql_rows, statement = False, "<mainline>", [], None

    def flush() -> None:
        nonlocal statement
        if statement is not None:
            statement["text"] = " ".join(statement.pop("parts"))
            statement["normalized"] = canonical(statement["text"])
            result["statements"].append(statement)
            statement = None

    def flush_sql() -> None:
        nonlocal sql_rows
        value = " ".join(x["body"].strip() for x in sql_rows)
        masked = mask_literals(value).upper()
        op = re.search(r"EXEC\s+SQL\s+(\w+)", masked)
        block = {"kind": op.group(1) if op else "UNKNOWN", "paragraph": paragraph,
                 "start_line": sql_rows[0]["line"], "end_line": sql_rows[-1]["line"],
                 "text": value, "normalized": canonical(value), "tables": [],
                 "projection": [], "hosts": [], "predicates": "", "ordering": ""}
        block["tables"] = sorted(set(re.findall(r"\b(?:FROM|JOIN|UPDATE|INSERT\s+INTO)\s+(" + WORD + r")", masked)))
        if block["kind"] in {"SELECT", "DECLARE"}:
            sel = re.search(r"\bSELECT\s+(.+?)\s+(?:INTO|FROM)\b", value, re.I)
            if sel:
                block["projection"] = split_list(sel.group(1))
            into = re.search(r"\bINTO\s+(.+?)\s+FROM\b", value, re.I)
            if into:
                block["hosts"] = split_list(into.group(1))
        if block["kind"] == "FETCH":
            into = re.search(r"\bINTO\s+(.+?)\s+END-EXEC\b", value, re.I)
            if into:
                block["hosts"] = split_list(into.group(1))
        predicate = re.search(r"\bWHERE\s+(.+?)(?=\s+(?:ORDER\s+BY|GROUP\s+BY|FETCH\s+FIRST|QUERYNO|FOR\s+READ|END-EXEC)\b)", value, re.I)
        order = re.search(r"\bORDER\s+BY\s+(.+?)(?=\s+(?:FETCH\s+FIRST|QUERYNO|FOR\s+READ|END-EXEC)\b)", value, re.I)
        if predicate:
            block["predicates"] = canonical(predicate.group(1))
        if order:
            block["ordering"] = canonical(order.group(1))
        result["sql"].append(block)
        if block["kind"] == "INCLUDE":
            match = re.search(r"\bINCLUDE\s+(" + WORD + r")", masked)
            if match:
                result["dependencies"].append({"kind": "SQL_INCLUDE", "name": match.group(1), "line": block["start_line"]})
        sql_rows = []

    for row in executable:
        body, n = row["body"], row["line"]
        clean = mask_literals(body).upper()
        if sql_rows or re.search(r"\bEXEC\s+SQL\b", clean):
            flush()
            sql_rows.append(row)
            if "END-EXEC" in clean:
                flush_sql()
            continue
        if re.search(r"\bPROCEDURE\s+DIVISION\b", clean):
            flush()
            proc = True
            continue
        if not proc:
            data = DATA.match(body)
            if data:
                result["data"].append({"level": int(data.group(1)), "name": data.group(2).upper(),
                                       "start_line": n, "end_line": n, "text": body.strip()})
            elif result["data"] and re.search(r"\b(?:PIC|PICTURE|USAGE|VALUE|COMP|REDEFINES|OCCURS)\b", clean):
                result["data"][-1]["text"] += " " + body.strip()
                result["data"][-1]["end_line"] = n
        copy = re.search(r"\bCOPY\s+['\"]?(" + WORD + r")", body, re.I)
        if copy:
            result["dependencies"].append({"kind": "COPY", "name": copy.group(1).upper(), "line": n})
        if not proc:
            continue
        label = re.fullmatch(r"\s*(" + WORD + r")(\s+SECTION)?\s*\.\s*", clean)
        if label and (source_format == "free" or len(body) - len(body.lstrip()) <= 3) and label.group(1) not in VERBS:
            flush()
            paragraph = label.group(1)
            result["paragraphs"].append({"name": paragraph, "kind": "section" if label.group(2) else "paragraph", "line": n})
            continue
        first = clean.strip().split(" ", 1)[0].rstrip(".")
        if first in VERBS:
            flush()
            statement = {"verb": first, "paragraph": paragraph, "start_line": n, "end_line": n, "parts": [body.strip()]}
        elif statement is not None:
            statement["parts"].append(body.strip())
            statement["end_line"] = n
        elif body.strip():
            result["limitations"].append(f"Unclassified procedure text at line {n}; inspect original source.")
    flush()
    if sql_rows:
        result["limitations"].append("Unterminated EXEC SQL block; extraction incomplete.")
    for st in result["statements"]:
        if st["verb"] != "PERFORM":
            continue
        m = re.match(r"PERFORM\s+(" + WORD + r")(?:\s+(?:THRU|THROUGH)\s+(" + WORD + r"))?", mask_literals(st["text"]), re.I)
        if m and m.group(1).upper() not in INLINE_PERFORM and not m.group(1).isdigit():
            result["calls"].append({"caller": st["paragraph"], "target": m.group(1).upper(),
                                    "through": m.group(2).upper() if m.group(2) else None,
                                    "start_line": st["start_line"], "end_line": st["end_line"]})
    labels = Counter(p["name"] for p in result["paragraphs"])
    result["unresolved_calls"] = [c for c in result["calls"] if c["target"] not in labels or (c["through"] and c["through"] not in labels)]
    result["duplicate_labels"] = sorted(n for n, count in labels.items() if count > 1)
    result["verb_counts"] = dict(sorted(Counter(s["verb"] for s in result["statements"]).items()))
    result["sql_counts"] = dict(sorted(Counter(s["kind"] for s in result["sql"]).items()))
    result["limitations"] = list(dict.fromkeys(result["limitations"]))
    return result
