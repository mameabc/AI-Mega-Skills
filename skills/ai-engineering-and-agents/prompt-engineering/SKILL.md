# Prompt Engineering

## Description

Design, improve, and evaluate prompts that help any compatible AI coding agent perform software-engineering work with clear scope, useful reasoning, verifiable outputs, and controlled risk.

## Use This Skill When

- A coding task produces inconsistent, vague, incomplete, or unverifiable agent results.
- A team needs a reusable prompt for implementation, debugging, review, planning, testing, or refactoring.
- A prompt must work across Claude, Codex, OpenCode, Cursor, Gemini, or another compatible coding agent.
- A prompt needs an evaluation method rather than a subjective claim that it sounds better.

## Do Not Use This Skill When

- The task can be solved directly with a single obvious instruction and no reusable prompt is needed.
- The requested result depends on hidden context, private credentials, undocumented tool behavior, or an unavailable repository.
- The prompt is intended to bypass permissions, safety controls, reviews, tests, or another agent's operating rules.
- The work needs domain expertise or policy advice that the prompt cannot safely supply.

## Required Inputs

- `task goal`: the software outcome, audience, and success condition.
- `available context`: repository paths, interfaces, constraints, existing decisions, and relevant references.
- `agent capabilities`: the host's actual tools, file access, execution permissions, and output limits.
- `evaluation criteria`: correctness, completeness, maintainability, safety, latency, cost, or other measurable dimensions.

## Expected Outputs

- A vendor-neutral prompt with explicit goal, context, constraints, workflow, output contract, validation, and stop conditions.
- A small set of realistic test cases covering normal, ambiguous, and failure-prone requests.
- Evaluation results that separate prompt quality from model, tool, repository, and environment effects.
- A revision decision based on observed failures, not wording preference alone.

## Prompt Design Principles

### 1. Define the outcome, not the persona

State the artifact or decision the agent must produce, who will use it, and what makes it correct. A role can supply useful perspective, but a title such as “senior engineer” is not a substitute for acceptance criteria.

### 2. Provide bounded context

Give the smallest sufficient repository paths, interfaces, examples, constraints, and history. Tell the agent what it may inspect and what it must not assume. Do not paste large context that the agent cannot reliably use or that contains secrets.

### 3. Make constraints testable

Turn preferences into observable rules: files that may change, compatibility targets, performance budgets, security boundaries, required commands, and prohibited side effects. Separate hard constraints from preferences.

### 4. Specify the output contract

Name the required format, sections, file paths, code interfaces, decision states, and evidence. A strong output contract makes omission visible and lets a reviewer compare runs.

### 5. Teach a process with checkpoints

For work with meaningful risk, require inspect, plan, implement, verify, and report phases. Give the agent permission to stop between phases when a missing fact or conflicting requirement changes the design.

### 6. Require evidence, not confidence

Ask for commands run, tests observed, files inspected, assumptions, and remaining risk. Do not ask for hidden chain-of-thought; request concise decisions, relevant rationale, and verifiable artifacts.

### 7. Define ambiguity and stop conditions

Say what the agent should ask, what it may reasonably assume, and when it must stop. This prevents confident invention when requirements, access, or safety authority are missing.

### 8. Design for the host agent

Use portable concepts such as repository root, file inspection, patch, command execution, and review. Before execution, have the agent map those concepts to the host's available tools instead of assuming a Claude, Codex, Cursor, OpenCode, or Gemini-specific command.

### 9. Optimize for evaluation and iteration

Change one meaningful prompt variable at a time where practical. Keep fixed test cases, record failures, and compare quality against a baseline. A shorter prompt is not automatically better if it increases omissions or rework.

## Prompt Patterns

### Task contract

Use for implementation and maintenance work. State goal, scope, inputs, constraints, output, validation, and stop conditions in that order.

### Context packet

Use when the agent needs repository knowledge. List authoritative files, relevant symbols, current behavior, and exclusions. Ask the agent to inspect the files rather than trust a pasted summary.

### Plan then execute

Use when changes cross modules or have meaningful risk. Require a short plan with affected files and tests, a checkpoint, implementation, and fresh verification.

### Diagnosis and hypotheses

Use for bugs. Require reproduction, observations, ranked hypotheses, a minimal confirming check, root cause, smallest fix, regression test, and residual risk.

### Reviewer and critic

Use for code or design review. Define the review target, severity scale, evidence standard, and output as findings first, followed by assumptions and a short summary.

### Test-first change

Use when behavior must be preserved or a bug needs a regression test. Ask for the failing or reproducing check, minimal implementation, passing rerun, and unrelated-test result.

### Constrained transformation

Use when converting code or documents. Define what must remain equivalent, what may change, the target format, prohibited changes, and comparison checks.

### Escalation gate

Use when permissions, privacy, security, production access, or destructive actions are involved. Require explicit authority, preview, confirmation, and rollback or recovery evidence.

## Common Prompt Structures

### General engineering structure

```text
Goal: <observable software outcome>
Context: <authoritative files, behavior, interfaces, and relevant history>
Constraints: <hard limits, compatibility, safety, and files in scope>
Non-goals: <what must remain unchanged>
Process: <inspect, plan, implement, verify, report>
Output: <artifacts, format, and decision information>
Validation: <commands, tests, review checks, and evidence>
Stop conditions: <missing authority, ambiguity, unsafe action, or failed check>
```

### Bug investigation structure

```text
Reproduce: <exact command, input, or observed failure>
Evidence: <logs, stack, state, and relevant files>
Hypotheses: <ranked explanations and confirming checks>
Fix boundary: <smallest allowed change>
Regression: <test that fails before the fix and passes after it>
Report: <root cause, changed files, validation, and residual risk>
```

### Review structure

```text
Review target: <diff, design, prompt, or Skill>
Priority: <correctness, security, reliability, maintainability>
Evidence: <files, tests, references, and assumptions>
Findings: <severity, location, impact, and fix>
Decision: <approve, request changes, or reject>
```

## Evaluation Method

1. Define the baseline prompt and fixed representative tasks.
2. Include at least one normal task, one ambiguous task, and one task with a likely failure or unsafe shortcut.
3. Score observable outcomes such as correctness, completeness, test evidence, scope adherence, maintainability, and safe stopping.
4. Record model, host agent, tool access, repository state, prompt version, and run date so results are comparable.
5. Review failures for missing context, weak constraints, poor output shape, incorrect assumptions, or insufficient validation.
6. Revise the smallest prompt element that addresses the observed failure and rerun the same cases.
7. Keep a prompt only when it improves the target outcome without unacceptable cost, latency, verbosity, or loss of flexibility.

## Vendor-Neutral Compatibility

Do not require a provider-specific role name, XML wrapper, tool name, context window, command, or response feature unless the prompt is explicitly scoped to that host. State capabilities as requirements and let the host mapping be explicit. For example, “inspect the repository files” is portable; “use tool X with channel Y” is not portable without a host adapter.

## Safety and Data Handling

- Never include API keys, tokens, private source, personal data, or production secrets in a prompt or evaluation fixture.
- Do not instruct an agent to weaken access controls, bypass review, conceal changes, or claim unrun validation.
- Treat generated code and summaries as untrusted until inspected and tested.
- Require confirmation before destructive or externally visible actions.
- For regulated or high-impact decisions, use qualified human review and authoritative policy sources.

## References

- OpenAI, Prompt engineering guide: https://developers.openai.com/api/docs/guides/prompt-engineering
- Anthropic, Prompt engineering overview: https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/overview
- Google, Prompt design strategies: https://ai.google.dev/gemini-api/docs/prompting-strategies
- Wei et al., *Chain-of-Thought Prompting Elicits Reasoning in Large Language Models*: https://arxiv.org/abs/2201.11903
- Liu et al., *Lost in the Middle: How Language Models Use Long Contexts*: https://arxiv.org/abs/2307.03172
