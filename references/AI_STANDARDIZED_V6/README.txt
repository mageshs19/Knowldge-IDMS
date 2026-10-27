IDMS-to-DB2 COBOL Standardization — V6

Contents:
  VMDZ1526.cbl
  VMDZ1567.cbl
  VMDZ4302.cbl
  VMDZ4310.cbl
  VMDZ4420.cbl
  VMDZ7200.cbl
  HELPER_VARIABLE_AUDIT.json
  STATIC_VALIDATION_REPORT.json
  LIFECYCLE_REWORK_VALIDATION.json

V4 lifecycle cleanup:
- Kept 0000-MAIN-PROCEDURE and the three lifecycle entry paragraphs: 1000-INITIALIZE-PROGRAM, 2000-PROCESS-PROGRAM, and 3000-FINALIZE-PROGRAM.
- Removed the redundant 1050-INITIALIZE-DETAILS, 2050-PROCESS-DETAILS, and 3050-FINALIZE-DETAILS forwarding paragraphs in all six programs.
- Moved the original detail paragraph bodies directly under their corresponding lifecycle paragraphs. The statements inside those bodies were retained; this removes one unnecessary PERFORM hop without rewriting the business operations.
- Kept meaningful operational paragraphs (for example, initialization routines, cursor open/fetch/close routines, processing routines, commit/restart logic, and finalization routines) where they do real work.
- Regenerated fixed-format sequence fields: columns 1–6 step by 10 and columns 73–80 step by 10000. Source columns 7–72 are preserved from the reworked lines.

Prior V3 standards carried forward:
- CS-PROGRAM usage for PROGRAM-NAME assignments.
- SQL-LOCATION handling and SQLERRWS ownership as recorded in the prior validation/audit.
- Previously audited helper-variable removals and direct normalized date/stock-field moves.

Validation:
- See STATIC_VALIDATION_REPORT.json and LIFECYCLE_REWORK_VALIDATION.json.
- Static checks cover fixed-format width and sequence numbering, paragraph removal, duplicate labels, lifecycle controller presence, and preservation of SQL/COPY/CALL counts relative to V3.
- No target COBOL compiler or DB2 precompiler was available. Compile/precompile success is NOT claimed; run the site's standard compiler and DB2 precompiler with the correct COPY/INCLUDE libraries before promotion.

V5 CURSOR NUMBERING AND SQL ERROR HANDLING
------------------------------------------
For programs with two cursors, cursor 1 uses 2100 OPEN, 2200 FETCH, 2300 CLOSE;
cursor 2 uses 2400 OPEN, 2500 FETCH, 2600 CLOSE. Processing calls these
operations in the existing parent/child order. VMDZ7200 has one cursor and uses
2100 OPEN, 2200 FETCH, 2300 CLOSE; its record-handling paragraph is numbered
2700 to avoid a collision with cursor 1 CLOSE. Each cursor SQL operation sets
SQL-LOCATION to its operation number and calls the shared SQLERROR routine for
unexpected SQLCODEs. SQLCODE 100 remains the normal end-of-cursor case for FETCH.

Validation is static only. A target COBOL compile and DB2 precompile have not been run.


V6 CURSOR IDENTITY, NUMBERING, AND ERROR-HANDLING STANDARD
--------------------------------------------------------
Cursor numbering follows cursor identity, not table name alone:
  C1: OPEN 2100, FETCH 2200, CLOSE 2300
  C2: OPEN 2400, FETCH 2500, CLOSE 2600
  C3: OPEN 2700, FETCH 2800, CLOSE 2900
  Continue with another block of three operation numbers per cursor.

VMDZ4302 and VMDZ4420 contain parent cursor DZBEFFC1 (C1) and child cursor
DZEVEFC2 (C2). The child cursor declaration, OPEN/FETCH/CLOSE statements,
end-of-cursor flags, paragraph calls, and diagnostic text use C2 consistently.
VMDZ7200 has one cursor (C1); its CLOSE and SQL-LOCATION are 2300. The other
three programs have no declared SQL cursors in these sources; their non-cursor
SQL operations retain operation-specific SQL-LOCATION values.

Each runtime cursor operation sets SQL-LOCATION to its assigned number, checks
SQLCODE, treats FETCH SQLCODE 100 as end-of-cursor, and routes unexpected SQL
errors through the shared SQLERROR include/routine. Parent/child execution order
and existing processing conditions are retained.

Validation is static only. No target COBOL compiler or DB2 precompiler was run.
