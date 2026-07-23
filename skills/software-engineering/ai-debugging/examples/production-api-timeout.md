# Production Example: API Timeout

## Symptom

Requests to `GET /reports/{id}` intermittently time out after a deployment. The average latency is unchanged, but p99 increased from 900 ms to 8 s.

## Investigation

The agent compares a failing trace with a known-good trace. The failing trace shows three database retries consuming the request deadline. A binary search across the deployment commits identifies a new query plan hint. Removing the hint in a staging replay restores the prior plan and eliminates the retries.

## Root Cause and Prevention

The hint caused an inefficient plan for large tenants; retries amplified the tail latency. The fix removes the hint, adds a large-tenant query-plan regression test, and alerts on retry count and remaining request deadline. The review records that the original incident was reproduced with a representative tenant rather than inferred from the timeout message.
