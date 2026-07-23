# AI Code Review

## Purpose

Teach AI coding agents to review software changes for correctness, security, maintainability, performance, API and architecture risk, error handling, and test quality with actionable evidence.

## Skill Files

- `SKILL.md`: Review workflow, dimensions, severity, feedback contracts, and examples.
- `CHECKLIST.md`: Review gate.
- `BEST_PRACTICES.md`: Reliable review habits.
- `COMMON_MISTAKES.md`: Review failure modes.
- `TROUBLESHOOTING.md`: Diagnosis and recovery guidance.
- `manifest.json`: Registry metadata.
- `examples/`: Production review scenarios.

## Boundary

This Skill reviews software changes. It does not design task prompts, manage repository context, define agent system prompts, or review AI Skills.

## Validation

Run `pwsh scripts/validate-repository.ps1`, inspect the complete change, and record fresh checks and evidence in the production review template.
