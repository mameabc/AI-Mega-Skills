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

