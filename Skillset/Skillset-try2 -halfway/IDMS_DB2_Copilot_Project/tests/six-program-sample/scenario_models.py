#!/usr/bin/env python3
"""Small source-informed reasoning models. These do NOT execute supplied COBOL."""
from __future__ import annotations
import json


def main():
    rows = []

    # Source: both converted restart programs copy a 15+1200-byte group but
    # change the VARCHAR length from 1215 at insertion to 15 at checkpoint.
    count = 137
    payload = f"{count:015d}".encode("ascii") + b"K" * 1200
    inserted, checkpointed = payload[:1215], payload[:15]
    assert len(inserted) == 1215 and len(checkpointed) == 15
    assert int(checkpointed) == count and b"K" not in checkpointed
    rows.append({"id": "MODEL-01", "result": "PASS", "finding": "15-byte checkpoint preserves the count but not the copied 1200-byte record area.",
                 "observed": {"insert_bytes": len(inserted), "checkpoint_bytes": len(checkpointed), "restored_count": int(checkpointed)},
                 "evidence": ["VMDZ1526.txt physical lines 347-371", "VMDZ1567.cbl physical lines 306-341"],
                 "limitation": "Python byte model of declared lengths, not a Db2 write/read test."})

    # With a frozen input and count meaning 'committed records', count skipping
    # restarts at the next item. If that input is changed, the count alone fails.
    original = ["A", "B", "C", "D"]
    persisted_count = 2
    assert original[persisted_count:] == ["C", "D"]
    changed = ["X"] + original
    assert changed[persisted_count:] == ["B", "C", "D"]
    rows.append({"id": "MODEL-02", "result": "PASS", "finding": "Ordinal restart requires unchanged input identity and order; inserting a leading record replays B.",
                 "observed": {"frozen_resume": original[persisted_count:], "changed_resume": changed[persisted_count:]},
                 "evidence": ["VMDZ1526.txt physical lines 337-344", "VMDZ1567.cbl physical lines 289-300"],
                 "limitation": "Assumes the saved count already means completed committed work; that policy is simulated, not business-confirmed."})

    # Minimal model of the observed initialized host followed by a projection
    # that omits AM_CNDSTK, then the NX_CPCRESK=0 output branch.
    row = {"NX_CPCRESK": 0, "AM_CNDSTK": 12500}
    host = {"NX_CPCRESK": 0, "AM_CNDSTK": 0}
    host["NX_CPCRESK"] = row["NX_CPCRESK"]
    legacy_amount = row["AM_CNDSTK"]
    converted_amount = host["AM_CNDSTK"]
    assert legacy_amount != converted_amount
    rows.append({"id": "MODEL-03", "result": "PASS", "finding": "A nonzero parent amount exposes the missing SELECT projection in the zero-coupon-count branch.",
                 "observed": {"legacy_amount": legacy_amount, "converted_amount": converted_amount},
                 "evidence": ["VM4BD310.cbl physical lines 247-253", "VMDZ4310.txt physical lines 219-263 and 393-399"],
                 "limitation": "Model confirms the source reasoning under the shown branch. No compiled COBOL, database or actual customer data used."})

    # Source retains first qualifying creation event. Encounter order therefore
    # matters even when the same event set is returned successfully.
    events = [(1, 111111), (2, 222222)]
    def first_creation(stream):
        marker, selected = 0, None
        for _, ci in stream:
            if marker == 0:
                selected, marker = ci, 1
        return selected
    a, b = first_creation(events), first_creation(list(reversed(events)))
    assert a != b
    rows.append({"id": "MODEL-04", "result": "PASS", "finding": "Changing encounter order can change the first qualifying creation CI even with identical rows.",
                 "observed": {"ascending_example": a, "descending_example": b},
                 "evidence": ["VM4BD302.cbl physical lines 300-315", "VMDZ4302.txt physical lines 244 and 421-447"],
                 "limitation": "Constructed valid-domain scenario. Actual IDMS set order and relational load order are not supplied."})

    # Archive filtering: retain strict inequality and creation fallback only
    # when the accounting date carries the minimum-date sentinel.
    cutoff = 20200101
    def selected(accounting, creation):
        return (creation if accounting == 0 else accounting) < cutoff
    assert selected(0, 20191231)
    assert not selected(0, cutoff)
    assert not selected(0, 20200102)
    assert selected(20191231, 20200102)
    rows.append({"id": "MODEL-05", "result": "PASS", "finding": "Archive cutoff equality is excluded, and creation date is used only for a zero accounting date.",
                 "observed": {"before_cutoff": True, "equal_cutoff": False, "after_cutoff": False, "nonzero_accounting_controls": True},
                 "evidence": ["VM7BD200.cbl selection flow", "VMDZ7200.cbl cursor WHERE predicate"],
                 "limitation": "Numeric-date reasoning only. The Db2 minimum-date load convention and returned host format remain assumptions."})

    print(json.dumps({"status": "PASS", "kind": "SOURCE_INFORMED_REASONING_MODELS",
                      "not_executed": ["COBOL precompile", "COBOL compile/link", "Db2 SQL", "real crash/restart"],
                      "scenarios": rows}, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
