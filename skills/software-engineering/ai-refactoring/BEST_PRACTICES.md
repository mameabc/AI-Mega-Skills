# AI Refactoring Best Practices

- Refactor toward a named maintenance outcome, not a vague preference.
- Establish behavior before changing structure.
- Keep transformations small, coherent, reversible, and independently verifiable.
- Map consumers before renaming, moving, deleting, or changing visibility.
- Preserve error, ordering, cleanup, authorization, and serialization semantics.
- Extract cohesive responsibilities instead of generic helpers.
- Remove duplication only when the duplicated knowledge is truly the same.
- Prefer explicit composition boundaries over inheritance only when the contract supports it.
- Treat dead code as a proof problem involving static and runtime usage evidence.
- Use behavior-focused tests and representative operational checks.
- Keep refactoring diffs free of unrelated formatting and feature changes.
- Describe what remained invariant and what evidence supports that claim.
