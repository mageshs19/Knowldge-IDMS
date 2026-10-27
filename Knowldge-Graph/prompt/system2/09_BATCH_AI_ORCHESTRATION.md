# Reusable batch instructions for the AI on each machine

Use an organization's approved AI that can read this local workspace and, where
available, run the local Python commands. These instructions do not invoke a model
API or create background work. Checkpoint current progress in files between sessions.

## System 2 task A: independent knowledge of all registered pairs

Read readme.md, prompt/system2/00_START_SYSTEM2.md and the baseline review prompt.
Validate the explicit program manifest and expected count. Build baseline dossiers.
Work through registered programs one at a time. Do not read generated COBOL,
engine output reports or engine implementation while establishing expected logic.
Use a separate context/session from the engine-gap analysis where practical.

For each program, check its source/metadata fingerprint and existing review. Reuse
a current reviewed baseline rather than rereading unchanged evidence. Otherwise,
read its bounded packet parts and relevant metadata, complete the twelve coverage
topics, and accumulate evidence-cited claims in a draft JSON under prompt/temp/.
Do not omit error, empty-input, not-found, transaction or PERFORM THRU paths.
Resolve or explicitly record missing dependencies and source/manual conflicts.

Import the completed static review using review-import. A reviewed result may
still contain unknowns; it is not a release approval. Keep candidate generic rules
separate from program business values. Never edit the source/manual/reference.
When the current session must stop, persist only actual progress and outstanding
chunk IDs; do not claim that unseen code was reviewed. Continue from that record
in the next session. Aggregate the collection when a wave has been reviewed.

## System 2 task B: engine gaps for reviewed baselines

Read readme.md and the engine-gap review prompt. Select programs with a current
reviewed baseline. Use a trusted pinned engine snapshot to run convert-to-review,
or register exact generated candidates and a receipt supplied from System 1.
If only prompt documentation is present, record documentation-based hypotheses;
do not claim that missing engine output was generated or inspected.

Build gap dossiers. Review each generated program against its independent baseline
and actual metadata in bounded parts. Record the exact baseline review hash and
engine identity. Classify differences rather than treating all text differences
as defects. Inspect only relevant engine guides/module notes; preserve unresolved
root-cause hypotheses until System 1 can inspect the actual source.

For reusable candidates provide structure/type preconditions, transformations,
refusal cases, counterexamples and regression tests. Do not modify Python or
candidate COBOL on System 2. Import evidence-cited static reviews, aggregate rule
families and export a checksummed handoff. Keep every pending state explicit.

## System 1 implementation task

Read prompt/system2/05_SYSTEM1_IMPLEMENTATION_PROMPT.md and verify the handoff.
Reproduce one rule family at a time, resolve conflicting contracts, implement
source/metadata-driven Python rules, add positive/negative/renamed-identifier tests,
update the matching prompt docs, regenerate the affected corpus and return a new
version to System 2. Do not change golden/manual sources to force parity.
