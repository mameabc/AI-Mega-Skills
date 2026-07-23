# Skill Validation Rules

Every future skill must pass repository validation and human review before merge.

## Required Files

Each skill directory must include:

- `SKILL.md`
- `README.md`
- `CHECKLIST.md`
- `BEST_PRACTICES.md`
- `COMMON_MISTAKES.md`
- `TROUBLESHOOTING.md`
- `manifest.json`

## Required Repository Updates

Adding a skill must update:

- README catalog entry.
- Skill registry or manifest index.
- Category index when one exists.

## Automated Checks

Validation must fail when:

- A required skill file is missing.
- A skill has `SKILL.md` without `manifest.json`, or the reverse.
- Placeholder markers are present.
- Manifest JSON is invalid.
- Manifest slug does not match the skill folder name.
- Manifest domain does not match the parent domain folder.

## Human Review Checks

Reviewers must confirm:

- The skill solves one clear problem.
- The skill does not duplicate existing work.
- Examples are realistic.
- Official references are used when available.
- Best practices, common mistakes, and troubleshooting are useful.
- The final output improves agent reasoning and execution.

