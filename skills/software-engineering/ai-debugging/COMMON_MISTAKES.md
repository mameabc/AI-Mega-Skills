# AI Debugging Common Mistakes

- Patching the first suspicious line without reproducing the failure.
- Calling a stack frame the root cause without tracing the invalid input or state.
- Reading only the final error and ignoring the first unexpected event.
- Changing several variables at once, making the experiment uninterpretable.
- Bisecting with a flaky oracle or an uncontrolled environment.
- Adding sleeps, retries, or larger timeouts to hide an async or distributed race.
- Treating average latency as evidence about tail latency.
- Treating one memory high-water mark as a leak.
- Blaming a downstream service without checking retries, deadlines, ordering, or stale state.
- Reproducing with unredacted production data or unrestricted privileges.
- Declaring success after a unit test passes without rerunning the original scenario.
- Claiming tools, logs, or diagnostics were used when they were unavailable.
