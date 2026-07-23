# Context Engineering

## Purpose

Teach developers and AI coding agents how to make the right repository knowledge discoverable, bounded, current, and verifiable throughout software-engineering work.

## Skill Files

- `SKILL.md`: Context planning, organization, retrieval, optimization, and multi-step workflows.
- `CHECKLIST.md`: Context quality and validation checks.
- `BEST_PRACTICES.md`: Practical context-management guidance.
- `COMMON_MISTAKES.md`: Failure modes and corrections.
- `TROUBLESHOOTING.md`: Diagnosis and recovery guidance.
- `manifest.json`: Registry metadata.
- `examples/`: Practical context packets and workflows.

## Example

Build a dependency slice around the task, retrieve only authoritative files and tests, checkpoint the state, and refresh context after every meaningful change or contradiction.

## Validation

Run `pwsh scripts/validate-repository.ps1` and verify that a context packet names source authority, freshness, budget, exclusions, next checks, and refresh triggers.
