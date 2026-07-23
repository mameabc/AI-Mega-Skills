# Versioning

AI Mega Skills uses semantic versioning at two levels: library releases and individual skills.

## Library Version

The repository release version follows:

```text
MAJOR.MINOR.PATCH
```

- **MAJOR:** Breaking repository structure, registry schema, or skill contract changes.
- **MINOR:** New domains, new skills, new tooling, or backward-compatible metadata fields.
- **PATCH:** Documentation fixes, metadata corrections, validation bug fixes, and non-breaking updates.

## Skill Version

Each skill will have its own version:

```text
skillVersion: MAJOR.MINOR.PATCH
```

- **MAJOR:** Breaking input, output, workflow, or tool requirement change.
- **MINOR:** Backward-compatible capability or example addition.
- **PATCH:** Clarification, typo fix, test update, or small safety improvement.

## Deprecation

Deprecated skills must include:

- Replacement skill slug, if one exists.
- Reason for deprecation.
- Removal target version.
- Migration notes.

## Release Cadence

Recommended cadence:

- Patch releases as needed.
- Minor releases every two to four weeks during active growth.
- Major releases only after a public migration window.

## Version Rules

- Never reuse a released version.
- Do not change skill behavior without updating the skill version.
- Do not publish breaking schema changes in a patch release.
- Document migration steps for every major release.
- Mark deprecated skills before removal.
- Keep release notes tied to merged commits.
