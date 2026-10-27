# Generic rule catalog policy

Store examples by program but implement rules by source construct, type/metadata
contract and proven control-flow pattern. "This program is VMDZ4310" is never an
implementation precondition. The literal '0092' can be true business data; preserving
it from the source is different from hardcoding it as a universal generator rule.

A candidate record must distinguish:

- What is observed in original IDMS and manual DB2, with exact evidence.
- What is observed in generated COBOL and the pinned engine identity.
- Whether a difference is a defect, equivalent implementation, manual defect,
  metadata conflict, genuine program-specific behavior or still unknown.
- A proposed generic precondition/action/refusal contract and owner hypothesis.
- Positive, negative, renamed-program/field/paragraph and cross-program tests.
- Required compiler/runtime/output-byte evidence and unresolved blockers.

Do not promote by majority vote, mention counts or accepted static reports alone.
A contradictory example remains visible and can narrow a rule's applicability.
A single carefully proven pattern may justify a narrow rule; 75 similar examples
still do not justify applying it to structurally different input.

The automatic catalog separates REVIEW_TOPIC clusters from reviewer-authored
CANDIDATE rules. Neither can change Python. System 1 must inspect actual source
and run regressions. Current review/module documentation is a route to the true
owner, not proof that a similarly named module caused the behavior.

No helper-variable ban is enforced: prefer direct existing typed fields where
safe, create a typed temporary only when representation, lifetime or overlap
requires it, and justify it from metadata. Compilation and semantic proof are
independent from naming conventions and helper counts.
