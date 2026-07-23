# Skill Validator Troubleshooting

## Registry Check Fails

Run the non-checking registry generator, inspect manifest and path errors, then rerun the check. Resolve duplicate slugs or domain mismatches in the authored Skill.

## README Check Fails

Regenerate the README catalog, inspect only the marked generated block, and rerun the check. Preserve manual README content.

## Repository Validator Fails

Read the first missing file, invalid JSON path, placeholder location, or unresolved token. Correct the source file and rerun the complete validation sequence.

## Diff Check Fails

Inspect the reported whitespace location. Fix authored content or line endings without rewriting unrelated files, then rerun all checks.

## Checks Pass but Review Is Blocked

Hand the evidence to `skill-reviewer`. Automated checks do not assess scope, duplication, reasoning quality, safety, or usefulness.
