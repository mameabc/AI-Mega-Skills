# AI Debugging Troubleshooting

## The Bug Cannot Be Reproduced

Record the observed rate and conditions instead of converting uncertainty into a guess. Compare deployment, configuration, data shape, timing, identity, and dependency versions. Add safe correlation and timing evidence, then use a known-good control or replay if approved.

## Logs Are Too Noisy or Incomplete

Filter by a request, trace, job, or deployment identifier and construct a timeline. Check sampling, clock skew, truncation, log level, and logger placement. If the decisive event is absent, instrument the boundary explicitly and state the observation gap.

## The Stack Trace Looks Obvious

Inspect the first application-owned frame, wrapped causes, inputs, and state transitions. Reproduce with the same source and build artifacts. The throw site may only be where earlier invalid state became observable.

## Experiments Give Conflicting Results

Check whether the oracle is noisy, the environment changed, caches were warmed, or multiple causes exist. Repeat with a fixed control, record rates rather than binary claims, and reduce the experiment.

## A Distributed Failure Appears Local

Follow one correlation ID across every boundary. Compare timeout budgets, retry counts, queue age, ordering, duplicate delivery, and dependency health. Locate the first contract violation, not just the last error log.

## Async Timing Changes the Outcome

Replace arbitrary delays with controlled scheduling, cancellation checks, repeated runs, and lifecycle assertions. Inspect detached work, exception propagation, cleanup, and shared mutable state.

## Performance or Memory Evidence Is Ambiguous

Define the workload and baseline. Compare equivalent runs using profiles, allocation data, snapshots, GC or allocator metrics, and tail latency. Separate transient peaks from retained ownership and application work from dependency wait.

## Tools or Production Access Are Unavailable

Do not invent results. State the exact missing evidence, provide a safe local reproduction or instrumentation plan, and identify the smallest authorized next step.
