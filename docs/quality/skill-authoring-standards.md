# Skill Authoring Standards

A skill is an operational guide for improving an AI agent's work. It is not a prompt dump.

## Required Purpose

Every skill must answer:

- What problem does this solve?
- When should it be used?
- When should it not be used?
- What inputs does it require?
- What output should the agent produce?
- How should the agent verify the result?

## Required Content

- `SKILL.md`
- `manifest.json`
- Realistic examples
- Validation or review procedure
- Best practices
- Common mistakes
- Troubleshooting guidance
- References when external facts, tools, APIs, or standards are involved

## Authoring Rules

- Keep scope narrow enough for reliable execution.
- Teach reasoning, decisions, checks, and failure handling.
- Prefer official references.
- Avoid unsafe automation or credential exposure.
- Do not duplicate an existing skill.
- Update README, registry, and category index when adding a skill.

