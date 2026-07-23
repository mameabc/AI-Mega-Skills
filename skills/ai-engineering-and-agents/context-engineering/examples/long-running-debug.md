# Long-Running Debug Context Handoff

## Scenario

A multi-step investigation of intermittent queue latency crosses application code, deployment configuration, metrics, and recent operational changes.

## Handoff Record

```text
Objective: Explain the p95 latency increase after the worker deployment and identify the smallest safe corrective action.
Observed facts:
- Metrics query and time range: <record actual query and result>
- Worker code path: <source link and commit>
- Deployment change: <manifest, diff, or release link>
Ruled out:
- <hypothesis> because <check and result>
Current hypothesis: <one ranked explanation>
Next check: <single query, file inspection, or reproducible test>
Completed steps: <ordered actions with evidence>
Open questions: <unknowns and owners>
Context refresh: replace metrics and deployment facts when the time range or release changes.
```

## Expected Agent Behavior

The next agent should continue from the handoff, verify the current hypothesis, avoid repeating completed retrieval, update the record after each check, and report uncertainty if production evidence is unavailable.
