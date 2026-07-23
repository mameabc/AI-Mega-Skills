# System Prompt Design Best Practices

- Define durable responsibilities, not a theatrical persona or a list of every possible task.
- Make authority and escalation behavior explicit before workflow details.
- Keep scope, non-goals, and stable constraints close to the role definition.
- Use named workflow phases and state transitions instead of vague commands to be helpful.
- Specify output contracts for clarification, blocked work, review findings, and completion.
- Keep portable source separate from host adapters and volatile tool syntax.
- Prefer concise rationale and observable evidence over requests for hidden reasoning.
- Link to authoritative policies and enforce hard controls with permissions, schemas, tests, or runtime checks.
- Version prompts, evaluate representative failures, and keep a rollback version.
- Review system prompts after model, host, tool, policy, or repository workflow changes.
