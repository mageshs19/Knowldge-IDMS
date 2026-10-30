# Program gap pack contract

`Phase-1-Gap-Fix/Run-001/program-gaps/` is the Copilot work queue for the 41 existing reports.

Each gap file is a deterministic summary of evidence already present in the corresponding report. It is not an authority by itself.

For each program Copilot must:

1. Read the original copied report in `programs/`.
2. Read its matching `program-gaps/*__GAP_ENHANCEMENT.md` file.
3. Resolve every reusable behavior into concept rules and machine JSON.
4. Test those rules against the other reports before generalizing them.
5. Add a `program-enhancements/<program>__ADDENDUM.md` only when the original report lacks material analysis, contains a conflict, or needs a clarified production conclusion.
6. Link unresolved decisions to existing Q IDs.
7. Mark completion in the gap file checklist or create a machine completion record.

The 41 gap files exist to prevent silent omission of a program during generic-rule synthesis.
