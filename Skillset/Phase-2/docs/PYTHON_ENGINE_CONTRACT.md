# Python Engine Contract

The Python converter should not use narrative Markdown as its only rule source.

## Primary inputs

- `machine/rules.json`: semantic conversion rules.
- `machine/coverage_matrix.json`: applicability/counterexample matrix.
- mapping/DCLGEN/schema indexes produced by the future parser layer.

## Rule execution model

1. Parse COBOL/IDMS source into normalized constructs.
2. Identify the operation and context: IDMS verb, LRF path, record/set, status branches, storage lifetime and restart unit.
3. Select candidate rule IDs by `source_trigger`.
4. Check preconditions and exclusions.
5. Apply program-specific or corpus-supported variant.
6. Generate DB2 COBOL/SQL with only mandatory helper variables.
7. Generate SQLCODE/status branches tied to the producing statement.
8. Validate generated behavior against rule scenarios and known counterexamples.
9. If no supported rule applies, stop that conversion point as unresolved rather than guessing.

## Required rule quality

A rule is not production-ready if it only says "OBTAIN becomes SELECT" or "STORE becomes INSERT". It must capture cardinality, order, status, parent/child behavior, currency/state, field transformation, error handling, commit/restart effect and helper lifetime where applicable.
