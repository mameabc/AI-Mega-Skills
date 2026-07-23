# Prompt Engineering

## Purpose

Help software teams design and evaluate prompts that produce reliable, reviewable, and vendor-neutral results from AI coding agents.

## Skill Files

- `SKILL.md`: Prompt design principles, patterns, structures, and evaluation method.
- `CHECKLIST.md`: Required authoring and evaluation checks.
- `BEST_PRACTICES.md`: Practical prompt construction guidance.
- `COMMON_MISTAKES.md`: Failure modes and corrections.
- `TROUBLESHOOTING.md`: Diagnosis and recovery guidance.
- `manifest.json`: Registry metadata.
- `examples/`: Production-oriented prompt examples.

## Example

Use the task-contract structure to ask an agent to add a bounded feature, name the files and tests in scope, require a plan before edits, and report fresh validation evidence.

## Validation

Run `pwsh scripts/validate-repository.ps1`, then evaluate the prompt against normal, ambiguous, and failure-prone software tasks using the method in `SKILL.md`.
