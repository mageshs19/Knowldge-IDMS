# V125 two-system knowledge workflow: validation

## Scope

Added a portable System 2 knowledge collector and a System 1 handoff workflow.
The converter implementation is unchanged from the V124/V123 snapshot. This is
not a fix for its existing business or metadata defects and not a production
certification. The actual 75-program production corpus was not supplied.

## Executed checks

| Check | Observed result |
|---|---|
| New knowledge tool unit/regression suite | 52 passed |
| Existing documentation-tool suite | 16 passed |
| Portable prompt-only kit suite rerun | Same 52 tests passed |
| Real supplied corpus | Six explicit pairs; two dossiers each (12 total) |
| Incremental rerun | All 12 unchanged dossiers reused |
| Synthetic population | 75 explicit pairs -> 150 dossiers; subsequent reuse of all 150 |
| Frozen real engine run | Six candidates; pipeline exit 2; all six structural reviews REJECTED |
| Original source/reference metadata assets | 30/30 raw-byte hashes unchanged |
| Existing Python engine/test sources | 1,025/1,025 raw-byte hashes unchanged |
| Existing non-prompt/non-readme files | 1,292 unchanged |
| Evidence freshness checker | PASS for 12 dossiers |
| Tool/module documentation freshness | PASS; eight tool/test notes |
| Full workspace documentation checker | PASS; 1,025 existing module notes |
| Sample handoff verification | PASS; all 81 payload files match manifest hashes |
| Mainframe compilation and DB2 runtime | Not performed |
| AI-authored semantic reviews of the 75 programs | Not performed; prompts/workflow supplied |

The 75-pair test is synthetic infrastructure coverage, not 75 real conversion
validations. A clean knowledge CLI exit means report processing succeeded, not
that any program is semantically equivalent. The fresh engine receipt is
`prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/receipt.json` and contains the original input and engine source identities.

## Safeguards exercised

Independent Track A fingerprints exclude generated output and engine identity.
Track B includes them and binds reviewed conclusions to the exact baseline review.
Tests cover strict encoding errors, unsafe paths, wrong/duplicate member identity,
missing engine output, corrupted snapshots, stale-source refusal, forged evidence
hashes/ranges, incomplete source coverage, missing baseline review, oversized
packets without truncation, report preservation and hash-checked handoff export.
The engine adapter tests cover plan-only execution, retained nonzero review exit,
timeout and refusal without a complete engine. A failed run clears stale active
candidate references while retaining history. No fetch/upload is selected.

## Remaining boundaries

Automatic COBOL/SQL extraction is a partial lexical inventory, not a compiler or
complete semantic/control-flow analyzer. The included AI prompts require a human/
approved AI to review every primary chunk, relevant dependencies and twelve topics.
Imported reviewer identity and coverage are declarations, not authenticated proof.
Manual code can itself conflict with IDMS or target metadata. Such conflicts remain
visible; repeated examples never automatically become approved common rules.

The portable kit holds documentation snapshots, not the converter implementation.
Fresh conversion requires an authorized complete engine plus its dependencies, or
captured outputs/receipts from System 1. Proprietary source is not sent to any AI
API by the tools. Transfer source evidence only through approved internal channels.

All temporary Markdown resides in prompt/temp/. Durable workflow/logic notes,
program dossiers and rule catalogs reside under prompt/. Both readme files retain
the requirement to update corresponding documentation with Python changes.
