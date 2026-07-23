# AI Code Review Checklist

## Review Setup

- [ ] The complete diff and comparison base are known.
- [ ] Stated intent, acceptance criteria, affected interfaces, and priorities are available.
- [ ] Relevant source, tests, policy, configuration, and references were inspected.
- [ ] Missing evidence and assumptions are explicitly recorded.

## Analysis

- [ ] Correctness and invariants were checked for normal and failure paths.
- [ ] Readability and maintainability risks were considered without style nitpicking.
- [ ] Performance, resource use, concurrency, and caching were assessed where relevant.
- [ ] Authentication, authorization, validation, data exposure, and trust boundaries were checked.
- [ ] Error handling, cleanup, retries, timeouts, and partial failure were checked.
- [ ] Tests cover material behavior changes and meaningful edge cases.
- [ ] API compatibility, schema, errors, idempotency, and documentation were checked.
- [ ] Architecture and operational consequences were separated from personal preference.

## Findings

- [ ] Every finding has severity, exact location, trigger, impact, evidence, and action.
- [ ] Findings are ordered by severity and blockers are clearly identified.
- [ ] Positive observations are separate from required changes.
- [ ] No unsupported claims, secrets, private data, or speculative severity are included.

## Decision

- [ ] Focused checks and their observed results are listed.
- [ ] Decision is approve, approve with observations, request changes, or reject.
- [ ] Residual risk, coverage gaps, and follow-up owners are explicit.
