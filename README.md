# AI Mega Skills

An open-source AI Skills library planned for 500+ production-quality skills across engineering, data, design, operations, business, education, and creative domains.

This repository is currently in its foundation phase. The first milestone is not skill volume; it is the structure, standards, review workflow, and release discipline required to scale a large skill library without turning it into an unmaintainable collection of prompts.

## Current Status

- Skills generated: 4
- Target library size: 500+ validated skills
- Current phase: repository self-hosting and contributor workflow
- Scope of this phase: documentation, governance, versioning, CI, quality standards, and roadmap

## Repository Map

```text
.
├── .github/
│   ├── ISSUE_TEMPLATE/
│   ├── pull_request_template.md
│   └── workflows/
├── docs/
│   ├── architecture/
│   ├── domains/
│   ├── governance/
│   ├── quality/
│   ├── releases/
│   ├── superpowers/plans/
│   └── workflow/
├── registry/
│   ├── domains/
│   └── indexes/
├── schemas/
├── scripts/
├── templates/
└── skills/
```

## Core Principles

- Quality before quantity.
- Every skill must have a clear owner, purpose, domain, inputs, outputs, tests, and examples.
- Skills are versioned artifacts, not loose snippets.
- Automation enforces structure; reviewers enforce judgment.
- The library grows through domain batches with measurable acceptance criteria.

## Start Here

- [Roadmap](ROADMAP.md)
- [Contribution Guide](CONTRIBUTING.md)
- [Repository Structure](docs/architecture/repository-structure.md)
- [Quality Standard](docs/quality/skill-quality-standard.md)
- [AI Contributor Guide](docs/governance/ai-contributor-guide.md)
- [Repository Coding Standards](docs/quality/repository-coding-standards.md)
- [Skill Authoring Standards](docs/quality/skill-authoring-standards.md)
- [Skill Review Standards](docs/quality/skill-review-standards.md)
- [Skill Validation Rules](docs/quality/skill-validation-rules.md)
- [Official Skill Template](templates/skill/README.md)
- [Documentation Writing Standards](docs/quality/documentation-writing-standards.md)
- [Naming Conventions](docs/quality/naming-conventions.md)
- [Versioning](docs/releases/versioning.md)
- [Release Workflow](docs/releases/release-workflow.md)
- [Repository Automation](docs/workflow/repository-automation.md)
- [500+ Skill Domain Plan](docs/domains/500-skill-domain-roadmap.md)
- [Foundation Implementation Plan](docs/superpowers/plans/2026-07-23-ai-skills-library-foundation.md)

<!-- BEGIN GENERATED SKILL CATALOG -->
## Published Skills

| Skill | Domain | Version | Status | Description |
| --- | --- | --- | --- | --- |
| [Prompt Engineering](skills/ai-engineering-and-agents/prompt-engineering/) | ai-engineering-and-agents | 1.0.0 | stable | Design and evaluate vendor-neutral prompts that improve AI coding agents' software-engineering results and verification quality. |
| [Skill Author](skills/repository-maintenance/skill-author/) | repository-maintenance | 1.0.0 | stable | Create one complete, evidence-based AI Skill from the official template and prepare it for repository review. |
| [Skill Reviewer](skills/repository-maintenance/skill-reviewer/) | repository-maintenance | 1.0.0 | stable | Review one proposed AI Skill for scope, quality, safety, evidence, and repository compliance before approval. |
| [Skill Validator](skills/repository-maintenance/skill-validator/) | repository-maintenance | 1.0.0 | stable | Run and interpret fresh automated checks for a Skill and its generated repository registration outputs. |
<!-- END GENERATED SKILL CATALOG -->
