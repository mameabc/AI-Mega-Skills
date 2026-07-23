# AI Refactoring Common Mistakes

- Calling a rewrite a refactor while changing business behavior.
- Editing a large area before establishing a baseline.
- Combining renames, formatting, dependency upgrades, and feature work in one diff.
- Extracting code without preserving scope, evaluation order, cleanup, or exception behavior.
- Sharing code that only looks similar but has different policies or edge cases.
- Removing code that is dynamically loaded, reflected, generated, configured, or externally consumed.
- Renaming public or serialized identifiers without a compatibility path.
- Replacing inheritance mechanically without checking lifecycle and substitutability contracts.
- Trusting a passing unit test while skipping integration, error, concurrency, or compatibility checks.
- Adding abstractions that make a simple flow harder to follow.
- Using snapshots that preserve implementation details instead of behavior.
- Claiming behavior preservation without evidence.
