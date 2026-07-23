# AI Debugging

## Description

Use this Skill to investigate software failures systematically: reproduce the problem, collect trustworthy evidence, narrow the search space, identify the root cause, verify the fix, and prevent regression. It is a debugging method for AI coding agents, not a collection of vendor-specific commands.

## Use This Skill When

- A program fails, hangs, produces incorrect output, leaks resources, or degrades in performance.
- Logs, stack traces, metrics, traces, dumps, or a reliable reproduction are available or can be collected.
- The next action should reduce uncertainty rather than guess at a patch.
- The issue crosses process, service, queue, database, cache, network, or asynchronous boundaries.

## Do Not Use This Skill When

- The task is to design prompts, organize repository context, or author a persistent system prompt.
- The task is an AI-assisted review of a change without a reported failure; use `ai-code-review`.
- The problem is not yet described well enough to form an observable symptom.
- The request is to rewrite code without investigating why the behavior occurs.

## Required Inputs

1. A precise symptom and expected behavior.
2. The smallest known reproduction, affected version, and environment.
3. Relevant code, configuration, logs, traces, stack traces, metrics, or dumps.
4. Recent changes, known constraints, and the risk of proposed experiments.

If evidence is missing, state the gap and collect it before claiming a root cause.

## Expected Outputs

- A concise symptom and reproduction statement.
- Observations separated from hypotheses.
- Experiments ordered by information gained and operational risk.
- A root cause tied to evidence, or an explicit unresolved state.
- A minimal fix, verification evidence, regression protection, and remaining risks.

## Boundary With Related Skills

- **AI Debugging:** investigates a failing or degraded runtime behavior.
- **AI Code Review:** evaluates change quality and risk, whether or not a failure exists.
- **Prompt Engineering:** designs a task-specific request for an agent.
- **Context Engineering:** selects and organizes the information supplied to an agent.
- **System Prompt Design:** defines persistent behavior and output contracts for an agent.

## Core Debugging Loop

1. **Define:** write the observed result, expected result, scope, and impact.
2. **Reproduce:** establish a deterministic or probabilistic reproduction and record its rate.
3. **Observe:** collect the smallest useful logs, stack traces, metrics, traces, inputs, and versions.
4. **Hypothesize:** list plausible causes and the evidence that would distinguish them.
5. **Experiment:** change one meaningful variable, preserve a control, and record the result.
6. **Localize:** narrow from system to component, boundary, input, state, and code path.
7. **Fix:** address the cause with the smallest maintainable change.
8. **Verify:** reproduce the original failure, test nearby cases, and check operational signals.
9. **Prevent:** add a regression test, diagnostic, alert, invariant, or runbook update.

Never treat the first plausible explanation as the root cause without a falsifiable check.

## Reproducing Bugs

- Capture exact versions, feature flags, configuration, locale, timezone, identity, input, timing, and dependency state.
- Reduce the case while preserving the failure. Record when reduction changes the failure.
- Prefer a deterministic fixture or replayable request. For intermittent bugs, record attempts, successes, and sampling conditions.
- Compare a failing run with a known-good control.
- Do not use production data in an experiment unless authorized; minimize, mask, or synthesize sensitive values.

## Reading Logs

Read logs as a timeline, not as a list of alarming words. Correlate request, trace, job, user-safe entity, and deployment identifiers. Establish the first unexpected event, its causal boundary, and later symptoms. Check clock skew, duplicate retries, sampling, truncation, log level, and whether the log is emitted before or after state changes. Prefer structured fields and source locations over copying large raw logs.

## Stack Trace Analysis

1. Start at the exception type and message.
2. Find the first frame in application-owned code.
3. Walk upward to understand the call path and downward to identify the failing operation.
4. Separate the throw site from the faulty input or state that caused it.
5. Inspect wrapped exceptions, suppressed causes, async continuations, thread/task boundaries, and source/version mismatches.
6. Compare multiple traces to distinguish one root cause from several symptoms.

A stack frame proves where failure surfaced; it does not by itself prove where the invalid state originated.

## Root Cause Analysis

Use a causal chain: **trigger -> invalid state -> violated invariant -> failure -> user impact**. Validate each link with an observation or experiment. Ask why the system allowed the invalid state, why existing detection did not catch it, and what prevention is proportionate. Avoid stopping at labels such as "race condition" or "bad data"; identify the specific interleaving, producer, contract, or assumption.

## Binary Search Debugging

Use bisection when a change range, input sequence, dependency version, configuration set, or time window can be ordered. Define a pass/fail oracle first, test the midpoint, retain the half containing the transition, and repeat. Keep environment and data fixed, record each midpoint, and stop when the smallest meaningful cause is isolated. If the oracle is noisy, increase repetitions or choose another method; do not overinterpret one flaky result.

## Hypothesis-Driven Debugging

For each hypothesis record:

| Field | Question |
| --- | --- |
| Cause | What mechanism could produce the symptom? |
| Prediction | What else should be observable if it is true? |
| Test | What smallest experiment distinguishes it? |
| Result | What happened, including uncertainty? |
| Decision | Keep, reject, or refine the hypothesis? |

Prioritize hypotheses by likelihood, impact, reversibility, and information gain. Do not stack unrelated changes into one experiment.

## Distributed Systems

Trace the request or event across producers, brokers, consumers, services, caches, databases, and external dependencies. Check propagation of correlation identifiers, retries, timeouts, deadlines, idempotency, ordering, duplicate delivery, clock skew, partial failure, stale reads, backpressure, and deployment topology. Compare client-visible timing with server spans and queue age. Identify the first boundary where the contract or invariant changes, rather than blaming the last service that logged an error.

## Async Code

Make scheduling and ownership visible. Check whether work is awaited, cancelled, detached, duplicated, or executed after its owner is disposed. Inspect exception propagation, task state, callback registration, event-loop or synchronization context, shared mutable state, ordering assumptions, and timeout cleanup. Reproduce with controlled delays and repeated runs. A sleep that makes the bug disappear is evidence of a timing dependency, not a fix.

## Performance Issues

Define the affected metric and workload first: latency percentile, throughput, CPU, I/O, allocation rate, queue time, or cost. Compare a baseline and failing profile under equivalent load. Separate wall time from wait time, application work from dependency time, and averages from tail latency. Use sampling or tracing appropriate to the runtime, identify the dominant bottleneck, change one variable, and confirm no correctness or capacity regression. Do not optimize a guessed hotspot.

## Memory Issues

Distinguish leaks, high legitimate retention, fragmentation, allocation bursts, cache growth, and native/external memory. Track resident memory, managed heap or allocator metrics, object counts, lifetime, GC or allocator activity, and process limits over time. Take comparable snapshots or dumps, find retained roots or ownership chains, and test under a representative workload. Verify that memory returns or stabilizes after the workload ends. Do not infer a leak from one high-water mark.

## Decision Trees

### First Triage

```text
Is the symptom observable and scoped?
  No -> define expected behavior, impact, environment, and evidence needed.
  Yes
    Can it be reproduced?
      Yes -> minimize it and capture a failing/known-good pair.
      No -> instrument safely, collect correlations and rates, then classify as intermittent.
    Is there a clear failing boundary?
      Yes -> inspect the contract and state at that boundary.
      No -> trace the path and bisect changes, inputs, or dependencies.
```

### Failure Type Selection

```text
Does output violate an invariant? -> inspect inputs, state transitions, and recent changes.
Does it throw or return an error? -> analyze exception/response path and error handling.
Does it hang or time out? -> inspect waits, locks, queues, cancellation, and dependency deadlines.
Is it slower or more expensive? -> establish a workload baseline and profile the dominant cost.
Does memory grow or exhaust? -> compare snapshots, retention, allocation, and process limits.
Does it occur across services? -> follow trace propagation, retries, ordering, and partial failure.
```

### Experiment Selection

```text
Ordered change/input/version? -> binary search with a stable oracle.
Competing causal explanations? -> hypothesis table and distinguishing experiment.
Timing or race suspected? -> controlled delays, repetition, and scheduler/trace evidence.
External dependency suspected? -> compare controlled stub, known-good dependency, and real path.
No reliable oracle? -> define an invariant or measurable signal before experimenting.
```

## Production Debugging Template

```text
Incident/bug:
Impact and affected scope:
Expected behavior:
Observed behavior:
Environment, version, and configuration:
Smallest reproduction and success rate:
Known-good control:

Observations:
- [fact, source, timestamp or location]

Hypotheses:
- Cause:
  Prediction:
  Distinguishing experiment:
  Result:

Root cause or unresolved gap:
Fix:
Verification of original failure:
Regression protection:
Remaining risks and follow-up:
```

## Vendor-Neutral Operation

The Skill describes reasoning, evidence, and workflow. It does not require a particular model, IDE, CLI, tracing product, runtime, or cloud. Adapt commands to the repository and environment, state assumptions, and never claim to have run a command or inspected evidence that was not actually available.

## Safety and Data Handling

Do not expose secrets, credentials, tokens, personal data, proprietary payloads, or unrestricted production dumps. Redact before sharing with an AI agent. Prefer least-privilege read access, reversible experiments, scoped reproduction, and approved incident procedures. Treat generated patches as hypotheses until validated by tests and operational evidence.

## References

- Google Engineering Practices, debugging guidance in code review and engineering practice: https://google.github.io/eng-practices/
- OpenTelemetry documentation, traces and context propagation: https://opentelemetry.io/docs/
- Microsoft .NET diagnostics overview: https://learn.microsoft.com/dotnet/core/diagnostics/
- Python documentation, debugging and profiling tools: https://docs.python.org/3/library/debug.html
- PostgreSQL documentation, monitoring database activity: https://www.postgresql.org/docs/current/monitoring.html
