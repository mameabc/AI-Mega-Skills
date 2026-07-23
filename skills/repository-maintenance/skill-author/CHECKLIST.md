# Skill Author Checklist

## Scope

- [ ] The proposal solves one clear problem.
- [ ] Existing Skills were searched for overlap.
- [ ] The domain, slug, owner, inputs, outputs, and non-goals are explicit.

## Content

- [ ] `SKILL.md` teaches decisions, workflow, failure handling, and evidence collection.
- [ ] README, best practices, common mistakes, and troubleshooting are specific to the Skill.
- [ ] Examples are realistic and do not claim unrun results.
- [ ] Official references support external technical or policy claims.

## Automation

- [ ] The Skill was created from `templates/skill/`.
- [ ] `manifest.json` contains concrete values and matches its folder.
- [ ] Registry and README outputs were regenerated.
- [ ] `pwsh scripts/validate-repository.ps1` passes.

## Handoff

- [ ] The review request includes scope, files, validation evidence, and known risks.
- [ ] No unrelated files or generated output were edited manually.
