# Production Example: Async Job Race

## Symptom

An order is occasionally marked complete before its payment confirmation is persisted. Adding a delay changes the frequency but does not eliminate the issue.

## Investigation

The agent traces the order ID through the event producer and consumer. The completion task is detached from the transaction and can run after the request handler returns. Controlled scheduling reproduces the interleaving: the completion consumer observes the order before the payment write commits.

## Root Cause and Prevention

The event was published before the transaction commit. The fix uses an outbox written in the same transaction and publishes only committed events. A concurrency regression test asserts that completion cannot observe an uncommitted payment, and metrics track outbox age and publish failures.
