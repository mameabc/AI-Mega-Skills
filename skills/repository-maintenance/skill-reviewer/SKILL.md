# Skill Reviewer

## Description

Review one proposed AI Skill for scope, usefulness, correctness, maintainability, safety, evidence, and repository compliance before approval.

## Use This Skill When

- A Skill pull request needs a structured quality review.
- A proposed Skill may duplicate existing guidance or exceed its declared scope.
- Maintainers need an evidence-based approve, request-changes, or reject decision.

## Do Not Use This Skill When

- The request is to author the Skill content from scratch.
- The request is only to run automated repository validation.
- The reviewer lacks the proposal context or cannot inspect the complete Skill directory.

## Required Inputs

- `Skill change`: the complete Skill files and manifest under `skills/`.
- `repository context`: related Skills, registry, standards, and the proposed diff.
- `review criteria`: the quality standard, validation rules, and acceptance criteria.

## Expected Outputs

- A completed review using `templates/reviews/skill-review.md`.
- Findings ordered by severity with file paths and concrete remediation.
- One decision: approve, request changes, or reject, with validation evidence and residual risks.

## Workflow

1. Read the proposal, changed files, manifest, and related Skills before forming a judgment.
2. Confirm the Skill solves one problem and is materially distinct from existing Skills.
3. Check that purpose, triggers, non-goals, inputs, outputs, workflow, decisions, examples, and references agree across files.
4. Inspect examples for factual grounding, reproducibility, and evidence; reject fabricated claims or unrun results.
5. Check best practices, common mistakes, troubleshooting, maintainability, safety boundaries, and ownership.
6. Run `pwsh scripts/generate-registry.ps1 -Check`, `pwsh scripts/generate-readme.ps1 -Check`, and `pwsh scripts/validate-repository.ps1`.
7. Record findings in severity order using the review template; distinguish blocking findings from suggestions.
8. Approve only when the quality gate passes and no unresolved blocker remains.

## Decision Rules

- Review behavior and evidence, not prose volume.
- Treat missing required files, duplicate scope, unsafe guidance, fabricated references, and failed validation as blocking.
- Request changes for useful but incomplete work; reject work that cannot be made reliable within the declared scope.
- Do not approve based on a green validator alone; human judgment is required.
- Do not modify the contributor's files while reviewing unless the task explicitly authorizes an edit.
- Preserve review evidence so another maintainer can reproduce the decision.

## Examples

### Request changes

If `SKILL.md` has a clear workflow but its examples claim validation passed without command output, mark the finding as blocking, cite the file, and request evidence-backed examples before approval.

### Approve

Approve only after the complete Skill passes the quality standard, generated outputs are current, the validator passes, and the review report records no blocker.

## References

- Skill Review Standards: `docs/quality/skill-review-standards.md`
- Skill Quality Standard: `docs/quality/skill-quality-standard.md`
- Review template: `templates/reviews/skill-review.md`
- GitHub pull request reviews: https://docs.github.com/pull-requests/collaborating-with-pull-requests/reviewing-changes-in-pull-requests
