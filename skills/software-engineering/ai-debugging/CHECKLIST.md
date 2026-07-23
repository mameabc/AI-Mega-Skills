# AI Debugging Checklist

## Scope and Reproduction

- [ ] Symptom, expected behavior, impact, and affected scope are explicit.
- [ ] Version, environment, configuration, flags, identity, input, and timing are recorded.
- [ ] Smallest reproduction and success/failure rate are documented.
- [ ] A known-good control is available or the missing control is stated.

## Evidence

- [ ] Logs are correlated and read chronologically.
- [ ] Stack traces are mapped to application-owned code and wrapped causes.
- [ ] Metrics, traces, queue state, database state, profiles, or dumps are relevant and comparable.
- [ ] Observations are separated from hypotheses.
- [ ] Sensitive data is redacted and access is authorized.

## Investigation

- [ ] A causal chain from trigger to impact is written.
- [ ] Hypotheses have predictions and distinguishing experiments.
- [ ] Experiments change one meaningful variable and preserve a control.
- [ ] Binary search is used only with an ordered range and stable oracle.
- [ ] Distributed, async, performance, or memory-specific risks are checked when relevant.

## Fix and Verification

- [ ] Root cause is supported by evidence, not only a plausible stack frame.
- [ ] Fix addresses the cause and has acceptable operational risk.
- [ ] Original failure no longer reproduces.
- [ ] Nearby inputs, concurrency, failure paths, and rollback behavior are checked.
- [ ] Regression test, invariant, diagnostic, alert, or runbook update is added.
- [ ] Remaining uncertainty and follow-up work are recorded.
