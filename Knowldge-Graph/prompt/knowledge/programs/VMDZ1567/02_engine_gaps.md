# VMDZ1567: Engine output gap analysis

Analysis fingerprint: `cf5c6afece5a9b476f3ba2a9020821ddbd012fac5674fea7a850d16b2583a198`.

**Automated evidence inventory. Business equivalence is NOT established. No compiler or DB2 runtime validation is implied.**

The baseline excludes generated output and converter behavior. The gap track cannot establish its own expected behavior from the generated output.

## Input identities

| Role | File | Physical lines | SHA-256 |
|---|---|---:|---|
| idms | `mainframe/workspace/Program/VM1BD567.cbl` | 180 | `63d962f578de44209b7d30d0c56765f1c7d6e6b765d4d8e3b6553ac2e82f04cb` |
| manual | `mainframe/workspace/Manual Output/VMDZ1567.cbl` | 457 | `82edfcfed4a1310bffe8add589274f24a9cfd149d4788d5758c1b075f57e1f11` |
| generated | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl` | 445 | `93f17bc861f53eac5e97c18e4b9603730ccf1fb7ad18f3d5ea67559f6188f4ed` |
| copybook | `mainframe/workspace/Copybook/ESDATMAS.cpy` | 39 | `185019c004727a2754201ae1e8f6a272b0fe71de6b8141939118b4c01c752d06` |
| copybook | `mainframe/workspace/Copybook/VM9BC50I.cpy` | 65 | `20efbe9463f2a9eb361f946a0bac4bb629ec30f93ab7dae7487f2dfd65897deb` |
| copybook | `mainframe/workspace/Copybook/VM9BC50O.cpy` | 394 | `7d451f980d1a26c782b19aa96c70842e8a9d87603e0706616a08fed905780da5` |
| copybook | `mainframe/workspace/Copybook/VMBD05.cpy` | 322 | `530ffd3397f3c6fb680cf21d0dd60fa12bc34fb66d105ea816dc03646ae0e27c` |
| copybook | `mainframe/workspace/Copybook/VMBD205I.cpy` | 1414 | `80e1aa6b784c0fa192ebe27b3b03af9240cd0a0605574ed2179e77c265bd4dfb` |
| copybook | `mainframe/workspace/Copybook/VMBD510I.cpy` | 1632 | `9c86827c5a2a49f2c69b11ad987645beb641a6dce53c7c41fd3006746075c03a` |
| copybook | `mainframe/workspace/Copybook/VMBZ270I.cpy` | 23 | `db441dd9e51644d5e7edbcf1829916da454881d535cce510ed207c2bcdb1f193` |
| dclgen | `mainframe/workspace/DCLGen/DZ01RSTV.txt` | 36 | `60ae42a6c7a29185e8230972a5527a232a428f1686d2b90c6a4ec1092abfe342` |
| dclgen | `mainframe/workspace/DCLGen/DZBEFFTV.txt` | 62 | `1398746545f2fb02970f3d6838cd1e420b0ae56adec1bdd4bd49d25d1d22e6f8` |
| dclgen | `mainframe/workspace/DCLGen/DZBFARTV.txt` | 120 | `5cacab9f737c4972f5a6b7aa18212d2322dc5be3b007215a76b630888d7fcb8a` |
| dclgen | `mainframe/workspace/DCLGen/DZBFASTV.txt` | 196 | `00d7e8a369335eaf59644707b4a7f606d8aff550fea8902d1ad17437532f7e3d` |
| dclgen | `mainframe/workspace/DCLGen/DZEVEFTV.txt` | 50 | `acf0d8764ef53ecd00ae763c18bf26d209bb93099666983aaf98c4d2241f70da` |
| dclgen | `mainframe/workspace/DCLGen/DZSIASTV.txt` | 26 | `3ca4890e7d2612e213cdd0cc509a5391f9b698b7815e7b29b2451decae791439` |
| dclgen | `mainframe/workspace/DCLGen/DZWCEFTV.txt` | 28 | `93336302528ec4d2459101f71f7504f0f717e4a7443a833179287ce1538654e7` |
| mapping | `mainframe/workspace/Mapping Sheet/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` | 877 | `1b093ae9f5527a7d4f0a7828bf6750ed703508aa38e666e8e209b17c823589cf` |
| subschema | `mainframe/workspace/Subschema/VMBTS03.txt` | 112 | `a1578229fa9086afc8b074cbd526c256099c1ddecfacf30acf5aaa64bdef6fdd` |
| subschema | `mainframe/workspace/Subschema/VMBTS06.txt` | 815 | `40b9b0048afa4e15b939f8a643e04496783084becffb4af42ea4f398b13cd3a0` |
| subschema | `mainframe/workspace/Subschema/VMBTS07.txt` | 191 | `afb3f285d544a5143adb721cbc15637a6fc485ea4f9abdb8e69aeda9a7085ba4` |
| engine_log | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/engine.log` | 52 | `17c1493211b5c222a167fb2bf6d352ff7c9387eefb4768cdfc1b206cad59e9ff` |
| engine_review | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Review/VMDZ1567_27-10-2026_003335_27-10-2026_003345.csv` | 156 | `6ceb0c44a8ff0c5b9db2267ea35c63983b6c4000296a2cb03774ad6938926764` |
| engine_review | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Review/VMDZ1567_27-10-2026_003335_27-10-2026_003345.txt` | 114 | `3b49c04eb109bd64e2ee3bd8ffb9a187554558fc33fa347afd6f6eadfa8d892d` |
| engine_review | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Review/semantic_release_gate.txt` | 21 | `21d6192febd41b60567937bfbe312a27dd028771d9105819ae8316d200603c4b` |
| derived_copybook | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/Generated Copybooks/VMDZ205I.cpy` | 1414 | `2833e918d09b4ac3d0869bfe5aa747da130f01220dcecd767f77f4a57986f593` |
| derived_copybook | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/Generated Copybooks/VMDZ270I.cpy` | 23 | `dc180b0c545c1017260f0fdba657ffbbc0d0464c3d1038a1cf9558bce0fef74b` |
| derived_copybook | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/Generated Copybooks/VMDZ510I.cpy` | 1632 | `66b815b9d71c3c87cc42f8c44d5fab4e95bb2c97a47a54014202968cc89626b3` |
| engine_receipt | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/receipt.json` | 954 | `8253fcced5d83d676932314cde25743fc623222c70d234d63f2dc953a8833659` |

Generation provenance: `{'documented_engine_hash_matches': True, 'engine_exit_code': 2, 'original_input_hashes_match': True, 'production_approved': False, 'status': 'BOUND_CAPTURE_RECEIPT'}`. A bound receipt records a run, not a successful conversion or business equivalence.


Physical line numbers refer to decoded files before formatting. Sequence columns are not line numbers. Snapshots are immutable and referenced in the companion JSON.

## Program evidence summaries

### idms: VM1BD567

Observed: 3 paragraph/section labels, 4 out-of-line PERFORM sites, 0 EXEC SQL blocks.
Verb inventory: `{'ADD': 2, 'CLOSE': 1, 'COMMIT': 1, 'ELSE': 1, 'END-IF': 3, 'FIND': 2, 'FINISH': 1, 'IF': 3, 'MODIFY': 3, 'MOVE': 25, 'OBTAIN': 2, 'OPEN': 1, 'PERFORM': 4, 'READ': 1, 'READY': 1, 'STOP': 1, 'STORE': 1}`.
SQL inventory: `{}`.

| Caller | PERFORM target | THROUGH endpoint | Source lines |
|---|---|---|---|
| `<mainline>` | `READ-FLAT-FILE` | `-` | L118-L120 |
| `<mainline>` | `READ-FLAT-FILE` | `-` | L133-L133 |
| `<mainline>` | `VERWERKING` | `-` | L136-L136 |
| `VERWERKING` | `READ-FLAT-FILE` | `-` | L170-L170 |

This is not a reachability proof. Paragraph numbering, PERFORM THRU boundaries, fall-through, SECTION scope and external routines must be reviewed separately.

SQL inventory (complete blocks and projections are in the companion JSON):

| Kind | Tables | Lines | Projection items |
|---|---|---|---:|

Extraction limitations:

- Lexical inventory only; no COPY expansion, full CFG, byte-layout proof, compiler, or runtime execution.
- Unclassified procedure text at line 180; inspect original source.

### manual: VMDZ1567

Observed: 12 paragraph/section labels, 18 out-of-line PERFORM sites, 10 EXEC SQL blocks.
Verb inventory: `{'ADD': 3, 'CALL': 1, 'CLOSE': 1, 'CONTINUE': 4, 'DISPLAY': 17, 'ELSE': 2, 'END-EVALUATE': 6, 'END-IF': 4, 'END-PERFORM': 1, 'EVALUATE': 6, 'IF': 5, 'INITIALIZE': 4, 'MOVE': 52, 'OPEN': 1, 'PERFORM': 18, 'READ': 1, 'SET': 1, 'STOP': 1, 'WHEN': 14}`.
SQL inventory: `{'COMMIT': 1, 'INCLUDE': 5, 'INSERT': 1, 'SELECT': 1, 'UPDATE': 2}`.

| Caller | PERFORM target | THROUGH endpoint | Source lines |
|---|---|---|---|
| `<mainline>` | `820000-GET-TIMESTAMP` | `-` | L162-L162 |
| `<mainline>` | `700-RESTART-CONTROL` | `-` | L178-L178 |
| `<mainline>` | `READ-FLAT-FILE` | `-` | L180-L180 |
| `<mainline>` | `1000-VERWERKING` | `-` | L182-L182 |
| `<mainline>` | `800-PROCESS-COMMIT` | `-` | L184-L184 |
| `1000-VERWERKING` | `1100-UPDATE-VMBFAR` | `-` | L228-L228 |
| `1000-VERWERKING` | `800-PROCESS-COMMIT` | `-` | L231-L231 |
| `1000-VERWERKING` | `READ-FLAT-FILE` | `-` | L234-L234 |
| `700-RESTART-CONTROL` | `700-SELECT-DZ01RSTV` | `-` | L274-L274 |
| `710-JOB-IS-RESTART` | `810000-CALL-USERABEN` | `-` | L295-L295 |
| `710-JOB-IS-RESTART` | `READ-FLAT-FILE` | `-` | L298-L298 |
| `720-WRITE-RESTART-REC` | `700-INSERT-DZ01RSTV` | `-` | L317-L318 |
| `800-PROCESS-COMMIT` | `700-UPDATE-DZ01RSTV` | `-` | L338-L338 |
| `800-PROCESS-COMMIT` | `SQLERROR` | `-` | L348-L348 |
| `700-SELECT-DZ01RSTV` | `SQLERROR` | `-` | L385-L385 |
| `700-UPDATE-DZ01RSTV` | `SQLERROR` | `-` | L406-L406 |
| `700-INSERT-DZ01RSTV` | `SQLERROR` | `-` | L422-L422 |
| `1100-UPDATE-VMBFAR` | `SQLERROR` | `-` | L449-L449 |

This is not a reachability proof. Paragraph numbering, PERFORM THRU boundaries, fall-through, SECTION scope and external routines must be reviewed separately.

SQL inventory (complete blocks and projections are in the companion JSON):

| Kind | Tables | Lines | Projection items |
|---|---|---|---:|
| INCLUDE | `` | L143-L143 | 0 |
| INCLUDE | `` | L144-L144 | 0 |
| INCLUDE | `` | L147-L147 | 0 |
| INCLUDE | `` | L148-L148 | 0 |
| COMMIT | `` | L340-L342 | 0 |
| SELECT | `DZ01RSTV` | L359-L377 | 6 |
| UPDATE | `DZ01RSTV` | L391-L399 | 0 |
| INSERT | `DZ01RSTV` | L412-L415 | 0 |
| UPDATE | `DZBFARTV` | L430-L442 | 0 |
| INCLUDE | `` | L454-L456 | 0 |

Extraction limitations:

- Lexical inventory only; no COPY expansion, full CFG, byte-layout proof, compiler, or runtime execution.
- Debug indicator lines exist; compiler debug mode is not established.

### generated: VMDZ1567

Observed: 12 paragraph/section labels, 18 out-of-line PERFORM sites, 10 EXEC SQL blocks.
Verb inventory: `{'ADD': 3, 'CALL': 1, 'CLOSE': 1, 'CONTINUE': 4, 'DISPLAY': 20, 'ELSE': 2, 'END-EVALUATE': 6, 'END-IF': 5, 'END-PERFORM': 1, 'EVALUATE': 6, 'IF': 5, 'INITIALIZE': 4, 'MOVE': 57, 'OPEN': 1, 'PERFORM': 18, 'READ': 1, 'SET': 1, 'STOP': 1, 'WHEN': 14}`.
SQL inventory: `{'COMMIT': 1, 'INCLUDE': 5, 'INSERT': 1, 'SELECT': 1, 'UPDATE': 2}`.

| Caller | PERFORM target | THROUGH endpoint | Source lines |
|---|---|---|---|
| `<mainline>` | `600-GET-TIMESTAMP` | `-` | L168-L168 |
| `<mainline>` | `700-RESTART-CONTROL` | `-` | L183-L183 |
| `<mainline>` | `READ-FLAT-FILE` | `-` | L185-L185 |
| `<mainline>` | `VERWERKING` | `-` | L187-L187 |
| `<mainline>` | `800-PROCESS-COMMIT` | `-` | L189-L189 |
| `VERWERKING` | `1100-UPDATE-DZBFAR` | `-` | L217-L217 |
| `VERWERKING` | `800-PROCESS-COMMIT` | `-` | L223-L223 |
| `VERWERKING` | `READ-FLAT-FILE` | `-` | L226-L226 |
| `1100-UPDATE-DZBFAR` | `SQLERROR` | `-` | L282-L282 |
| `700-RESTART-CONTROL` | `700-SELECT-DZ01RSTV` | `-` | L297-L297 |
| `700-SELECT-DZ01RSTV` | `SQLERROR` | `-` | L337-L337 |
| `700-UPDATE-DZ01RSTV` | `SQLERROR` | `-` | L360-L360 |
| `700-INSERT-DZ01RSTV` | `SQLERROR` | `-` | L378-L378 |
| `710-JOB-IS-RESTART` | `810000-CALL-USERABEN` | `-` | L389-L389 |
| `710-JOB-IS-RESTART` | `READ-FLAT-FILE` | `-` | L391-L391 |
| `720-WRITE-RESTART-REC` | `700-INSERT-DZ01RSTV` | `-` | L409-L409 |
| `800-PROCESS-COMMIT` | `700-UPDATE-DZ01RSTV` | `-` | L428-L428 |
| `800-PROCESS-COMMIT` | `SQLERROR` | `-` | L440-L440 |

This is not a reachability proof. Paragraph numbering, PERFORM THRU boundaries, fall-through, SECTION scope and external routines must be reviewed separately.

SQL inventory (complete blocks and projections are in the companion JSON):

| Kind | Tables | Lines | Projection items |
|---|---|---|---:|
| INCLUDE | `` | L51-L51 | 0 |
| INCLUDE | `` | L117-L117 | 0 |
| INCLUDE | `` | L118-L118 | 0 |
| INCLUDE | `` | L119-L119 | 0 |
| UPDATE | `DZBFARTV` | L262-L276 | 0 |
| INCLUDE | `` | L287-L289 | 0 |
| SELECT | `DZ01RSTV` | L311-L329 | 6 |
| UPDATE | `DZ01RSTV` | L345-L353 | 0 |
| INSERT | `DZ01RSTV` | L368-L371 | 0 |
| COMMIT | `` | L431-L433 | 0 |

Extraction limitations:

- Lexical inventory only; no COPY expansion, full CFG, byte-layout proof, compiler, or runtime execution.

## Comparison leads, not confirmed defects

### LEAD-0894f7e81ebf05: idms: dependency not available by exact member name: IDMS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Program/VM1BD567.cbl:L104-L104` (SHA-256 `63d962f578de4420...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-126035603c35b7: idms: dependency not available by exact member name: IDMS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Program/VM1BD567.cbl:L180-L180` (SHA-256 `63d962f578de4420...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-18dcebc1ddce48: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L348-L348` (SHA-256 `82edfcfed4a1310b...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-2d3443fba70ff6: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L385-L385` (SHA-256 `82edfcfed4a1310b...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-f23556e1c444f8: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L406-L406` (SHA-256 `82edfcfed4a1310b...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-53ed8d4e1753f8: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L422-L422` (SHA-256 `82edfcfed4a1310b...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-946e8183744a1e: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L449-L449` (SHA-256 `82edfcfed4a1310b...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-c9633b72a88fb2: manual: dependency not available by exact member name: SQLERRWS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L143-L143` (SHA-256 `82edfcfed4a1310b...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-b3f86864bda377: manual: dependency not available by exact member name: SQLCA

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L144-L144` (SHA-256 `82edfcfed4a1310b...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-96abe7b91c5e0f: manual: dependency not available by exact member name: SQLERROR

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L454-L454` (SHA-256 `82edfcfed4a1310b...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-21b088d24a9445: generated: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L282-L282` (SHA-256 `93f17bc861f53eac...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-f32bcef86aeca7: generated: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L337-L337` (SHA-256 `93f17bc861f53eac...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-8c1e6afa3d0d9e: generated: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L360-L360` (SHA-256 `93f17bc861f53eac...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-d28391724bdd4f: generated: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L378-L378` (SHA-256 `93f17bc861f53eac...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-de42e6634be89d: generated: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L440-L440` (SHA-256 `93f17bc861f53eac...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-6a5a837df1ef62: generated: dependency not available by exact member name: SQLERRWS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L117-L117` (SHA-256 `93f17bc861f53eac...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-992f6d24780dbe: generated: dependency not available by exact member name: SQLCA

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L118-L118` (SHA-256 `93f17bc861f53eac...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-3bdf6236d81f53: generated: dependency not available by exact member name: SQLERROR

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L287-L287` (SHA-256 `93f17bc861f53eac...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-53220ca247e9a4: Manual/generated UPDATE blocks differ lexically

Topic: `access_sql`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/05_SQL_CURSOR_AND_BUSINESS_FLOW.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L391-L399` (SHA-256 `82edfcfed4a1310b...`)
- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L430-L442` (SHA-256 `82edfcfed4a1310b...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L262-L276` (SHA-256 `93f17bc861f53eac...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L345-L353` (SHA-256 `93f17bc861f53eac...`)
generated_blocks: 2
manual_blocks: 2
qualification: Projection ordering, QUERYNO, host spelling or equivalent strategies can explain differences. Map by operation, keys and effect.

### LEAD-046726b5bf59b1: Manual/generated EVALUATE/IF/WHEN statements need effect-level comparison

Topic: `business_conditions`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/05_SQL_CURSOR_AND_BUSINESS_FLOW.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L203-L203` (SHA-256 `82edfcfed4a1310b...`)
- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L230-L230` (SHA-256 `82edfcfed4a1310b...`)
- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L245-L246` (SHA-256 `82edfcfed4a1310b...`)
- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L276-L276` (SHA-256 `82edfcfed4a1310b...`)
- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L277-L277` (SHA-256 `82edfcfed4a1310b...`)
- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L278-L278` (SHA-256 `82edfcfed4a1310b...`)
- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L279-L279` (SHA-256 `82edfcfed4a1310b...`)
- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L293-L294` (SHA-256 `82edfcfed4a1310b...`)
- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L331-L332` (SHA-256 `82edfcfed4a1310b...`)
- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L343-L343` (SHA-256 `82edfcfed4a1310b...`)
- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L344-L344` (SHA-256 `82edfcfed4a1310b...`)
- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L346-L346` (SHA-256 `82edfcfed4a1310b...`)
- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L379-L379` (SHA-256 `82edfcfed4a1310b...`)
- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L380-L380` (SHA-256 `82edfcfed4a1310b...`)
- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L381-L381` (SHA-256 `82edfcfed4a1310b...`)
- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L383-L383` (SHA-256 `82edfcfed4a1310b...`)
- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L401-L401` (SHA-256 `82edfcfed4a1310b...`)
- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L402-L402` (SHA-256 `82edfcfed4a1310b...`)
- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L404-L404` (SHA-256 `82edfcfed4a1310b...`)
- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L417-L417` (SHA-256 `82edfcfed4a1310b...`)
- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L418-L418` (SHA-256 `82edfcfed4a1310b...`)
- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L420-L420` (SHA-256 `82edfcfed4a1310b...`)
- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L444-L444` (SHA-256 `82edfcfed4a1310b...`)
- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L445-L445` (SHA-256 `82edfcfed4a1310b...`)
- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L447-L447` (SHA-256 `82edfcfed4a1310b...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L203-L203` (SHA-256 `93f17bc861f53eac...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L222-L222` (SHA-256 `93f17bc861f53eac...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L234-L235` (SHA-256 `93f17bc861f53eac...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L277-L277` (SHA-256 `93f17bc861f53eac...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L278-L278` (SHA-256 `93f17bc861f53eac...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L280-L280` (SHA-256 `93f17bc861f53eac...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L299-L299` (SHA-256 `93f17bc861f53eac...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L300-L300` (SHA-256 `93f17bc861f53eac...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L301-L301` (SHA-256 `93f17bc861f53eac...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L302-L302` (SHA-256 `93f17bc861f53eac...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L331-L331` (SHA-256 `93f17bc861f53eac...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L332-L332` (SHA-256 `93f17bc861f53eac...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L333-L333` (SHA-256 `93f17bc861f53eac...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L335-L335` (SHA-256 `93f17bc861f53eac...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L355-L355` (SHA-256 `93f17bc861f53eac...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L356-L356` (SHA-256 `93f17bc861f53eac...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L358-L358` (SHA-256 `93f17bc861f53eac...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L373-L373` (SHA-256 `93f17bc861f53eac...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L374-L374` (SHA-256 `93f17bc861f53eac...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L376-L376` (SHA-256 `93f17bc861f53eac...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L387-L388` (SHA-256 `93f17bc861f53eac...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L418-L419` (SHA-256 `93f17bc861f53eac...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L435-L435` (SHA-256 `93f17bc861f53eac...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L436-L436` (SHA-256 `93f17bc861f53eac...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L438-L438` (SHA-256 `93f17bc861f53eac...`)
generated_statements: 25
manual_statements: 25
qualification: Not a missing-logic verdict. Helpers, numbering, control restructuring or SQL filtering may preserve behavior.

### LEAD-0574c7019d7325: Same-name declaration differs: KY-RESTART

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L56-L56` (SHA-256 `82edfcfed4a1310b...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L61-L61` (SHA-256 `93f17bc861f53eac...`)
generated: PIC X(1200) VALUE SPACES.
manual: PIC X(1200).
qualification: Review type/representation and data flow; level numbers and field names alone do not establish equivalence.

### LEAD-116fa3535e961e: Same-name declaration differs: NB-READ

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L55-L55` (SHA-256 `82edfcfed4a1310b...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L60-L60` (SHA-256 `93f17bc861f53eac...`)
generated: PIC 9(15) VALUE ZERO.
manual: PIC 9(15).
qualification: Review type/representation and data flow; level numbers and field names alone do not establish equivalence.

### LEAD-4a2bc87e67afb1: Same-name declaration differs: SW-VMDZ205I

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L49-L49` (SHA-256 `82edfcfed4a1310b...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L54-L54` (SHA-256 `93f17bc861f53eac...`)
generated: PIC X VALUE 'N'.
manual: PIC X.
qualification: Review type/representation and data flow; level numbers and field names alone do not establish equivalence.

### LEAD-5a6cf559808df4: Same-name declaration differs: WS-INPUT-KASBONS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1567.cbl:L58-L58` (SHA-256 `82edfcfed4a1310b...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1567_27-10-2026_003335.cbl:L62-L62` (SHA-256 `93f17bc861f53eac...`)
generated: PIC X(1200) VALUE SPACES.
manual: PIC X(1200).
qualification: Review type/representation and data flow; level numbers and field names alone do not establish equivalence.

## Mandatory semantic coverage

| Topic | Review status |
|---|---|
| purpose_io | NOT_REVIEWED |
| lr_idms_expansion | NOT_REVIEWED |
| access_sql | NOT_REVIEWED |
| keys_relationships | NOT_REVIEWED |
| cursor_control | NOT_REVIEWED |
| business_conditions | NOT_REVIEWED |
| fields_layout | NOT_REVIEWED |
| dates_nulls | NOT_REVIEWED |
| status_errors | NOT_REVIEWED |
| transactions_restart | NOT_REVIEWED |
| paragraph_wiring | NOT_REVIEWED |
| validation | NOT_REVIEWED |

There are 15 primary-source chunks. An AI must read every relevant chunk and dependencies; a short report is not a claim that all paths were analyzed.

## Human/AI semantic review pending

Use `packet` to prepare the bounded source-reading task, then `review-import` to attach a source-cited review. Do not hand-edit generated reports; keep draft Markdown in prompt/temp/.

## Production decision

**NOT CERTIFIED.** This knowledge collector never grants deployment approval. Confirmed reference behavior, target metadata, compiler output, and same-input runtime results remain separate evidence obligations.
