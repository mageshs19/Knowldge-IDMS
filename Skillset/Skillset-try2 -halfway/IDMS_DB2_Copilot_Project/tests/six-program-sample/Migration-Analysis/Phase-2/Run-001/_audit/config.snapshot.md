# IDMS to DB2 Migration Configuration

Edit this Markdown file directly and provide it with the workspace. Blank cells and “not supplied” mean unknown, never “not applicable.” The analyst preserves your entries and snapshots the effective configuration for each phase.

## 1. Run and paths

| Setting | Value |
| --- | --- |
| Phase | 2 |
| Input root | tests/six-program-sample/Mainframe/workspace/ |
| Output root | tests/six-program-sample/Migration-Analysis/ |
| Copybooks | Copybook/ |
| DCLGENs | Dclgens/ |
| Schema and LRF definitions | Schema/ |
| IDMS programs | IDMS Programs/ |
| Manually converted DB2 programs | DB2 Manual converted Programs/ |
| Mapping workbook or CSV | Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv (relative to Input root) |
| Mapping sheets / header notes | CSV, comma delimiter, 20 columns, 870 data rows; preserve logical row and physical line separately |
| Previous phase/revision, for Phase 2 | Phase-1/Run-001 |
| Human-answer folder | Human-in-Loops/ |
| Explicit exclusions | None supplied |
| Application source modifications | No |
| Execution mode | TEST_REHEARSAL |
| Simulated answers allowed | Yes, only in Phase 2 for the user-requested rehearsal |
| Test root, for an explicitly authorized rehearsal | tests/six-program-sample/ |

For Phase 2, set Phase to 2 and identify the existing analysis folder. Answer files remain in the same Human-in-Loops folder.

Resolve Input root and Output root relative to the opened project/repository root, and the five source subfolders beneath Input root. Resolve Human-answer folder beneath Output root. Record these roots explicitly in each run manifest. Rehearsal output and synthetic answers must remain under the configured Test root; never read them into a production run by default.

## 2. Program-name conversion rules — editable

These rules generate candidates; actual files and business/code correspondence must confirm each pair. The first rule is limited to the demonstrated family.

| Rule ID | Enabled | Source prefix | Exact suffix | Target prefix | Scope / notes |
| --- | --- | --- | --- | --- | --- |
| NAME-001 | Yes | VM1BD | Three digits, preserve all digits | VMDZ1 | Only matching VM1BD### programs; verify each target |
| NAME-ALT | No | vm1b | Three digits, preserve all digits | DZvm1 | Alternative example; enable or replace in your prompt/configuration |

Supplied examples:

| IDMS name | DB2 name | Role |
| --- | --- | --- |
| VM1BD526 | VMDZ1526 | Evidence for NAME-001 |
| VM1BD567 | VMDZ1567 | Evidence for NAME-001 |
| vm1b720 | DZvm1720 | Editable alternative example, not globally active |

Additional naming instructions / changes:

<!-- Write a replacement rule or a scoped instruction here. -->

Match logical names without case sensitivity only where appropriate; keep the actual filename spelling and detect case collisions. Do not globally rename source files.

### Explicit exceptions or split/merged pairs

Paths are relative to the corresponding program folders. Explicit verified overrides take precedence over naming candidates.

| IDMS source file | DB2 target file(s) | Business/program scope | Reason / supplied reference |
| --- | --- | --- | --- |
| VM1BD526.cbl | VMDZ1526.txt | This test corpus | Verified PROGRAM-ID and file-processing/event-update correspondence |
| VM1BD567.cbl | VMDZ1567.cbl | This test corpus | Verified PROGRAM-ID and file-processing/form-update correspondence |
| VM4BD302.cbl | VMDZ4302.txt | This test corpus | Verified PROGRAM-ID and issuer/stock/event retrieval |
| VM4BD310.cbl | VMDZ4310.txt | This test corpus | Verified PROGRAM-ID and LR stock/event lookup |
| VM4BD420.cbl | VMDZ4420.cbl | This test corpus | Verified PROGRAM-ID and stock/event retrieval |
| VM7BD200.cbl | VMDZ7200.cbl | This test corpus | Verified PROGRAM-ID and LR form archive selection |

## 3. Field mapping and datatype sources

| Setting | Value |
| --- | --- |
| IDMS record header | Cobol Recrd IDMS |
| IDMS field header | Cobol Zone (contains level number and field) |
| DB2 schema header, if present | |
| DB2 table/record header | New DB2 Record (actual header has a trailing space) |
| DB2 column header | New DB2_Field name |
| Transformation / decommission-status headers | Remarks; Relation; Reference Field Name (Copybook). No approved eight-record list supplied. |
| Exact DCLGEN member naming rules, if any | |
| Mapping version / date | Filename V 1.0; mapping rows can conflict with supplied DCLGEN. Actual effective date unknown. |

Resolve IDMS record.field → mapping row → exact DB2 table.column → actual DCLGEN SQL/COBOL declarations. Hyphen/underscore substitution is a candidate lookup aid, not a global code replacement.

## 4. Decommissioned records — supply IDMS or DB2 names

Expected distinct business record identities: **8**. You can fill only the namespace and supplied name initially. The analyst resolves the other side from evidence. Aliases for one resolved record do not count twice; ambiguous splits/merges become questions.

| Entry | Name supplied in: IDMS / DB2 / both | Supplied exact name(s), with qualifier if known | Resolved IDMS identity, if known | Resolved DB2 identity, if known | Business reason / scope / reference |
| --- | --- | --- | --- | --- | --- |
| 1 | | | | | |
| 2 | | | | | |
| 3 | | | | | |
| 4 | | | | | |
| 5 | | | | | |
| 6 | | | | | |
| 7 | | | | | |
| 8 | | | | | |

Additional decommission instructions:

<!-- Explain approved removals, retained business obligations or scoped exceptions. -->

## 5. Two record/object replacements — edit names here

| Business role | Legacy IDMS record/object name(s) | Exact replacement DB2 schema.table / object | DCLGEN member, if known | Key/field mapping or reference |
| --- | --- | --- | --- | --- |
| Restart | FFRECAB | DZ01RSTB (observed mapping candidate; physical schema/view DDL still needed) | DZ01RSTV | CSV logical row 867 / physical line 873; target SQL uses DZ01RSTV |
| Buffer | FFRECAT | DZ01FFTB (observed mapping candidate; business role not proved) | Not supplied | CSV logical row 871 / physical line 877 only; no demonstrated buffer lifecycle in six programs |

A supplied name establishes intended identity. The analyst must still verify actual code, declarations, key meanings, lifecycle and transaction behavior. Actual source excerpts keep their original names.

## 6. Restart business rules and known exceptions

Leave uncertain fields blank; the analyst will first inspect the source and then create precise question files where needed.

| Business detail | Confirmed value / reference |
| --- | --- |
| Business unit of work | |
| Job/run/partition identity | |
| Meaning of stored checkpoint: last completed or next to process | |
| Initial run / missing restart-row behavior | |
| Commit boundary and checkpoint timing | |
| Resume ordering / equal-key tie-breaker | |
| Counter and total restoration | |
| Buffer purpose and lifecycle | |
| External files/messages/output replay policy | |
| Completed-run rerun and restart cleanup policy | |
| Concurrency / overlapping-run policy | |
| Known program-specific exceptions | |

## 7. Versions, standards and validation

| Setting | Value |
| --- | --- |
| IDMS version | |
| DB2 product/version | |
| COBOL compiler/version | |
| Batch/online attachment environment | |
| Fixed/free source format and encoding | Fixed-column COBOL; retain columns and physical lines. VMDZ1526.txt cp1252, remaining files decode utf-8-sig. |
| Precompile / bind options | |
| Coding-standard files | |
| Additional dependency roots | |
| Authorized precompile command/environment | |
| Authorized compile/link command/environment | |
| Authorized controlled tests and business reconciliation | |

Unperformed checks remain explicitly unperformed. Human answers clarify intended behavior; they do not certify that code was compiled, executed or proved correct.

## 8. Output and questions policy

- Create one report per IDMS input file.
- Create exactly four generic guides: non-LRF retrieval; non-LRF update/restart; LRF retrieval; LRF update/restart.
- Classify mixed programs by their individual cases; include all applicable guide memberships.
- Cross-check every generic rule against every program with explicit conditions, scenarios and exceptions.
- During Phase 1, continue without interactive business questions and create one Markdown file per independent uncertainty in Human-in-Loops/.
- During Phase 2, consume answers from that folder, preserve human text and Phase 1, update affected analysis, and carry remaining questions forward.
- Preserve all original application source files.

## 9. Rehearsal provenance

The user explicitly requested temporary assistant-written answers and a Phase 2 rehearsal for the six supplied pairs. Phase 1 is derived from the supplied files without those answers. Every later synthetic answer must be labelled SIMULATED_FOR_TEST and production_resolution OPEN. No production policy, missing declaration or successful mainframe execution may be invented.

The archive used singular/misspelled folder names. SOURCE_MANIFEST.json preserves each original path and the normalized working-copy path. All 30 file byte hashes must remain unchanged.
