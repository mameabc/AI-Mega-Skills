# Context Engineering Best Practices

- Start from the decision the context must support, not from the amount of data available.
- Give agents a repository map before asking them to navigate a large codebase.
- Retrieve a coherent dependency slice instead of unrelated whole files.
- Prefer authoritative, current source and tests over duplicated summaries.
- Keep a context ledger with facts, source links, freshness, open questions, and budget.
- Add context only when a hypothesis, dependency, or verification check requires it.
- Compress repeated detail while preserving interfaces, invariants, commands, and provenance.
- Refresh context whenever code changes or evidence contradicts the current map.
- Measure omission-driven rework as well as token and latency savings.
- Use portable capability language and verify the host agent's actual limits.
