# Skill Validator Checklist

## Repository State

- [ ] Validation ran from the repository root.
- [ ] Existing unrelated changes were preserved.
- [ ] The target Skill path and required files were identified.

## Automated Checks

- [ ] `pwsh scripts/generate-registry.ps1 -Check` passed.
- [ ] `pwsh scripts/generate-readme.ps1 -Check` passed.
- [ ] `pwsh scripts/validate-repository.ps1` passed.
- [ ] `git diff --check` passed.

## Evidence

- [ ] Commands and fresh results are recorded.
- [ ] Failures include exact paths and first actionable causes.
- [ ] Generated files were not manually edited to conceal drift.
- [ ] Human review obligations remain explicit.
