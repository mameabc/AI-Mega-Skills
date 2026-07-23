# Prompt Engineering Checklist

## Scope and Context

- [ ] The prompt names one observable engineering outcome.
- [ ] Authoritative repository context and exclusions are explicit.
- [ ] Hard constraints are separated from preferences.
- [ ] The prompt does not assume a vendor-specific tool or role format.

## Agent Behavior

- [ ] Required inputs, expected outputs, and format are explicit.
- [ ] The workflow includes inspection, planning, execution, and verification where risk requires it.
- [ ] Ambiguity, missing authority, unsafe actions, and failed checks have stop conditions.
- [ ] The prompt requests concise rationale and evidence rather than hidden chain-of-thought.

## Evaluation

- [ ] A baseline prompt and fixed representative tasks exist.
- [ ] Tests include normal, ambiguous, and failure-prone cases.
- [ ] Scoring measures correctness, completeness, scope, maintainability, and evidence.
- [ ] Model, host, tools, repository state, prompt version, and date are recorded.
- [ ] Revisions address observed failures and are rerun against the same cases.

## Safety and Maintenance

- [ ] No secrets or private data appear in prompts or fixtures.
- [ ] Destructive and externally visible actions require authority and confirmation.
- [ ] Generated code is treated as untrusted until reviewed and tested.
- [ ] Official documentation and research references are current and linked.
- [ ] Repository validation passes and the prompt's limitations are documented.
