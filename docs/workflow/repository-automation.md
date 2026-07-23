# Repository Automation

Repository automation keeps Skill metadata, discovery, and validation synchronized.

## Create a Skill

From the repository root, run:

```powershell
pwsh scripts/new-skill.ps1 -DomainSlug software-engineering -SkillSlug example-skill
```

The command collects concrete metadata, copies the official template, rejects unresolved template tokens and duplicate paths, then rebuilds the registry and README catalog. It does not replace author review or quality validation.

## Generate Outputs

These commands rebuild deterministic files from Skill manifests:

```powershell
pwsh scripts/generate-registry.ps1
pwsh scripts/generate-readme.ps1
```

Generated outputs are `registry/skills.json`, `registry/indexes/skills.md`, and the marked catalog block in `README.md`. Do not edit those outputs manually.

## Validate Changes

Run the full repository gate before committing:

```powershell
pwsh scripts/validate-repository.ps1
```

CI regenerates the outputs and fails when the working tree changes, preventing stale registry or README content from being merged.
