# AI Refactoring

This Skill teaches AI coding agents how to improve existing code safely while preserving its observable behavior and compatibility contracts.

## Included

- `SKILL.md`: workflow, behavior-preservation rules, refactoring techniques, decision trees, and production template.
- `CHECKLIST.md`: repeatable scope, transformation, and verification checklist.
- `BEST_PRACTICES.md`: practical guidance for safe everyday refactoring.
- `COMMON_MISTAKES.md`: changes that create regressions or unreviewable diffs.
- `TROUBLESHOOTING.md`: guidance for uncertain contracts, failing checks, and large migrations.
- `examples/`: before/after production refactoring examples.

This Skill changes internal structure without changing the contract. Use `ai-debugging` for runtime failures and `ai-code-review` for evaluating proposed changes.

Validate the repository with `pwsh scripts/validate-repository.ps1`.
