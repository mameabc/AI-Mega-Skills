# AI Debugging Best Practices

- Start with observable behavior and a reproducible or measurable signal.
- Preserve a failing case and a known-good control.
- Prefer experiments that maximize information while remaining reversible.
- Record commands, inputs, versions, results, and uncertainty.
- Treat logs and stack traces as evidence about a path, not automatic proof of cause.
- Establish a stable oracle before bisecting.
- Follow contracts and invariants across service, async, queue, cache, and database boundaries.
- Profile representative workloads before changing performance-sensitive code.
- Distinguish memory leaks from legitimate retention and transient peaks.
- Fix the root cause, then add the smallest regression protection that would have caught it.
- State what was not tested and never fabricate observations or successful commands.
