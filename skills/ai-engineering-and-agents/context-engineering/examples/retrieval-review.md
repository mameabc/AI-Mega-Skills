# Retrieval Review Context Packet

## Scenario

A reviewer needs to assess whether a pull request changes authorization behavior in a large service repository.

## Retrieval Plan

```text
Objective: Review authorization impact of the pull request.
Start with:
1. Complete diff and changed route registration.
2. Authorization middleware and policy definitions.
3. Direct callers, data access boundary, and focused tests.
4. Recent history for changed policy or route behavior.
Exclude: unrelated services, generated vendor code, and raw logs without a confirmed connection.
Rank evidence: current policy and tests > current implementation > recent history > summaries > semantic-only matches.
Verification: run focused authorization tests and identify any untested route or privilege path.
Stop rule: stop retrieval when every changed endpoint has a traced authorization path and test or an explicit gap.
```

## Expected Agent Behavior

The reviewer should use exact route and policy anchors, follow structural relationships, check semantic matches against source, and report both findings and evidence gaps without treating retrieval similarity as proof.
