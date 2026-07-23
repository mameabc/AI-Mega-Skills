# Skill Review Prompt Template

Use this prompt when reviewing one submitted skill.

```text
Review this skill against the repository standards:

Skill path: {{skill_path}}
Related domain: {{domain_slug}}
Known similar skills: {{similar_skill_paths}}

Check purpose, scope, duplication, examples, references, safety, validation, README updates, registry updates, and category index updates.
Return blocking issues first, then non-blocking improvements, then approval status.
```

