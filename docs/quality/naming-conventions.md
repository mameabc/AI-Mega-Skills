# Naming Conventions

Names must be stable, searchable, and predictable.

## Slugs

- Use lowercase kebab-case.
- Use nouns and task verbs that describe the work.
- Avoid vague words such as `general`, `helper`, `assistant`, `misc`, and `utility`.
- Do not include vendor names unless the skill depends on that vendor.

## Domains

- Use domain folders for user intent.
- Use subdomains for specialization.
- Use tags for language, tool, framework, platform, and output format.

## Files

- Skill folder: `skills/<domain>/<skill-slug>/`
- Skill guide: `SKILL.md`
- Skill manifest: `manifest.json`
- Examples folder: `examples/`
- Tests folder: `tests/`
- Assets folder: `assets/`

## Branches

- Documentation: `docs/<topic>`
- Tooling: `tooling/<topic>`
- Governance: `governance/<topic>`
- Skill: `skill/<domain>/<slug>`

