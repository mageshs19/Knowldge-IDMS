#!/usr/bin/env python3
"""Executable *models* of the reviewed business branches, not COBOL execution.

The models exercise existing predicates and the proposed removal of one redundant
flag. They do not emulate IDMS currencies, Db2 SQLCODEs, packed-decimal moves,
COBOL runtime failures, SQL ordering, transactions, or external service routines.

Run from any directory with Python 3.10+: python navigation_scenarios.py
Results are written beside this script. Original program files are never changed.
"""
from dataclasses import dataclass
from itertools import product
from pathlib import Path
import json


@dataclass(frozen=True)
class Event:
    code: str
    date: int
    ci: str = "000001"
    state: str = "0"
    operation: int = 0
    transfer_date: int = 0


def legacy_420(events, cutoff):
    """VM4BD420 lines 190-224; database end-of-set modeled explicitly."""
    status = " "
    creation_ci = None
    artificial_end = False
    for event in events:
        if artificial_end:
            break
        if event.date <= cutoff:
            if event.code == "0060" and status != "D":
                status = "C"
                creation_ci = event.ci
            elif event.code == "0168" and event.state != "1":
                status = "D"
                artificial_end = True
            elif event.code == "0217" and status == " ":
                status = "S"
    return status == "C" and not artificial_end, creation_ci


def converted_420(events, cutoff, reuse_existing_state=False):
    """VMDZ4420 lines 268-314, plus proposed no-new-D-flag variant."""
    status = " "
    creation_ci = None
    extra_d_flag = False
    for event in events:
        if status == "D" if reuse_existing_state else extra_d_flag:
            break
        if event.date <= cutoff:
            if event.code == "0060" and status != "D":
                status = "C"
                creation_ci = event.ci
            elif event.code == "0168" and event.state != "1":
                status = "D"
                if not reuse_existing_state:
                    extra_d_flag = True
            elif event.code == "0217" and status == " ":
                status = "S"
    eligible = status == "C"
    if not reuse_existing_state:
        eligible = eligible and not extra_d_flag
    return eligible, creation_ci


def selection_302(events, cutoff, maturity):
    """Observed source/target branch after assuming approved value decoding."""
    year, month, day = maturity // 10000, maturity // 100 % 100, maturity % 100
    # Retain the exact source month-number operation; do not clamp invalid days.
    if month < 2:
        year -= 1
        month = 12
    else:
        month -= 1
    lower = year * 10000 + month * 100 + day
    eligible = False
    marker = 0
    ci = "000000"
    for event in events:
        if event.code == "0168" and event.operation == 91 and event.date < cutoff:
            if lower <= event.date:
                eligible = True
        if event.code == "0060" and event.date >= cutoff:
            continue
        if event.code == "0060" and marker == 0:
            marker = 1
            ci = event.ci
        elif event.code == "0092" and marker < event.transfer_date < cutoff:
            marker = event.transfer_date
            ci = event.ci
    return eligible, ci, lower


def run():
    cutoff = 20261015
    alphabet = [
        Event("0060", 20261014, "000001"),
        Event("0060", 20261015, "000002"),
        Event("0168", 20261014, state="0"),
        Event("0168", 20261014, state="1"),
        Event("0217", 20261014),
        Event("0060", 20261016, "000003"),
        Event("0168", 20261016, state="0"),
    ]
    failures = []
    sequences = 0
    for length in range(5):
        for events in product(alphabet, repeat=length):
            sequences += 1
            expected = legacy_420(events, cutoff)
            actual = converted_420(events, cutoff)
            minimal = converted_420(events, cutoff, reuse_existing_state=True)
            if expected != actual or expected != minimal:
                failures.append({"events": [e.__dict__ for e in events],
                                 "legacy": expected, "converted": actual,
                                 "reuse_existing_state": minimal})

    assertions = []
    def check(name, condition, explanation):
        assertions.append({"name": name, "passed": bool(condition),
                           "explanation": explanation})

    for date, eligible in [(20260914, False), (20260915, True),
                           (20261014, True), (20261015, False)]:
        result = selection_302([Event("0168", date, operation=91)], cutoff, 20261015)
        check(f"302-redemption-date-{date}", result[0] == eligible,
              "Lower bound is inclusive and as-of cutoff is exclusive.")
    check("302-operation-must-be-91",
          not selection_302([Event("0168", 20261014, operation=90)], cutoff, 20261015)[0],
          "Event code alone is insufficient: embedded operation91 is required.")
    check("302-january-rollover",
          selection_302([], cutoff, 20260115)[2] == 20251215,
          "Month subtraction rolls January to prior-year December.")
    check("302-retained-unclamped-day",
          selection_302([], cutoff, 20260331)[2] == 20260231,
          "The model intentionally exposes retained non-calendar day arithmetic; intent remains open.")
    two_creations = [Event("0060", 20261013, "000001"),
                     Event("0060", 20261014, "000002")]
    first = selection_302(two_creations, cutoff, 20261015)[1]
    reversed_first = selection_302(list(reversed(two_creations)), cutoff, 20261015)[1]
    check("302-order-counterexample", first == "000001" and reversed_first == "000002",
          "Two valid creation records select different CIs when encounter order reverses.")
    last = legacy_420(two_creations, cutoff)[1]
    reversed_last = legacy_420(list(reversed(two_creations)), cutoff)[1]
    check("420-order-counterexample", last == "000002" and reversed_last == "000001",
          "420 preserves last creation CI; row order still matters although eligibility stays true.")
    equal_transfer_dates = [Event("0092", 20261001, "000003", transfer_date=20261010),
                            Event("0092", 20261001, "000004", transfer_date=20261010)]
    check("302-transfer-tie-is-strict",
          selection_302(equal_transfer_dates, cutoff, 20261015)[1] == "000003",
          "Equal transfer dates do not replace the existing CI because the comparison is strict.")

    # Demonstrate positions assumed by the existing DD.MM.CCYY parse. This is
    # byte-layout reasoning only; it does not emulate COBOL invalid numeric data.
    def assumed_eur_reorder(value):
        return value[6:10] + value[3:5] + value[0:2]
    check("eur-date-parser-control", assumed_eur_reorder("15.10.2026") == "20261015",
          "The source's assumed EUR positions reorder to YYYYMMDD.")
    check("iso-date-format-counterexample", assumed_eur_reorder("2026-10-15") != "20261015",
          "An ISO output string would not match the same positions; actual DATE options must be supplied.")

    result = {
        "schema_version": 1,
        "validation_level": "PYTHON_BUSINESS_BRANCH_SIMULATION_ONLY",
        "assumptions": ["Events are already decoded into approved numeric/date values.",
                        "Rows are supplied in the chosen test order; no SQL/IDMS engine is modeled.",
                        "Successful fetch/service/file paths only; no compiler, SQL error handler or Db2 execution."],
        "state_sequences_checked": sequences,
        "versions_compared": ["legacy420", "converted420", "420_existing_state_only"],
        "equivalence_failures": failures,
        "boundary_and_counterexample_checks": assertions,
        "passed": not failures and all(a["passed"] for a in assertions),
    }
    root = Path(__file__).resolve().parent
    (root / "NAVIGATION_SIMULATION_RESULTS.json").write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps({"passed": result["passed"], "state_sequences_checked": sequences,
                      "boundary_and_counterexample_checks": len(assertions),
                      "validation_level": result["validation_level"]}))
    return 0 if result["passed"] else 1


if __name__ == "__main__":
    raise SystemExit(run())
