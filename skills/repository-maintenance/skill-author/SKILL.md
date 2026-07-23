# Skill Author

## Description

Create one production-quality AI Skill for this repository from the official template, with a narrow scope, explicit reasoning workflow, evidence-based examples, and complete registry metadata.

## Use This Skill When

- A contributor has an approved proposal for one new Skill.
- A Skill must be authored or materially improved without duplicating another Skill.
- A proposed Skill needs its files, metadata, examples, and validation workflow prepared for review.

## Do Not Use This Skill When

- The request asks for multiple new Skills in one change.
- The request is only to review or validate an existing Skill.
- The purpose, owner, domain, or required evidence is missing and cannot be resolved.

## Required Inputs

- `skill proposal`: the problem, intended users, scope, and non-goals.
- `repository context`: existing Skills, standards, templates, scripts, and relevant official references.
- `acceptance criteria`: required inputs, outputs, examples, checks, owner, domain, and version.

## Expected Outputs

- One complete directory at `skills/<domain>/<skill-slug>/`.
- A manifest, README, checklist, best practices, common mistakes, troubleshooting guide, and operational `SKILL.md`.
- Generated registry and README catalog entries, plus validation evidence and unresolved risks.

## Workflow

1. Confirm the proposal describes exactly one narrow problem and search `skills/` for duplicates.
2. Read the relevant authoring, naming, quality, review, and validation standards.
3. Select an existing domain or obtain approval for a new domain; use a lowercase hyphenated Skill slug.
4. Create the directory from `templates/skill/` using `scripts/new-skill.ps1`, supplying concrete values for every prompt.
5. Replace generic template wording with repository-specific decisions, failure handling, realistic examples, and official references.
6. Ensure the Skill explains when not to use it and stops when required context or safe authority is missing.
7. Run `pwsh scripts/generate-registry.ps1` and `pwsh scripts/generate-readme.ps1`.
8. Run `pwsh scripts/validate-repository.ps1`, inspect the diff, and report the commands and results.
9. Stop before committing if the Skill is duplicative, unsafe, untestable, or missing evidence; request a decision from the maintainer.

## Decision Rules

- Prefer improving an existing Skill when the proposed scope overlaps materially.
- Keep one Skill focused on one repeatable reasoning or execution problem.
- Use official documentation for external tools, formats, APIs, and standards.
- Never invent examples, references, owners, validation evidence, or repository state.
- Generated registry and README sections are outputs of scripts; do not edit them manually.
- Preserve unrelated user changes and commit only after validation passes.

## Examples

### Create a Skill scaffold

```powershell
pwsh scripts/new-skill.ps1 -DomainSlug software-engineering -SkillSlug api-contract-review
```

Complete every prompt with real project information, then edit the generated files until they meet the quality gate.

### Reject a duplicate proposal

If `skills/software-engineering/api-contract-review/` already solves the requested problem, do not create another directory. Compare the scopes, identify the missing behavior, and propose an improvement to the existing Skill.

## References

- Skill Authoring Standards: `docs/quality/skill-authoring-standards.md`
- Skill Quality Standard: `docs/quality/skill-quality-standard.md`
- Skill Validation Rules: `docs/quality/skill-validation-rules.md`
- PowerShell documentation: https://learn.microsoft.com/powershell/
- GitHub Actions documentation: https://docs.github.com/actions
