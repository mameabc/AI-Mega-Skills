# System Prompt Design

## Purpose

Teach teams to build the durable instruction layer that governs an AI coding agent's role, authority, workflow, output contracts, safety boundaries, and maintenance lifecycle.

## Skill Files

- `SKILL.md`: System prompt responsibilities, design workflow, role templates, and maintenance.
- `CHECKLIST.md`: Design and review gate.
- `BEST_PRACTICES.md`: Maintainable system-prompt patterns.
- `COMMON_MISTAKES.md`: Failure modes and corrections.
- `TROUBLESHOOTING.md`: Diagnosis and recovery guidance.
- `manifest.json`: Registry metadata.
- `examples/`: Production system-prompt compositions and review cases.

## Boundary

Use `prompt-engineering` for task-specific prompts and `context-engineering` for repository information selection and working-set management. This Skill covers persistent agent behavior and authority only.

## Validation

Run `pwsh scripts/validate-repository.ps1`, then evaluate the system prompt against role, authority conflict, unsafe request, tool failure, and handoff cases.
