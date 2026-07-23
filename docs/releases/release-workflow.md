# Release Workflow

Releases must be traceable, validated, and reversible.

## Release Steps

1. Confirm the working tree is clean.
2. Run repository validation.
3. Review merged changes since the last release.
4. Classify the release as major, minor, or patch using [Versioning](versioning.md).
5. Update release notes.
6. Create a signed or clearly attributed tag when available.
7. Push the tag.
8. Publish the GitHub release.
9. Monitor CI and issue reports after release.

## Release Notes

Group changes by:

- New skills
- Improved skills
- Deprecated skills
- Registry or schema changes
- Documentation
- Tooling

## Release Blockers

- Failing validation.
- Missing README updates for new skills.
- Missing registry updates for new skills.
- Unreviewed schema changes.
- Unclear breaking changes.

