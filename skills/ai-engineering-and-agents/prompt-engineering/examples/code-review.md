# Code Review Prompt

## Scenario

A pull request changes authorization middleware and adds a new administrative endpoint.

## Prompt

```text
Review this change for authorization correctness, privilege escalation, data exposure, reliability, and maintainability.

Review target: Inspect the complete diff, affected route registration, authorization middleware, data access layer, tests, and relevant repository policy. Do not assume the new endpoint is protected because a nearby endpoint is protected.

Evidence standard: Cite exact file paths and lines or symbols. Reproduce or inspect the relevant tests where possible. Use official framework or policy documentation for claims about default authorization behavior.

Findings: Report only actionable issues, ordered by severity. For each finding include location, attack or failure path, impact, and a minimal remediation. Explicitly state important checks that passed and meaningful uncertainty.

Decision: Recommend approve, request changes, or reject. Do not modify files, expose secrets, or claim a test passed unless you ran it and observed the result.
```

## Validation Evidence

A useful review identifies concrete authorization paths, separates blockers from suggestions, and records what was actually inspected or tested.
