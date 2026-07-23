# Context Engineering Common Mistakes

- Pasting the entire repository instead of defining a task-scoped dependency slice.
- Treating a large context window as proof that all included information will be used accurately.
- Ranking convenient summaries above authoritative source, tests, or current configuration.
- Compressing before identifying which facts, invariants, and provenance must survive.
- Keeping stale instructions or tool results after the repository has changed.
- Retrieving semantically similar files without checking their actual behavior or ownership.
- Losing state between workflow steps and forcing the agent to rediscover decisions.
- Optimizing tokens while increasing incorrect edits, retries, or reviewer effort.
- Assuming context limits, caching, retrieval, or memory behave the same across vendors.
- Indexing secrets or untrusted instructions because they are present in an accessible directory.
