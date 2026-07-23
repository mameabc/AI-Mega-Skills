# Contributing

Thank you for helping build AI Mega Skills. This project accepts quality-reviewed skills, registry improvements, documentation, schemas, validation tooling, and domain plans.

Do not submit bulk-generated skills. Every skill must be authored, tested, reviewed, and maintained.

## Contribution Types

- **Skill proposal:** A request to add a skill to the roadmap.
- **Skill implementation:** A complete skill with manifest, docs, examples, and tests.
- **Domain improvement:** Taxonomy, ownership, naming, or backlog changes.
- **Quality tooling:** Schema, validation, registry generation, or CI improvements.
- **Documentation:** Guides, examples, policies, or workflow improvements.

## Required Flow

1. Open a skill proposal or issue.
2. Confirm the domain, audience, purpose, and acceptance criteria.
3. Implement one skill or one tightly scoped batch.
4. Run local validation.
5. Open a pull request using the template.
6. Address automated checks and maintainer review.
7. Wait for approval from a domain steward or maintainer.

## Skill Acceptance Criteria

A skill must include:

- A stable slug.
- A domain and subdomain.
- A clear problem statement.
- Required inputs and expected outputs.
- Supported tools, platforms, or environments.
- Step-by-step operating instructions.
- At least one realistic example.
- Known limitations.
- Quality checks or tests.
- Owner metadata.
- Semantic version.

## Naming

- Use lowercase kebab-case slugs.
- Use domain folders as the primary grouping.
- Avoid vague names such as `helper`, `assistant`, `automation`, or `general`.
- Prefer task-specific names such as `python-package-release`, `customer-interview-synthesis`, or `incident-postmortem-writer`.

## Review Standard

Reviewers should check:

- Is this skill useful without extra context?
- Is the scope narrow enough to execute reliably?
- Are inputs, outputs, and failure cases explicit?
- Does the skill duplicate an existing skill?
- Are examples realistic?
- Can the skill be validated automatically or manually?
- Does it avoid unsafe, illegal, deceptive, or privacy-invasive behavior?

## Local Validation

Run:

```powershell
pwsh scripts/validate-repository.ps1
```

The validation script currently checks the repository foundation. It is intentionally lightweight until skill manifests and registry generation are added.

