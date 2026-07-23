# Skill Validation Prompt Template

Use this prompt when validating one skill before merge.

```text
Validate this skill:

Skill path: {{skill_path}}
Manifest path: {{manifest_path}}
Expected domain: {{domain_slug}}

Run repository validation.
Confirm required files exist.
Confirm manifest fields match the skill content.
Confirm README, registry, and category index updates are present.
Report pass or fail with evidence.
```

