# Development Workflow

## Branching

Use short-lived branches:

```text
docs/<topic>
tooling/<topic>
skill/<domain>/<slug>
registry/<topic>
```

## Pull Request Flow

1. Open an issue or proposal.
2. Confirm scope and acceptance criteria.
3. Make the smallest complete change.
4. Run local validation.
5. Open a pull request.
6. Address CI failures.
7. Get review from the appropriate maintainer or domain steward.
8. Squash merge after approval.

## Commit Style

Use Conventional Commits:

```text
docs: add contribution guide
feat: add skill manifest schema
test: add manifest validation fixtures
chore: update generated registry
```

## Batch Policy

Skill batches must be small enough to review meaningfully. Recommended maximums:

- 1 skill for new contributors.
- 3 skills for experienced contributors.
- 10 skills only for maintainer-led domain batches with pre-approved templates.

Bulk-generated skill submissions are not accepted.

## Definition of Done

A change is done when:

- Documentation is updated.
- CI passes.
- Local validation passes.
- Required examples or tests are present.
- Review comments are resolved.
- Release notes are prepared when user-facing behavior changes.

