# System Prompt Design Checklist

## Contract

- [ ] The system prompt defines one stable agent role and audience.
- [ ] Responsibilities, scope, non-goals, and authority boundaries are explicit.
- [ ] Stable rules are separated from task-specific prompts and repository context.
- [ ] Host-specific installation details are isolated in an adapter.

## Behavior

- [ ] Persona supports the responsibility without pretending to grant authority.
- [ ] Constraints cover privacy, safety, permissions, evidence, and change management.
- [ ] Workflow orchestration defines normal, ambiguous, blocked, unsafe, and completion transitions.
- [ ] Output contracts cover clarification, progress, blocked work, findings, and completion.
- [ ] The prompt does not request hidden chain-of-thought or rely on unverifiable confidence.

## Role Templates

- [ ] Code reviewer, debugger, architect, test generator, and documentation writer templates are available.
- [ ] Each role names scope, workflow, output, and safety boundaries.
- [ ] Templates are adapted rather than combined into an ambiguous universal persona.

## Lifecycle

- [ ] Evaluation cases include normal work, conflicts, unsafe requests, tool failure, and handoff.
- [ ] Model, host, adapter, prompt version, cases, and results are recorded.
- [ ] Rollout, rollback, owner, review triggers, and retirement criteria are defined.
- [ ] Enforceable safety controls are implemented outside the prompt where possible.
- [ ] Repository validation passes and no secrets or private data are included.
