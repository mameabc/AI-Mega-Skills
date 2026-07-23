# Prompt Engineering Best Practices

- Lead with the outcome and acceptance criteria instead of a persona.
- Provide bounded, authoritative context and ask the agent to inspect source files.
- Separate non-negotiable constraints from preferences so tradeoffs are visible.
- Define an output contract that makes omissions and unsupported claims easy to detect.
- Add checkpoints before risky edits and fresh verification after them.
- Prefer concise rationale, assumptions, and evidence over requests for hidden reasoning.
- Use portable capability language and let each host map it to its own tools.
- Evaluate prompts with fixed cases and observable scoring, not aesthetic preference.
- Change one meaningful variable at a time when comparing prompt revisions.
- Keep prompts free of secrets, private data, and instructions to bypass controls.
