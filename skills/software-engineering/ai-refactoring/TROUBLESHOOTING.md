# AI Refactoring Troubleshooting

## Tests Fail After a Structural Change

Classify the failure before editing again. Check changed names, imports, initialization, ordering, cleanup, serialization, and test fixtures. Revert the smallest transformation mentally or in a separate commit to identify the first behavior difference.

## The Contract Is Unclear

Inspect callers, documentation, error handling, metrics, and production behavior. Add characterization coverage for observed behavior, label accidental behavior separately, and ask for a decision before changing a public or security-sensitive contract.

## The Refactor Is Growing

Stop and split at a stable seam. Separate behavior-preserving structure from dependency upgrades, API migration, formatting, and feature changes. Define an intermediate state that builds and can be reviewed.

## A Shared Helper Does Not Fit Every Caller

Compare invariants, edge cases, errors, side effects, and policy differences. Keep separate implementations when the knowledge is not actually shared, or introduce a domain-level abstraction with explicit variation.

## Dead Code Usage Is Uncertain

Search source, generated artifacts, configuration, reflection, plugins, scripts, documentation, and external consumers. Use approved runtime telemetry or a deprecation window. Do not delete based only on local search.

## A Rename Breaks External Consumers

Restore compatibility with an alias, adapter, deprecation period, or versioned migration. Check serialized data, case-sensitive systems, generated clients, and documentation examples before removing the old name.

## Performance or Memory Changes Unexpectedly

Compare equivalent workloads to a baseline. Inspect allocation, query count, call depth, cache behavior, lock contention, and dependency timing. A cleaner structure is not evidence of equal runtime cost.

## Validation Tools Are Unavailable

State exactly what could not be checked. Use the smallest authorized static or manual verification path, avoid claiming completion, and record the remaining risk for the next environment.
