# Context Engineering Checklist

## Planning

- [ ] The engineering objective is one concrete decision, change, diagnosis, or review.
- [ ] Candidate sources are ranked by authority, relevance, freshness, and verification value.
- [ ] A context budget and retrieval stop rule are defined.
- [ ] Sensitive data and untrusted sources are excluded or controlled.

## Organization and Retrieval

- [ ] Repository orientation, policy, architecture, implementation, verification, and history are separated.
- [ ] Retrieval uses appropriate lexical, structural, semantic, historical, or hybrid strategies.
- [ ] The dependency slice contains the entry point, implementation, consumers, boundaries, and tests needed for the task.
- [ ] Summaries preserve decisions, invariants, commands, provenance, and open questions.

## Execution

- [ ] Context is added incrementally and invalid assumptions are removed.
- [ ] Multi-step state records completed work, facts, decisions, next action, and validation status.
- [ ] Context is refreshed after file changes, contradictions, boundary crossings, or staleness.
- [ ] Large windows are checkpointed before critical evidence is truncated.

## Quality and Safety

- [ ] Token, latency, cost, cache, and rework effects are measured where relevant.
- [ ] The host agent's actual tools, limits, and compaction behavior are recorded.
- [ ] Provenance distinguishes observed facts, inferences, historical information, and unknowns.
- [ ] No secrets or private data were indexed or included.
- [ ] The repository validator passes and remaining uncertainty is reported.
