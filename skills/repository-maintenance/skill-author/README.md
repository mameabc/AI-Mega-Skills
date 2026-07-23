# Skill Author

## Purpose

Provide the repeatable authoring process for adding one complete, reviewable Skill to AI Mega Skills.

## Skill Files

- `SKILL.md`: Authoring workflow and decisions.
- `CHECKLIST.md`: Completion checks.
- `BEST_PRACTICES.md`: Reliable authoring patterns.
- `COMMON_MISTAKES.md`: Failure modes to avoid.
- `TROUBLESHOOTING.md`: Recovery guidance.
- `manifest.json`: Registry metadata.

## Example

Run `pwsh scripts/new-skill.ps1 -DomainSlug <domain> -SkillSlug <skill-slug>`, complete the prompts with factual values, author the six documents, regenerate outputs, and validate before review.

## Validation

Run `pwsh scripts/validate-repository.ps1` and include its output in the change report.
