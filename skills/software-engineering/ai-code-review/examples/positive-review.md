# Positive Review Example

## Scenario

A change adds tenant-aware cache keys and a regression test for two organizations using the same resource ID.

## Review

```text
Medium: `src/cache/key.ts:22` builds the cache key from the normalized tenant ID and resource ID, so cross-tenant collisions are avoided. The new test at `test/cache-isolation.spec.ts:41` covers two tenants using the same resource ID. Focused tests passed with `npm test -- cache-isolation`.

Observation: The invalidation path uses the same key builder and is documented in the change description. No action is required for this change.
```

## Why It Works

It records location, evidence, behavior, and the absence of a required action without manufacturing a defect or using style feedback as a blocker.
