# Repository Structure

The repository is designed to scale to 500+ skills while keeping review, discovery, release, and maintenance manageable.

## Top-Level Layout

```text
.github/                 GitHub templates and automation
docs/                    Architecture, workflow, governance, quality, roadmap
registry/                Generated and curated skill indexes
schemas/                 Machine-readable contracts
scripts/                 Validation and maintenance tooling
skills/                  Future skill implementations grouped by domain
```

## Future Skill Layout

Skills should eventually use this pattern:

```text
skills/<domain>/<skill-slug>/
├── SKILL.md
├── manifest.json
├── examples/
├── tests/
└── assets/
```

Rules:

- `SKILL.md` is the primary human-readable operating guide.
- `manifest.json` is the machine-readable registry contract.
- `examples/` contains realistic usage examples.
- `tests/` contains validation fixtures, snapshots, or executable checks.
- `assets/` is optional and only for files the skill actually needs.

## Registry Layout

```text
registry/domains/        Curated domain metadata
registry/indexes/        Generated indexes for search and publishing
```

Registry files must be generated deterministically once tooling exists. Manual edits to generated indexes should be rejected by CI.

## Domain Boundaries

Domains should reflect user intent rather than internal implementation details. For example, `software-engineering` is a domain; `javascript` is usually a tag or subdomain unless the skill is language-specific.

