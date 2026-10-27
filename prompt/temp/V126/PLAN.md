# Fetch inventory implementation

Implement one maintained Excel inventory under workspace Review, emitted by fetch.
Reuse the existing program/dependency/subschema resolution path. The dormant text
manifest currently imports undefined constants and has no pipeline caller.

Columns: IDMS Program Name, Copybook, DCLGENs, Sub Schema, Mode.
Maintain one row per member and upsert selected programs. Preserve unselected rows.
Missing/unreadable sources must not be presented as Retrieval. Comments carry
source/evidence and missing-member diagnostics. Track declared dependencies even
when fetch fails. Keep the workbook across conversion cleanup.

Offline workspace rebuild must not contact the mainframe. Tests use isolated
workspaces and fake library downloads, including six sample inputs and 75 members.
No changes to conversion logic, COBOL inputs, mapping, or manual references.
