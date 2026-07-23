# Large Repository Feature Context Packet

## Scenario

An agent must add a tenant-scoped cache to a multi-service monorepo without leaking data across tenants.

## Context Packet

```text
Objective: Add tenant-scoped cache behavior to the order read path without changing the public response schema.
Repository root: /workspace/orders-platform
Authoritative sources:
- services/orders-api/src/routes/orders
- services/orders-api/src/cache
- packages/tenant-context
- database/migrations and cache contract tests
- service-specific build and test instructions
Dependency slice: route -> application service -> tenant context -> cache key builder -> repository -> focused tests
Constraints:
- Preserve authorization and response behavior.
- Cache keys must include the canonical tenant identifier.
- Change only the order read path and its focused tests.
Context budget: retrieve maps and interfaces first; load implementation ranges only for the dependency slice.
Current facts: record each fact with a source path and commit.
Open questions: identify whether tenant identity is normalized before the cache boundary.
Next check: inspect the cache key builder and run the existing cross-tenant isolation test.
Refresh triggers: changed cache contract, failed isolation test, or discovery of another read path.
```

## Expected Agent Behavior

The agent should retrieve the dependency slice, confirm tenant identity at the cache boundary, avoid reading unrelated services, add a focused isolation test, and report the source paths and validation evidence.
