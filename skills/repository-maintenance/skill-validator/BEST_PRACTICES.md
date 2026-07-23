# Skill Validator Best Practices

- Run checks in the same order used by CI.
- Use fresh output immediately before reporting status.
- Start with the first actionable failure instead of masking secondary errors.
- Inspect generated diffs after regeneration.
- Keep automated contract checks distinct from human quality review.
- Record environment assumptions when they affect a result.
- Preserve reproducible commands in the validation report.
