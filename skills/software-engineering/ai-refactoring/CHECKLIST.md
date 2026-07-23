# AI Refactoring Checklist

## Scope and Contract

- [ ] The maintainability problem and explicit non-goals are written.
- [ ] Inputs, outputs, side effects, errors, ordering, performance, and compatibility contracts are identified.
- [ ] Callers, consumers, tests, configuration, generated code, and ownership boundaries are mapped.
- [ ] The change has a rollback point and a proportionate scope.

## Baseline

- [ ] Relevant tests and checks pass before editing, or failures are recorded.
- [ ] Characterization coverage or an approved manual verification path protects untested behavior.
- [ ] Baseline performance, memory, serialization, or operational signals are captured when relevant.

## Transformation

- [ ] One coherent transformation is made at a time.
- [ ] Behavior, evaluation order, cleanup, exceptions, authorization, and side effects are preserved.
- [ ] Names express existing meaning and public/serialized names have a migration plan.
- [ ] Duplication is semantically equivalent before it is consolidated.
- [ ] Dependency, dead-code, inheritance, and reflection risks are checked.
- [ ] No unrelated formatting, feature, or dependency churn is included.

## Verification

- [ ] Targeted tests pass after each meaningful step.
- [ ] Integration, static, build, and relevant end-to-end checks pass.
- [ ] Boundary, failure, concurrency, serialization, and compatibility cases are covered where at risk.
- [ ] The final diff is easier to understand and contains no accidental behavior change.
- [ ] Remaining risk, rollback, and follow-up work are documented.
