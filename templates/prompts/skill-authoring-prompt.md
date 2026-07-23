# Skill Authoring Prompt Template

Use this prompt when drafting one requested skill.

```text
Create one production-quality AI Skill for:

Skill name: {{skill_name}}
Domain: {{domain_slug}}
Problem: {{problem_statement}}
Primary users: {{user_group}}
Required sources: {{official_sources}}
Expected output: {{expected_output}}
Validation method: {{validation_method}}

Follow the official template in templates/skill/.
Do not duplicate existing skills.
Do not invent facts or references.
Include best practices, common mistakes, troubleshooting, examples, and checklist items.
```

