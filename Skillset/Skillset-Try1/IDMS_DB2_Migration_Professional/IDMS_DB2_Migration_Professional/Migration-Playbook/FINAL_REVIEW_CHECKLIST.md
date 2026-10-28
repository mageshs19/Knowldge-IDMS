# Final review checklist

Use this checklist before accepting a Phase 1 or Phase 2 run.

## Input coverage
- [ ] All expected IDMS source programs are listed.
- [ ] All expected manually converted DB2 programs are listed.
- [ ] Every pairing is supported by explicit mapping or code/business evidence.
- [ ] Unpaired or ambiguous files are explicitly listed.
- [ ] Mapping, Schema, DCLGEN and Copybook inputs are inventoried.
- [ ] Missing or unreadable artifacts are documented.

## Per-program semantic analysis
- [ ] Original execution order and paragraph flow are documented.
- [ ] IDMS statements are compared to actual DB2 behavior.
- [ ] Field lineage is traced through mapping, DB2 table/column and DCLGEN/host variable where evidence exists.
- [ ] Cursor OPEN/FETCH/CLOSE, predicates and SQL status/error paths are checked where applicable.
- [ ] LRF parent/child semantics are treated separately from non-LRF behavior.
- [ ] Restart and Buffer replacements match the editable configuration.
- [ ] Decommissioned record handling matches the editable configuration.
- [ ] Working-storage additions and helper-variable uses are justified.
- [ ] OCCURS, REDEFINES, FILLER and copybook layout are preserved/assessed.
- [ ] Program-specific exceptions are not generalized away.

## Generic rules
- [ ] Exactly four conditional guides are present.
- [ ] Every rule has a stable ID and conditions.
- [ ] Every rule has evidence and an applicability status for relevant programs.
- [ ] Exceptions and conflicts are explicit.
- [ ] No rule is called universal solely because it appears repeatedly.
- [ ] No unverified assumption is presented as a confirmed standard.

## Human-in-the-loop
- [ ] Every question is material, unresolved, program-specific and evidence-backed.
- [ ] Question IDs are stable and duplicates are avoided where possible.
- [ ] YES/NO is used by default.
- [ ] No generic, build, test-planning or speculative questions are included.
- [ ] Zero questions is accepted when no genuine ambiguity remains.
- [ ] Human answers are preserved verbatim and unanswered items remain open.

## Phase and integrity
- [ ] Phase 1 outputs are preserved.
- [ ] Phase 2 is created only after Phase 1 and answer review.
- [ ] Each run uses a new output folder.
- [ ] Original source files are unchanged.
- [ ] Coverage reports reflect actual work completed.
- [ ] Compile/runtime/regression claims are supported by actual execution evidence.
