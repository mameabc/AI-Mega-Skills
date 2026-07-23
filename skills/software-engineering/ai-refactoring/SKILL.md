# AI Refactoring

## Description

Use this Skill to improve existing code without changing its externally observable behavior. It guides AI coding agents through opportunity selection, small safe transformations, dependency cleanup, regression protection, and reviewable delivery. Refactoring is complete only when the code is easier to change and the behavior contract remains verified.

## Use This Skill When

- Existing code works but is difficult to read, test, extend, or maintain.
- Duplication, deep nesting, unclear names, excessive coupling, dead code, or unnecessary dependencies increase change risk.
- A safe sequence of small transformations can improve structure without changing product behavior.
- Tests, contracts, runtime evidence, or a manual verification path can establish behavior before and after the change.

## Do Not Use This Skill When

- The primary goal is to change product behavior, redesign an API, or alter business rules.
- The code is failing and the first need is root-cause investigation; use `ai-debugging`.
- The task is to evaluate a change; use `ai-code-review`.
- The intended behavior or compatibility contract is unknown and cannot be clarified or observed.
- A broad rewrite is proposed without an incremental migration and rollback strategy.

## Required Inputs

1. The target code and its callers, consumers, tests, configuration, and public contracts.
2. The behavior that must remain unchanged, including error, timing, ordering, and compatibility expectations.
3. A concrete maintainability problem and its evidence.
4. Available validation commands, risk constraints, and a safe rollback point.

If a behavior contract is uncertain, document the uncertainty and add characterization coverage before restructuring.

## Expected Outputs

- A scoped refactoring objective and explicit non-goals.
- Baseline behavior evidence and a sequence of small transformations.
- Focused code changes with no unrelated formatting or feature work.
- Passing tests and checks that demonstrate behavior preservation.
- A summary of residual risks, compatibility impact, and follow-up opportunities.

## Boundary With Related Skills

- **AI Refactoring:** changes internal structure while preserving the existing contract.
- **AI Debugging:** investigates a failure or degraded runtime behavior.
- **AI Code Review:** evaluates correctness and risks in a proposed change.
- **Prompt Engineering:** designs a task-specific request for an agent.
- **Context Engineering:** selects the repository context needed for work.
- **System Prompt Design:** defines persistent agent behavior and output contracts.

## Refactoring Workflow

1. **Define the contract:** record inputs, outputs, side effects, exceptions, ordering, performance expectations, public API, and compatibility requirements.
2. **Find the opportunity:** identify a specific smell and its maintenance cost; do not refactor based on aesthetics alone.
3. **Map the blast radius:** find callers, implementations, tests, generated code, configuration, integrations, and ownership boundaries.
4. **Establish a baseline:** run relevant tests and checks; add characterization tests or snapshots where behavior is unprotected.
5. **Choose the smallest transformation:** prefer one coherent structural change with an easy review and rollback.
6. **Transform incrementally:** keep the code buildable, preserve seams, and validate after each meaningful step.
7. **Inspect the diff:** remove incidental churn, verify names and dependency direction, and compare the contract to the baseline.
8. **Verify behavior:** run targeted tests, integration checks, static analysis, and representative manual or runtime checks.
9. **Deliver and record:** explain what changed structurally, what stayed invariant, evidence collected, and any remaining risk.

## Identifying Refactoring Opportunities

Prioritize code that changes frequently, causes defects, blocks testing, or has clear duplication and coupling. Look for long methods, large classes, repeated conditionals, primitive values carrying domain meaning, feature envy, hidden side effects, unclear ownership, dead branches, unstable dependencies, and names that force readers to reconstruct intent. Confirm that the proposed change addresses a measurable maintenance problem and is not merely a stylistic preference.

## Small vs Large Refactors

### Small Refactors

Use for renaming, Extract Method, simplifying a conditional, removing proven dead code, or replacing local duplication. Keep the change local, preserve the API, and validate immediately. Small refactors are preferred when the code can be improved without crossing ownership or deployment boundaries.

### Large Refactors

Use a staged plan for module moves, dependency replacement, Extract Class across callers, inheritance-to-composition migration, or public API changes. Introduce an adapter or compatibility seam, migrate consumers in steps, measure behavior, and remove the seam only after usage is gone. Split the work into independently reviewable commits when the repository workflow permits; each commit must remain coherent and verifiable.

## Behavior Preservation

Preserve more than successful outputs. Check validation, exceptions and error codes, side effects, persistence, event order, retries, idempotency, authorization, logging contracts, timeouts, concurrency, resource cleanup, serialization, public names, and performance limits when they are part of the contract. Use characterization tests to capture observed behavior before changing structure, but do not turn an accidental security flaw or undefined behavior into a permanent promise without an explicit decision.

## Code Smells and Safe Responses

| Smell | Safer first move |
| --- | --- |
| Long method | Extract a cohesive method around one invariant or decision. |
| Large class | Identify responsibilities, then Extract Class behind a narrow interface. |
| Repeated logic | Confirm identical semantics, extract shared behavior, and test boundary differences. |
| Deep conditional | Name predicates, use guard clauses, or introduce a policy object without changing precedence. |
| Primitive obsession | Introduce a value object only after mapping validation, equality, and serialization. |
| Feature envy | Move behavior toward the data owner only after checking transaction and dependency boundaries. |
| Inheritance coupling | Prefer composition with an explicit collaborator and stable contract. |
| Dead code | Prove no runtime, generated, reflective, configuration, or external consumer depends on it. |
| Dependency drift | Inspect the dependency graph and remove or upgrade one dependency with compatibility checks. |

## Removing Duplication

First determine whether repeated code has identical behavior, merely similar shape, or intentionally different policy. Extract only stable knowledge. Keep parameters explicit, preserve error and side-effect behavior, and avoid a generic helper whose name hides domain meaning. Verify both the original call sites and edge cases where the code only appears similar.

## Readability and Complexity

Prefer names that state domain intent, functions with one reason to change, explicit control flow, and local data transformations. Simplify nesting without changing evaluation order, short-circuiting, exception behavior, or cleanup. Measure complexity trends where tooling exists, but use comprehension and change safety as the goal rather than a metric threshold.

## Dependency Cleanup

Build or inspect the dependency graph before removing a package or moving a module. Search direct imports, transitive assumptions, build scripts, generated files, runtime loading, reflection, plugins, configuration, and deployment images. Remove one dependency at a time, refresh lockfiles deliberately, and verify license, security, bundle, and startup implications.

## Dead Code Removal

Treat code as dead only when static search and runtime evidence support it. Check public exports, dynamic lookup, serialization, feature flags, migrations, scripts, tests, documentation snippets, and downstream consumers. Remove the smallest proven unit, run the full relevant suite, and retain a rollback path for code whose usage evidence is incomplete.

## Naming Improvements

Rename to express the existing meaning, not a new meaning. Search definitions, callers, tests, configuration, serialization, logs, metrics, documentation, and external contracts. For public or serialized names, use an alias or migration plan. Avoid mass renames that obscure a structural change and verify case sensitivity across supported platforms.

## Extract Method

Select a contiguous, cohesive block with a clear purpose. Identify inputs, outputs, mutations, exceptions, and required ordering. Give the method a domain-level name, pass dependencies explicitly, and avoid changing scope or evaluation order during extraction. Preserve local cleanup and make the new method independently testable where useful.

## Extract Class

Find a responsibility with its own data, invariants, and collaborators. Define a narrow boundary, move behavior and state together, and preserve the original facade while callers migrate. Watch for circular dependencies, transaction ownership, lifecycle changes, serialization differences, and accidental exposure of mutable state.

## Composition Over Inheritance

Use composition when behavior varies independently, subclasses violate substitutability, or inheritance creates fragile coupling. Introduce a collaborator with an explicit interface, delegate behavior, migrate one consumer at a time, and preserve construction, lifecycle, error, and configuration behavior. Do not replace inheritance mechanically when polymorphic contracts or framework lifecycle requirements depend on it.

## Regression Prevention

Use the narrowest useful test at each step, then run broader checks based on blast radius. Add tests for boundaries, errors, side effects, authorization, concurrency, serialization, and compatibility when those contracts are at risk. Compare representative performance or memory signals for hot paths. Prefer tests that express behavior over snapshots of incidental implementation structure.

## Refactoring Decision Trees

### Choose the Scope

```text
Can the problem be isolated to one method, class, or dependency?
  Yes -> choose the smallest transformation and validate immediately.
  No -> map callers, contracts, and ownership boundaries.
    Is a compatibility seam possible?
      Yes -> stage migration behind the seam.
      No -> clarify contract, rollback, and release strategy before editing.
```

### Check Behavior Protection

```text
Is the behavior contract covered by reliable tests or a trusted verification path?
  Yes -> record a baseline and refactor incrementally.
  No -> can characterization coverage be added without changing behavior?
    Yes -> add it, verify it, then refactor.
    No -> stop and clarify the contract before restructuring.
```

### Decide Whether to Remove Code

```text
Is usage absent from source, generated code, configuration, reflection, and external consumers?
  Yes -> check runtime evidence and remove the smallest unit.
  No -> preserve it or migrate consumers first.
  Unknown -> do not delete; instrument or establish an approved deprecation window.
```

## Production Refactoring Template

```text
Refactoring objective:
Behavior contract to preserve:
Explicit non-goals:
Target files and mapped consumers:
Identified smell and maintenance cost:
Baseline checks and evidence:

Incremental steps:
1.
2.
3.

Verification after each step:
Final tests and checks:
Compatibility, performance, and operational impact:
Rollback or follow-up plan:
```

## Vendor-Neutral Operation

The Skill specifies reasoning, scope control, and verification, not a particular model, IDE, programming language, or build system. Adapt commands to the repository and state assumptions. Never claim that tests, searches, benchmarks, or tools were run when they were not.

## Safety and Data Handling

Preserve authorization, validation, audit, privacy, and error-handling behavior unless a separate change explicitly changes the contract. Do not expose secrets or private production data to an AI agent. Use least-privilege access, reversible commits, representative test data, and approved migration procedures.

## References

- Martin Fowler, Refactoring catalog: https://refactoring.com/catalog/
- Martin Fowler, Refactoring: https://martinfowler.com/books/refactoring.html
- Microsoft .NET design guidelines: https://learn.microsoft.com/dotnet/standard/design-guidelines/
- Python documentation, code quality and testing guidance: https://docs.python.org/3/library/unittest.html
- Google Engineering Practices, code review standards: https://google.github.io/eng-practices/review/
