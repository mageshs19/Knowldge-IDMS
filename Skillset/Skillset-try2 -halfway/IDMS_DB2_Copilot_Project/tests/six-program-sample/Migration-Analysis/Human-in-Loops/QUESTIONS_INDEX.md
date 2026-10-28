# Questions index — Phase 2

There are 39 stable question files. Every current answer is SIMULATED_FOR_TEST; all production questions remain OPEN.

| ID and file | Affected IDMS inputs | Topic | Response | Review |
| --- | --- | --- | --- | --- |
| [Q-000001](Q-000001__VM4BD302__vm4bd302-month-boundary-policy.md) | VM4BD302.cbl | One month before maturity | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000002](Q-000002__VM4BD302__vm4bd302-numeric-output-domains.md) | VM4BD302.cbl | Numeric output field domains | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000003](Q-000003__VM4BD302__vm4bd302-service-return-and-output.md) | VM4BD302.cbl | VM9BC50T service result validity | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000004](Q-000004__VM4BD420__vm4bd420-creation-ci-domain.md) | VM4BD420.cbl | Creation CI width and repeated creation events | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000005](Q-000005__VM7BD200__archive-byte-contract-7200.md) | VM7BD200.cbl | Archive byte compatibility, including filler | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000006](Q-000006__VM7BD200__archive-cutoff-sentinel-7200.md) | VM7BD200.cbl | Archive date fallback and zero sentinel | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000007](Q-000007__VM7BD200__archive-file-rerun-7200.md) | VM7BD200.cbl | Recovery from a partial archive extract | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000008](Q-000008__VM7BD200__archive-order-7200.md) | VM7BD200.cbl | Archive order and F-TELLER association | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000009](Q-000009__shared__audit-timestamp-business-policy.md) | VM1BD526.cbl, VM1BD567.cbl | Job timestamp and audit defaults | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000010](Q-000010__VM1BD567__blank-creation-date-sentinel.md) | VM1BD567.cbl | Missing creation date normalization | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000011](Q-000011__shared__buffer-replacement-identity.md) | VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl | Second replacement: persistent buffer role | DEFERRED | TEST_ASSUMPTION_ONLY |
| [Q-000012](Q-000012__shared__build-context-and-generated-members.md) | VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl | Build context and generated declarations | DEFERRED | TEST_ASSUMPTION_ONLY |
| [Q-000013](Q-000013__VM4BD310__capital-amount-4310.md) | VM4BD310.cbl | Capital amount when coupon rank is zero | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000014](Q-000014__shared__db2-date-output-policy.md) | VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl, VM7BD200.cbl | DATE output format and sentinel contract | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000015](Q-000015__shared__eight-decommission-identities.md) | VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl | Eight decommissioned business records | DEFERRED | TEST_ASSUMPTION_ONLY |
| [Q-000016](Q-000016__VM1BD526__event-first-selection-order.md) | VM1BD526.cbl | First matching event versus greatest ID | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000017](Q-000017__shared__event-good-key-encoding.md) | VM1BD526.cbl, VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl | Event composite key: 20 bytes versus 28 digits | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000018](Q-000018__VM1BD526__event-parent-and-id-constraints.md) | VM1BD526.cbl | Event relationship and generated-ID guarantees | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000019](Q-000019__VM4BD310__file-rerun-contract-4310.md) | VM4BD310.cbl | Rerun after partial monthly mutation output | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000020](Q-000020__shared__input-copy-vmdz205i-layout.md) | VM1BD526.cbl, VM1BD567.cbl | Converted input-record dependency | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000021](Q-000021__VM1BD567__legacy-567-counter-intent.md) | VM1BD567.cbl | Legacy counter defect and intended commit unit | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000022](Q-000022__VM4BD310__lrf-child-outcomes-4310.md) | VM4BD310.cbl | Distinguish the three missing-data outcomes | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000023](Q-000023__VM4BD310__lrf-event-order-4310.md) | VM4BD310.cbl | Which event0092 must be selected? | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000024](Q-000024__VM7BD200__mapping-embedded-space-7200.md) | VM7BD200.cbl | Exact mapping column spelling | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000025](Q-000025__VM7BD200__output-copy-vmdz270i-layout.md) | VM7BD200.cbl | Converted archive-parameter input copybook | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000026](Q-000026__VM4BD310__output-copy-vmdz510i-layout.md) | VM4BD310.cbl | Converted mutation-output copybook | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000027](Q-000027__shared__restart-completed-run-policy.md) | VM1BD526.cbl, VM1BD567.cbl | Completed-run and rerun policy | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000028](Q-000028__shared__restart-concurrent-run-ownership.md) | VM1BD526.cbl, VM1BD567.cbl | Overlapping job ownership | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000029](Q-000029__shared__restart-counter-capacity.md) | VM1BD526.cbl, VM1BD567.cbl | Counter range and checkpoint meaning | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000030](Q-000030__shared__restart-input-file-identity.md) | VM1BD526.cbl, VM1BD567.cbl | Positional resume input immutability | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000031](Q-000031__shared__restart-key-cutover-policy.md) | VM1BD526.cbl, VM1BD567.cbl | Legacy checkpoint transfer at cutover | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000032](Q-000032__shared__restart-serialized-payload-policy.md) | VM1BD526.cbl, VM1BD567.cbl | Count-only versus count-plus-record checkpoint | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000033](Q-000033__VM1BD567__restart-short-file-policy-567.md) | VM1BD567.cbl | Short input during positional restart | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000034](Q-000034__shared__restart-target-object-identity.md) | VM1BD526.cbl, VM1BD567.cbl | Restart table versus SQL view identity | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000035](Q-000035__shared__runtime-sqlerror-useraben-contract.md) | VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl | Error-routine and rollback contract | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000036](Q-000036__shared__shared-evef-encounter-order.md) | VM4BD302.cbl, VM4BD420.cbl | Legacy event-set order versus surrogate order | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000037](Q-000037__shared__view-base-ddl.md) | VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl | Business views, base tables and keys | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000038](Q-000038__VM4BD302__navigation-output-recovery-vm4bd302.md) | VM4BD302.cbl | Partial output and publication for VM4BD302.cbl | PROVIDED | TEST_ASSUMPTION_ONLY |
| [Q-000039](Q-000039__VM4BD420__navigation-output-recovery-vm4bd420.md) | VM4BD420.cbl | Partial output and publication for VM4BD420.cbl | PROVIDED | TEST_ASSUMPTION_ONLY |
