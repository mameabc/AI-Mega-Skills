# Skill Validator

## Description

Run and interpret the repository's automated checks for one Skill and its generated registration outputs, reporting evidence without substituting automation for human review.

## Use This Skill When

- A Skill author needs pre-review validation evidence.
- A pull request changes a Skill, manifest, registry, README catalog, or validation tooling.
- Generated outputs may be stale or a Skill directory may violate the repository contract.

## Do Not Use This Skill When

- The request requires judging usefulness, duplication, or writing quality without running checks.
- The request is to author Skill content or repair a failed check without inspecting its cause.
- The repository checkout or required commands are unavailable.

## Required Inputs

- `repository checkout`: the single working copy at the project root.
- `changed Skill`: the target Skill path or repository change.
- `validation scope`: commands required by the change and expected evidence.

## Expected Outputs

- Fresh results for registry generation checks, README generation checks, and repository validation.
- A concise report of commands, exit status, failures, and affected paths.
- A clear distinction between automated pass status and remaining human-review obligations.

## Workflow

1. Confirm the repository root and inspect `git status`; preserve unrelated changes.
2. Identify the target Skill and confirm its required files and manifest are present.
3. Run `pwsh scripts/generate-registry.ps1 -Check` to detect manifest, path, duplicate, or registry drift.
4. Run `pwsh scripts/generate-readme.ps1 -Check` to detect catalog drift.
5. Run `pwsh scripts/validate-repository.ps1` for required files, JSON parsing, placeholder checks, path consistency, and unresolved template tokens.
6. Run `git diff --check` and inspect the diff for unrelated edits or generated-file changes.
7. If a command fails, preserve the exact output, identify the first actionable cause, and rerun after the source correction.
8. Report all commands and outcomes; never claim a check passed from inspection or an earlier run.

## Decision Rules

- A failed automated check blocks the change until its cause is resolved or a maintainer explicitly accepts the risk.
- A green validator proves repository contract compliance, not content quality, usefulness, safety, or non-duplication.
- Generated files must be rebuilt from source scripts, never hand-edited to hide drift.
- Validate from the repository root so relative paths and CI behavior match.
- Do not modify source files while reporting validation unless repair is explicitly in scope.
- Use fresh command output for every completion claim.

## Examples

### Pre-review validation

```powershell
pwsh scripts/generate-registry.ps1 -Check
pwsh scripts/generate-readme.ps1 -Check
pwsh scripts/validate-repository.ps1
git diff --check
```

Record each exit status and include the validator output in the review request.

### Interpret a stale catalog

If README generation reports stale content, run `pwsh scripts/generate-readme.ps1`, inspect the generated catalog diff, and rerun the check. Do not edit the catalog rows manually.

## References

- Skill Validation Rules: `docs/quality/skill-validation-rules.md`
- Repository Automation: `docs/workflow/repository-automation.md`
- PowerShell about error handling: https://learn.microsoft.com/powershell/module/microsoft.powershell.core/about/about_try_catch_finally
- Git diff check documentation: https://git-scm.com/docs/git-diff
