# Skill Quality Standard

## Quality Bar

A high-quality skill is specific, reproducible, testable, and honest about its limits. It should improve an agent's execution, not merely describe a topic.

## Required Sections

Every future `SKILL.md` must include:

- Name and short description.
- When to use the skill.
- When not to use the skill.
- Required inputs and assumptions.
- Step-by-step workflow.
- Expected outputs.
- Validation or test procedure.
- Safety, privacy, and compliance notes.
- Examples.
- Maintenance owner.

## Rubric

| Area | Minimum Standard |
| --- | --- |
| Purpose | One clear job, audience, and outcome |
| Scope | Narrow enough to execute without broad interpretation |
| Instructions | Ordered, concrete, and actionable |
| Inputs | Required context and files are explicit |
| Outputs | Expected artifacts are named and shaped |
| Validation | Includes checks that prove the skill worked |
| Examples | Uses realistic, non-placeholder scenarios |
| Safety | Calls out risks, prohibited uses, and data handling |
| Maintenance | Has owner, version, changelog, and deprecation path |

## Rejection Reasons

Reject a skill if it:

- Is a generic prompt collection.
- Duplicates an existing skill without a migration reason.
- Cannot be tested or reviewed.
- Depends on private credentials or undisclosed services.
- Makes legal, medical, financial, or security claims without guardrails.
- Encourages unsafe automation, scraping abuse, credential exposure, or policy bypass.
- Contains placeholder text.

## Definition of Done

A skill is done only when:

- The objective is clear.
- `SKILL.md` follows the authoring standard.
- `manifest.json` follows the schema.
- Examples are realistic.
- Best practices are included.
- Common mistakes are included.
- Troubleshooting guidance is included.
- References are official whenever possible.
- Validation or review checks are documented.
- README, registry, and category index updates are included.
- Repository validation passes.
- The change is committed and pushed on a feature branch.

## Quality Gate

Every skill must pass this gate before merge:

1. **Purpose:** The skill solves one named problem.
2. **Fit:** No existing skill already covers the same scope.
3. **Execution:** Instructions are ordered and actionable.
4. **Reasoning:** The skill improves decisions, review, debugging, planning, or testing.
5. **Evidence:** Examples, references, and validation are present.
6. **Safety:** Risks and prohibited use are documented.
7. **Maintenance:** Owner, version, status, and deprecation path are clear.
8. **Catalog:** README and registry entries are updated.
