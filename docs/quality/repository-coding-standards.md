# Repository Coding Standards

Repository code should be small, readable, deterministic, and easy to validate.

## Standards

- Prefer simple scripts over framework-heavy tooling.
- Keep scripts idempotent when possible.
- Fail fast with clear error messages.
- Use explicit paths and stable file names.
- Avoid network calls in validation unless the command is explicitly for integration checks.
- Keep generated files clearly documented.
- Do not hide validation failures behind warnings.

## PowerShell

- Set `$ErrorActionPreference = "Stop"` in validation and maintenance scripts.
- Use `-LiteralPath` for filesystem paths.
- Avoid destructive commands unless the target has been verified.
- Print concise success and failure messages.

## JSON

- Use schemas for machine-readable contracts.
- Keep required fields intentional and documented.
- Use lowercase kebab-case for slugs and tags.

## Markdown

- Keep headings descriptive.
- Use checklists only when they represent actual gates.
- Avoid duplicated policy text; link to the source standard instead.

