# Required migration analysis

## Contents

1. Business behavior and IDMS operations
2. Field mappings, DCLGEN and copybooks
3. Minimum helper variables
4. Cursors, status handling and transactions
5. OCCURS and REDEFINES
6. Logical Record Facility and parent/child behavior
7. Decommissioned records
8. Restart and buffer replacements
9. COBOL declarations and verification

## 1. Business behavior and IDMS operations

For every source operation, record the paragraph, incoming condition, inputs, record areas, current record/set/area state, output data, status handling, locks, side effects, and subsequent branches. Trace downstream uses, not only adjacent statements.

Inventory actual occurrences of FIND, OBTAIN, GET, STORE, MODIFY, ERASE and its options, CONNECT, DISCONNECT, BIND, READY, FINISH, COMMIT, ROLLBACK, ACCEPT and other observed IDMS services. Distinguish network DML, LRF, SQL, transaction management, and DC/terminal/queue/scratch/program-control services.

Explain FIND versus OBTAIN versus GET data-transfer timing and the currency on which each depends. Examine CALC and duplicates, DB-KEY, CURRENT, FIRST/NEXT/PRIOR/LAST, OWNER and member traversal, and area sweeps. Never assume a physical database key is a relational business key.

Compare actual replacement statements and control flow. Treat SELECT, cursors, INSERT, UPDATE, DELETE, relation-table operations, wrappers, and removal as candidate implementations, not universal verb translations.

For CONNECT/DISCONNECT and ERASE variants, establish membership options, descendants, other memberships and referential actions. Removing a relationship is not automatically deleting the member. For STORE/MODIFY, compare default values, implicit membership, data transformations, uniqueness and update scope.

Verify business outputs, files/reports, messages, counters, totals, calculations, calls, selection criteria and return/abend behavior. Distinguish approved decommissioning from accidental loss of business work.

Record unmatched legacy DML, unexplained newly added SQL, and control-flow changes. Do not recommend removing all IDMS-related statements solely because database access moved to DB2.

## 2. Field mappings, DCLGEN and copybooks

Build one trace row per migrated field:

`IDMS record + qualified field → mapping workbook/sheet/row → DB2 schema.table.column → SQL DCLGEN declaration → exact COBOL host item → use sites`.

Keep DB2 table names, DCLGEN member/group names, and COBOL host-variable names distinct. Support record splits/merges, many-to-one mappings, derived fields, constants, discontinued fields, SQL aliases and expression results. Do not force one-to-one mapping.

Match exact qualified identifiers first. Use case folding only for identifiers whose language rules permit it. Use hyphen/underscore substitution only to find candidates. Require a unique validated match within the mapped table and preserve exact emitted identifiers. Report collisions and conflicting mapping rows.

DCLGEN may translate SQL underscores to COBOL hyphens and apply configured prefixes or generated names. Never globally replace hyphens in COBOL. Obtain the actual host name from the supplied DCLGEN.

Derive SQL type and nullability from the mapped DCLGEN SQL declaration and COBOL PIC/USAGE, length, scale, sign, binary/packed representation and group layout from its COBOL declaration. Validate correspondence between the two. If supplied DDL/catalog evidence conflicts, report version drift instead of silently selecting a type.

Do not infer a type from a name. Assess precision/range, truncation, rounding, signedness, decimal arithmetic, display versus COMP/COMP-3/COMP-5, VARCHAR length/data fields, date/time formats, CCSID, blanks, low-values and sentinel values where the code uses them.

Trace COPY and COPY REPLACING, group qualification, shared declarations, 66/77/88-level uses and field renaming. Classify each copybook item as reused unchanged, renamed, qualified, replaced with a DCLGEN item, transformed, retained for business storage, or removed with justification.

For direct use of a copybook field as a SQL host variable, prove valid SQL declaration form, compatible representation, sufficient capacity, safe input/output lifetime, and no overlay or alias conflict. Avoid duplicate shadow fields when those conditions hold. Do not assume a generated DCLGEN group can replace a business record used by CALL, file I/O or a shared interface.

## 3. Minimum helper variables

Compare effective original and converted storage, not raw declaration text alone. Distinguish renamed/retyped fields, generated DCLGEN and SQL interface storage, added business state, true new helper storage, aliases/REDEFINES, and 88-level condition names.

For each introduced item, complete:

| Required evidence | What to establish |
| --- | --- |
| Identity and declaration | Qualified name, location, PIC/USAGE, size and category |
| Purpose | Exact platform requirement or business invariant |
| Def-use chain | Initialization, every assignment, every read, reset and exit path |
| Lifetime | Values that must coexist; loops, nested calls/cursors, commits and errors |
| Reuse candidate | Existing copybook/DCLGEN/business field and all overlapping uses |
| No-new-helper design | Concrete reuse/control-flow alternative, or precise reason none is safe |
| Risk | Overwrite, aliasing, null/stale values, changed branch outcome or interface |
| Verdict | Mandatory platform; mandatory business/state; optional convention; removable/redundant; unresolved |
| Validation | Source evidence and scenario that would distinguish incorrect reuse |

Retain only helpers proven necessary for the chosen behavior. A convention alone is not evidence that storage is mandatory. Describe optional conventions separately if site standards require them.

Required null indicators, input keys that must survive output overwrites, independent parent/child cursor state, checkpoint values, and diagnostic state that must survive later SQL can be mandatory. Each still requires a use/lifetime justification; do not add these categories automatically.

Determine SQL-result nullability, including outer joins and expressions. If a result can be null, handle it correctly; an indicator can be mandatory even when a base column is NOT NULL. Do not substitute zero, spaces or COALESCE merely to remove an indicator unless the business semantics explicitly define that substitution. Check the indicator before reading a possibly unchanged host field.

Preserve original request values when LRF OF LR, legacy buffer timing, nested access or a called routine requires them. Do not reuse an input field as fetch output while that input remains live. Reuse indicators/status fields only when their previous meaning is no longer needed.

Assess EOF flags, saved SQLCODEs, temporary MOVE fields and duplicated record buffers individually. An immediate status test may eliminate an optional flag, but another SQL statement or nested cursor can make separate state necessary.

If equivalence of a no-new-helper design cannot be established statically, label it unverified and state the missing evidence/test. Never claim a reduced variable count proves a better migration.

## 4. Cursors, status handling and transactions

For each cursor, trace declaration, query, parameters, OPEN, first/subsequent FETCH, all loops and exits, CLOSE, reopen, early return, errors and cleanup. Record expected cardinality, ordering and ties, duplicates, update intent, isolation, locking and parameter lifetime.

Preserve set order whenever the program depends on it. Verify ORDER BY and a deterministic tie-breaker where required; do not add arbitrary ordering as an unexplained performance/design change. Verify singleton uniqueness using actual constraints or business evidence.

Compare parent and child cursor nesting, data-buffer ownership and statuses independently. For child queries parameterized by a parent, verify that each execution or OPEN uses the intended parent key. For joined streams or grouped prefetch, prove equivalent grouping and parent/child cardinality. In every design, prevent stale child state from leaking into the next parent.

Use a statement-specific condition table. Distinguish:

- Successful execution and warnings.
- No parent, no child, empty result and exhausted iteration.
- Zero affected rows and duplicate/multiple-row conditions.
- Null, truncation and conversion problems.
- Deadlock/timeout and constraint failures where relevant.
- Partial multi-row/rowset success and returned row counts.

Do not treat all positive SQLCODEs as success, all +100 results as the same business outcome, or every IDMS status as a one-to-one SQLCODE replacement. Do not treat an unreturned host value as fresh data.

Build a complete status inventory from explicit SQLCODE/SQLSTATE values, SQLWARN tests, row counts, indicators, 88-level conditions, SQL WHENEVER directives and centralized error routines. Trace default/ELSE behavior and unchecked operations as well as named error branches. Obtain the version-specific platform meaning of each observed code from supplied or official documentation; do not infer its business meaning from the number.

For each status decision record: producing SQL operation; exact code/state/warning or condition; legacy IDMS status and any LRF custom status; business condition; consuming paragraph/IF branch; expected data validity; retry/skip/abort/restart action; cleanup and output effects. Preserve operation-specific differences when several statements use the same code. Link unresolved business interpretations to question files naming the affected source and target programs.

Associate SQLCODE/SQLSTATE/SQLCA diagnostics with the statement that produced them. Examine intervening SQL, cleanup SQL, logging and calls before each status test. Preserve the original failure only when it must remain available. Assess the lexical scope and effect of any SQL WHENEVER directives. Distinguish detecting an error, preserving its diagnostics, selecting a business outcome, and completing cleanup; do not assume a single flag or saved code correctly represents all four.

Verify platform-specific SQLCA or SQLCODE/SQLSTATE requirements for the actual precompile options; avoid duplicate interface declarations. Keep database error, application error and planned business rejection distinct.

Trace units of work, commits, rollbacks, partial updates, called-program boundaries and retry behavior. Assess WITH HOLD, cursor validity after transaction boundaries and reconnects, and environment-specific restrictions. A held cursor is not a persisted restart position.

Do not prescribe generic commit-every-N or retry-every-error logic. Require the business unit of work, idempotency and recovery evidence.

## 5. OCCURS and REDEFINES

For every OCCURS, identify dimensions, fixed/variable bounds, OCCURS DEPENDING ON, controlling count, INDEXED BY, subscripts, SEARCH/SEARCH ALL, iteration order and initialization. Trace empty, one-item, maximum, overflow and stale-tail cases.

For every REDEFINES, document physical overlap, size/alignment, active variant/discriminator, byte/numeric interpretation, parent/group moves and all aliases. Preserve shared storage semantics or explicitly explain a validated replacement.

Verify COBOL-valid layouts separately from DB2 host-variable eligibility. Apply version-specific restrictions for arrays, indicators, redefinitions and VARCHAR structures. Do not assume every table or overlay is a legal host structure.

Do not convert every OCCURS into a SQL rowset. Prove that element order, occurrence count, grouping and SQL cardinality correspond. Conversely, do not collapse repeated business data to one scalar merely because a mapped column is scalar.

Prefer a supported existing item or field-level reference where safe. Justify staging buffers only when declaration restrictions, layout differences or simultaneous value lifetimes require them.

## 6. Logical Record Facility and parent/child behavior

Use this mandatory reasoning chain:

`LR request → supplied subschema/path definition → normalized IDMS operations and conditions → mapped relational operations → actual DB2 COBOL control flow`.

“Normalized” means an evidence-based intermediate explanation; do not overwrite the original IDMS program.

For each LR occurrence, recover:

- LR components, record roles, owner/member relationships and keys.
- Path group for the verb, selector order, keywords, selected path and fallback.
- Path restrictions and program WHERE conditions, including AND/OR/NOT precedence.
- Component initialization, buffer writes, transformations, optional/partial data.
- Iteration/resume points, saved currencies, RESET/NO RESET and interleaving.
- Standard and custom path statuses, ON clauses, ERROR-STATUS use and all consuming IF branches.
- STORE/MODIFY/ERASE path side effects on each participating record.

Read actual schema, subschema and path definitions for business predicates, computed/defaulted fields, record initialization, custom error/status assignments, ON/error exits, nested calls, update side effects and path-specific conditions. Trace each returned status from the path that produces it through the original program's IF/EVALUATE/ON logic to the converted SQL/status branch. Retain custom statuses even when their names resemble standard not-found or error conditions.

Build a path-status dictionary: exact status name/value; producer and condition; component records available; initialized/uninitialized data; original consuming branch; observed DB2 replacement; missing evidence; question ID. A generic SQL error routine is equivalent only for the business cases it actually preserves. Keep path-level failures distinct from application rejections and SQL failures.

Do not assume the record-layout schema contains all LRF logic. When path/subschema definitions are absent, document the known business branches and mark path expansion unresolved. Create a precise question identifying the missing definition and affected filenames; do not pause Phase 1 or infer a read-only path from the program verb alone.

Preserve OF LR input-value lifetime and any dependence on storage changed during a path. Examine IDMS-specific matching semantics rather than mechanically substituting SQL LIKE.

Build a decision table for parent found/missing, child none/one/many, filtered child, partial LR, exhausted path, custom status and database failure. Include valid component data and required branch/output/update in each case. Apply only feasible combinations; explain excluded ones.

Choose JOIN type, EXISTS, separate SELECTs or nested cursors from this behavior. An inner join may hide a parent-with-no-child case; an outer join may introduce null results or duplicate parent-level work. Assess order and cardinality before claiming equivalence.

Explain LR-FOUND, LR-NOT-FOUND and LR-ERROR separately. Examine partial component data and FIRST/NEXT behavior after end-of-path; never assume ordinary cursor EOF semantics reproduce every LRF path.

## 7. Decommissioned records

Read the eight decommission entries from the editable MIGRATION_CONFIG.md or explicit run instructions. Accept IDMS names, DB2 names, or both. Record the supplied namespace and spelling, qualifiers, intended scope, resolved legacy identity, resolved DB2 identity, aliases and mapping evidence.

Resolve DB2-supplied names back through mappings, schema, DCLGEN and program usage. Do not guess which legacy record is meant when a table aggregates multiple records or an identifier could be a column, DCLGEN group or table. Create a scoped identity question when ambiguous. Do not collapse distinct IDMS records merely because they map to the same DB2 table.

Validate eight distinct supplied record identities after evidence-based alias resolution. Count two proven aliases for the same record once. Report missing names, unresolved identity, duplicates or a count mismatch without inventing entries or ignoring extra supplied names. Preserve the user's original entries and the resolution separately.

For each record, trace direct/transitive declarations and operations, schema sets, LR components/paths, mapping entries, calculations, flags, IF branches, outputs, calls, cursor joins, error handling, restart and buffer dependencies.

Classify each occurrence as removed, replaced, retained intentionally, still active unexpectedly, not referenced after complete inspection, or unresolved. Distinguish inactive comments from executable references.

For each observed removal, explain which business obligation ceased, which remains elsewhere, and whether parent/child or error behavior changed. A record name on the list does not authorize removal of every dependent condition.

A not-found search is insufficient when COPY/LRF dependencies are unresolved. Include all eight records in every program's checklist once the list is supplied, including verified non-use.

## 8. Restart and buffer replacements

Read the two old/new replacement rows from MIGRATION_CONFIG.md. Use their exact roles, legacy identities and intended DB2 targets; resolve qualifiers, DCLGEN items, columns, keys and wrappers. Keep actual source names in evidence excerpts. If configuration and code differ, report the intended identity and observed identity separately and create a question instead of silently renaming either.

Analyze restart as a business protocol, not just a table operation. Start with the unit of work and what the business considers completed: a row, account, parent/child group, file position, batch or another evidenced unit. Do not infer it from the location of a COMMIT alone.

Build a protocol ledger covering these items:

| Item | Required evidence and explanation |
| --- | --- |
| Run identity | Job, business date, batch/partition, owner/token and uniqueness rules |
| Fresh start | Restart-row lookup, no-row behavior, initialization, input selection and first checkpoint |
| Resume | Conditions selecting restart, validity/staleness checks and restored state |
| Checkpoint meaning | Last processed versus last committed versus next item, composite keys and serialized representation |
| Ordering | Query/set order, ASC/DESC effects, equal-key ties, duplicate keys and changed input data |
| Resume predicate | Exact greater-than/inclusive/equality conditions and why they neither skip nor repeat unintended work |
| Business work | Record changes, logical group boundaries, child processing, counters, totals and outputs |
| Persistence sequence | Business update, buffer change, checkpoint save and actual commit/rollback order, including called modules |
| Completion | EOF, end-of-group, completion flags, restart-row cleanup/retention and rerun policy |
| Failure policy | Recoverable/terminal errors, status preservation, rollback, retry limits and who restarts the job |
| Concurrency | Overlapping runs/partitions, locking/ownership, checkpoint overwrite and stale ownership recovery |

Trace every checkpoint field and counter to its declaration, writes, reads, initial value, persisted meaning and recovery use. Compare IDMS and DB2 implementations side by side. Distinguish rows read, rows attempted, rows successfully processed and rows committed. Reuse existing storage only when these values do not need to coexist.

Establish the buffer's real role: staging, queue, cache, work accumulation or persistent in-flight state. Trace each state transition, producer/consumer ordering, key, sequence, retention, cleanup, rollback and replay. Determine how buffer state agrees with the restart checkpoint; a read-only main query can still have update/restart work through these objects.

Draw or tabulate the actual unit-of-work sequence. Identify commits hidden in wrappers/called modules and effects outside the DB2 unit of work, including files, reports and messages. Do not infer atomicity across those effects. Analyze parent/child units that can be interrupted mid-group and how progress is reconstructed.

For each relevant failure point, fill a scenario row with: business/data state before failure; operations completed; durable business/buffer/checkpoint state; next restart selection; work repeated; work skipped; effect on counters/external outputs; intended business outcome; observed DB2 behavior; evidence; validation; unresolved question.

Include failure before any business update, between dependent updates, between business work and checkpoint writing, during buffer processing, before/after commit, after an uncertain commit result, and after durable commit but before external output acknowledgement where the program permits those situations. Test missing/stale/completed restart rows, empty input, equal-key boundaries, repeated restarts and applicable concurrent execution. Mark impossible cases with evidence instead of inventing them.

Explain replay/idempotency from the actual keys, constraints, flags, update logic and output policy. Do not claim exactly-once processing, safe retry, held-cursor recovery or a universal checkpoint cadence without supporting evidence. Keep a persisted checkpoint separate from transient cursor position.

In the generic update/restart guides, turn each proved protocol into a conditional rule: required unit of work, key meaning, ordering, commit relation, buffer lifecycle, outputs, failure behavior, scenarios and counterexamples. Preserve program-specific exceptions. Cross-check the rule against every input, including LRF hidden updates and unpaired programs.

If key meaning, checkpoint timing, buffer lifecycle or output replay cannot be determined, create one question per independent uncertainty, cite exact IDMS/DB2 filenames and code/path anchors, and continue the phase. Human answers can define intended policy; Phase 2 must still compare that policy with the implementation and keep any defect visible.

## 9. COBOL declarations and verification

Inspect divisions/sections, COPY/INCLUDE placement, SQL declarations and host references, name qualification, levels, valid PIC/USAGE, VALUE/initialization, declaration duplication, removed-item references and undefined data names.

Check END-IF/END-EVALUATE/END-PERFORM/END-EXEC, sentence periods and scope, paragraph fall-through, PERFORM ranges, exits, data movement, arithmetic, return codes and calls. Preserve source form and documented site naming rules.

For each meaningful case, specify input state, database state, expected business output, expected database effects, statuses, commit/restart point and an assertion. Include zero/one/many, missing parent/child, null, maximum OCCURS, each active REDEFINES variant, errors and recovery where applicable.

Record available precompile/compile/link evidence and semantic test results separately. Do not infer a successful mainframe build from syntax inspection or successful report generation.
