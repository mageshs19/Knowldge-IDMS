# IDMS to DB2 Migration Configuration

Edit this Markdown file directly and provide it with the workspace. Blank cells and “not supplied” mean unknown, never “not applicable.” The analyst preserves your entries and snapshots the effective configuration for each phase.

## 1. Run and paths

| Setting | Value |
| --- | --- |
| Phase | 1 |
| Input root | Mainframe/workspace/ |
| Output root | Migration-Analysis/ |
| Copybooks | Copybook/ |
| DCLGENs | Dclgens/ |
| Schema and LRF definitions | Schema/ |
| IDMS programs | IDMS Programs/ |
| Manually converted DB2 programs | DB2 Manual converted Programs/ |
| Mapping workbook or CSV | |
| Mapping sheets / header notes | |
| Previous phase/revision, for Phase 2 | |
| Human-answer folder | Human-in-Loops/ |
| Explicit exclusions | None supplied |
| Application source modifications | No |
| Execution mode | PRODUCTION_ANALYSIS |
| Simulated answers allowed | No |
| Test root, for an explicitly authorized rehearsal | |

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
| | | | |

## 3. Field mapping and datatype sources

| Setting | Value |
| --- | --- |
| IDMS record header | |
| IDMS field header | |
| DB2 schema header, if present | |
| DB2 table/record header | |
| DB2 column header | |
| Transformation / decommission-status headers | |
| Exact DCLGEN member naming rules, if any | |
| Mapping version / date | |

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
| Restart | | | | |
| Buffer | | | | |

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
| Fixed/free source format and encoding | |
| Precompile / bind options | |
| Coding-standard files | |
| Additional dependency roots | |
| Authorized precompile command/environment | |
| Authorized compile/link command/environment | |
| Authorized controlled tests and business reconciliation | |

Unperformed checks remain explicitly unperformed. Human answers clarify intended behavior; they do not certify that code was compiled, executed or proved correct.

## 8. Output and questions policy

- Phase 1 outputs: `Migration-Analysis/Phase-1/Run-NNN/`.
- Phase 2 outputs: `Migration-Analysis/Phase-2/Run-NNN/`.
- Shared human decisions: one question per Markdown file in `Migration-Analysis/Human-in-Loops/`.
- Create one program report per IDMS input file and four conditional generic guides: non-LRF retrieval; non-LRF update/restart; LRF retrieval; LRF update/restart.
- Ask only material, evidence-backed, program-specific IDMS-to-DB2 conversion questions. YES/NO is the default; options are rare; open questions are exceptional. Zero questions is valid.
- Do not ask the Mainframe COBOL team for the eight decommissioned record names or the Restart/Buffer replacement names. The user enters those in sections 4 and 5 above.
- Preserve all original application source files and all human answers.
- Cross-check each generic rule against every applicable program with conditions, scenarios and exceptions.
- Report validation actually performed. Do not claim compilation, execution or behavioral equivalence without evidence.
