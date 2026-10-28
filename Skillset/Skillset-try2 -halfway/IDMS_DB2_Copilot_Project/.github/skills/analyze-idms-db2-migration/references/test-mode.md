# Authorized rehearsal with simulated answers

Use this mode only when the user explicitly asks the analyst to answer the questions temporarily to exercise both phases. Normal production analysis never manufactures human answers.

## Isolation and sequence

1. Create a separate `tests/<sample-name>/` root. Keep supplied test inputs, hashes, config, every report, all questions, simulated answers, test results and Phase 2 revisions beneath it. Preserve source bytes and original filenames in a source manifest. The production input/output directories remain separate.
2. Execute the full Phase 1 analysis from source evidence. Issue actual questions with `Response state: UNANSWERED`. Snapshot these files and the completed Phase 1 tree before writing any test answers.
3. Answer each question only to exercise a documented test scenario. Write `Answer origin: SIMULATED_FOR_TEST` and identify the author as `Assistant — synthetic test fixture`, not a business owner. Do not claim an unavailable copybook, schema, catalog or execution result has been supplied. A missing artifact can remain deferred in the test.
4. Keep a manifest of each synthetic answer, scope, intended scenario and remaining production question. Use `SIMULATED_TEST_ASSUMPTION` as evidence type, `TEST_ASSUMPTION_ONLY` as review state and `RESOLVED_FOR_TEST_ONLY` or `OPEN` as the resolution. Always record `production_resolution: OPEN` for synthetic business answers. No synthetic answer is `HUMAN_CONFIRMED_INTENT` or `ACCEPTED_FOR_SCOPE`.
5. Execute Phase 2 against the exact frozen baseline and answer versions. Revise affected findings, scenarios and generic rules, then recheck the complete rule/program matrix. Material gaps and code defects remain visible. Do not merely copy Phase 1 and change its title.
6. Verify the unanswered baseline bytes are unchanged, all original source hashes still match, and every Phase 2 answer reference carries its origin and hash. Test both accepted test scenarios and unresolved cases.
7. Explain separately: artifact/workflow validation actually executed; source reasoning actually performed; hypothetical crash/replay scenarios evaluated; precompile/compile/Db2 execution not performed where unavailable. Never label a Python scenario model as execution of the COBOL.

## When real answers arrive

Start from the same questions and baseline in the real project, or explicitly import the test baseline after source/configuration revalidation. Replace synthetic sections only when the user supplies real answer text or asks for clean answer templates. Retain the synthetic snapshots. Set `Answer origin: HUMAN` for the actual supplied answer, retain its author/reference, and review it normally. Never infer that a synthetic answer became real merely because the project was copied or a mode flag changed.

## Findings that need special care

- A comment describing a commit interval is not proof the counter increments or that the boundary executes.
- For VARCHAR checkpoint data, trace the transmitted length as well as the copied data bytes. A full group MOVE does not prove the entire group is persisted.
- Preserve read, attempted, successful and committed counts separately until the business protocol proves reuse safe.
- SELECT projection must populate each field used later, including fields that `INITIALIZE` makes look harmless.
- Source set order and target `ORDER BY` need independent evidence. A generated row identifier is not automatically a legacy insertion or business sequence.
- Treat table names in the mapping and view/member names in DCLGEN separately. Similar suffixes do not prove view definitions or updatability.
- CSV quoted cells may span physical lines. Record logical row numbers and physical line ranges separately.
- Same file length does not imply duplicate programs. Compare content hashes, PROGRAM-ID and behavior.
- A text extension or non-UTF-8 source encoding does not make a COBOL member invalid. Retain the original encoding and physical evidence anchors.
- Validate each question's factual premise before inventing a test scenario. A missing parameter-input copybook cannot establish an output-record layout. When a synthetic draft is corrected, retain its prior snapshot/hash, document why it was superseded, and consume only the corrected version. Never rewrite the issued Phase 1 baseline.

## Copilot packaging

For a repository intended for GitHub Copilot, place one complete skill under `.github/skills/analyze-idms-db2-migration/`. Keep short repository guidance in `.github/copilot-instructions.md`. Optional `.github/prompts/*.prompt.md` wrappers should link to the canonical skill, not copy its rules. Verify current platform documentation before promising a particular prompt UI; provide a plain-text invocation fallback. The skill drives assistant analysis. A structural validator is not an automatic COBOL converter.
