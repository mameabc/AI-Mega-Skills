# Skill Validator

## Purpose

Provide fresh, reproducible evidence that a Skill and its generated repository outputs satisfy automated contracts before review.

## Skill Files

- `SKILL.md`: Validation workflow and interpretation rules.
- `CHECKLIST.md`: Required checks.
- `BEST_PRACTICES.md`: Evidence practices.
- `COMMON_MISTAKES.md`: Validation failures.
- `TROUBLESHOOTING.md`: Recovery guidance.
- `manifest.json`: Registry metadata.

## Example

Run the three generation/validation commands from the repository root, then run `git diff --check` and report the fresh output.

## Validation

An automated pass must still be handed to `skill-reviewer` for human quality review.
