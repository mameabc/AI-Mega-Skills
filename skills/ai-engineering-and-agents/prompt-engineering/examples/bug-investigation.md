# Bug Investigation Prompt

## Scenario

A background job occasionally processes the same message twice after a worker restart.

## Prompt

```text
Investigate the duplicate processing of messages after a worker restart.

Reproduce: Inspect the worker entry point, message acknowledgement path, retry policy, persistence boundary, and existing tests. Use the repository's documented test command and a deterministic fixture if one exists.

Evidence: Record the observed duplicate sequence, relevant logs or state transitions, and the exact files that define delivery and acknowledgement behavior. Do not infer an external broker guarantee without an official reference.

Hypotheses: List and rank possible causes such as acknowledgement timing, non-idempotent handler behavior, retry visibility, or persistence loss. For each leading hypothesis, run the smallest confirming check before editing.

Fix boundary: Make the smallest safe change that prevents duplicate side effects or makes processing idempotent. Add a regression test that reproduces the failure. Do not weaken delivery guarantees or delete messages to hide the symptom.

Report: State root cause, changed files, regression and full-test results, assumptions, and any remaining at-least-once delivery risk. Stop if the broker contract or production evidence is unavailable.
```

## Validation Evidence

The agent must distinguish observed facts from hypotheses and include a regression check that fails for the original sequence before the fix and passes afterward.
