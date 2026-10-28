# Primary product references

Use these as starting points for version-specific verification. These are vendor documentation, not evidence about an individual supplied program. The IDMS bookshelf is release 18.5; IBM links identify Db2 12 or 13 for z/OS. Do not silently assume those are the user's versions. If a documentation page cannot be opened, use an official indexed excerpt or a supplied version-matched manual and disclose any remaining uncertainty.

## IDMS and Logical Record Facility

| Source | Analysis it supports |
| --- | --- |
| [Broadcom: DML COBOL statement reference](https://ftpdocs.broadcom.com/cadocs/0/CA%20IDMS%2018%205%20User%20Bookshelf-ENU/Bookshelf_Files/HTML/IDMS_DML_COBOL_Ref_ENU/949156.html) | Check each actual statement's access mode, record transfer, currency, status and transaction effects. |
| [Broadcom: How LRF works](https://ftpdocs.broadcom.com/cadocs/0/CA%20IDMS%2018%205%20User%20Bookshelf-ENU/Bookshelf_Files/HTML/IDMS_Logical_Record_Facility_ENU/1246340.html) | Resolve the LR definition, selected path, path DML and returned path status from the subschema. |
| [Broadcom: LRF preliminary analysis and design](https://ftpdocs.broadcom.com/cadocs/0/CA%20IDMS%2018%205%20User%20Bookshelf-ENU/Bookshelf_Files/HTML/IDMS_Logical_Record_Facility_ENU/1245865.html) | First-matching-path selection, path/program predicates, partial logical records, FIND/OBTAIN differences and initialization. |
| [Broadcom: COBOL LRF WHERE](https://ftpdocs.broadcom.com/cadocs/0/CA%20IDMS%2018%205%20User%20Bookshelf-ENU/Bookshelf_Files/HTML/IDMS_DML_COBOL_Ref_ENU/1383728.html) | Keyword routing, boolean conditions, OF LR value lifetime and IDMS pattern matching. |
| [Broadcom: LRF currency considerations](https://ftpdocs.broadcom.com/cadocs/0/CA%20IDMS%2018%205%20User%20Bookshelf-ENU/Bookshelf_Files/HTML/IDMS_Logical_Record_Facility_ENU/1246334.html) | Independent path-group currencies, iteration, RESET/NO RESET and events that clear saved currencies. |
| [Broadcom: Erasing records](https://ftpdocs.broadcom.com/cadocs/0/CA%20IDMS%2018%205%20User%20Bookshelf-ENU/Bookshelf_Files/HTML/IDMS_Navigational_DML_ENU/1194825.html) | Analyze ERASE variants and descendant/relationship effects individually. |
| [Broadcom: Membership options](https://ftpdocs.broadcom.com/cadocs/0/CA%20IDMS%2018%205%20User%20Bookshelf-ENU/Bookshelf_Files/HTML/IDMS_Database_Design_ENU/985756.html) | Distinguish mandatory/optional and automatic/manual membership. |
| [Broadcom: COMMIT versus COMMIT ALL](https://knowledge.broadcom.com/external/article/225298) | Preserve different lock and currency effects rather than treating the two forms as identical. |

## Db2 and COBOL integration

| Source | Analysis it supports |
| --- | --- |
| [IBM Db2 12: DCLGEN command](https://www.ibm.com/docs/en/db2-for-zos/12.0.0?topic=commands-dclgen-dsn) | SQL column underscores can become COBOL hyphens; generated prefixes and binary representations require exact declaration inspection. |
| [IBM Db2 13: DCLGEN panel](https://www.ibm.com/docs/en/db2-for-zos/13.0.0?topic=gtvdbud-generating-table-view-declarations-by-using-dclgen-from-db2i) | Distinguish table identity, structure name, host field prefix/suffix and generated indicator choices. |
| [IBM Db2 13: Declaring COBOL host/indicator variables](https://www.ibm.com/docs/en/db2-for-zos/13.0.0?topic=statements-declaring-host-variables-indicator-variables-in-cobol) | Validate supported host declarations and OCCURS contexts. |
| [IBM Db2 13: COBOL host variables](https://www.ibm.com/docs/en/db2-for-zos/13.0.0?topic=cobol-host-variables-in) | Inspect permitted layouts, REDEFINES limitations and varying-length structures for the actual environment. |
| [IBM Db2 12: Null or truncated retrieved values](https://www.ibm.com/docs/en/db2-for-zos/12.0.0?topic=uhviss-determining-whether-retrieved-value-in-host-variable-is-null-truncated) | A null result needs correct indicator handling; the associated host value can remain unchanged. |
| [IBM Db2 13: SQLCA](https://www.ibm.com/docs/en/db2-for-zos/13.0.0?topic=sql-communication-area-sqlca) | Subsequent SQL updates diagnostic state; declaration requirements depend on precompile options. |
| [IBM Db2 13: Held/non-held cursors](https://www.ibm.com/docs/en/db2-for-zos/13.0.0?topic=cursors-held-non-held) | Assess COMMIT effects, closure and lost cursor position after abnormal termination. |
| [IBM Db2 13: SQLCODE +100](https://www.ibm.com/docs/en/db2-for-zos/13.0.0?topic=codes-100) | Interpret no-data and partial-rowset outcomes in their statement-specific context. |

## Applying the sources

Attach a vendor reference to a claim about platform behavior and a source-code/schema/mapping reference to a claim about a supplied migration. State explicitly when a recommendation is an inference from those sources. Preserve user business requirements; flag conflicts with platform constraints rather than silently changing the business rule.
