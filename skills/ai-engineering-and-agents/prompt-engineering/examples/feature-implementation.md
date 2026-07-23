# Feature Implementation Prompt

## Scenario

A team needs an agent to add request correlation IDs to an existing HTTP service without changing the public API.

## Prompt

```text
Goal: Add request correlation IDs to the existing HTTP service so every request and application log entry can be connected.

Context: Inspect the repository's HTTP entry point, logging setup, middleware, and tests. Treat existing public routes and response bodies as authoritative. Use the repository's current language, framework, and test runner.

Constraints:
- Change only the service, logging, and focused test files required for this behavior.
- Preserve route behavior, response schemas, and existing log fields.
- Accept an incoming correlation ID only if the current security and header policy permits it; otherwise generate a new opaque ID.
- Do not add a dependency without explaining why the existing stack cannot support the behavior.

Process: First report the relevant files and a short implementation plan. Wait for confirmation if the plan changes public behavior. Implement the smallest middleware or equivalent boundary, add tests for generated and accepted IDs, then run focused and full validation.

Output: Report changed files, behavior, commands run, observed test results, assumptions, and residual risks. Stop if the repository policy or framework behavior is unclear.
```

## Validation Evidence

The output should name the actual middleware and tests, show fresh command results, and confirm that public response behavior was preserved.
