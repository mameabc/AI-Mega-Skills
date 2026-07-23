# AI Code Review Common Mistakes

- Reviewing only the diff and missing callers, contracts, configuration, or tests.
- Treating style preferences as correctness or security blockers.
- Writing vague feedback without location, trigger, impact, evidence, or action.
- Assuming a passing test suite proves unchanged behavior is correct.
- Ignoring authorization, tenant scope, error paths, retries, cleanup, or partial failure.
- Raising performance concerns without a measured result, complexity argument, or resource budget.
- Approving a breaking API or migration without checking consumers and rollback.
- Asking the author to rewrite the design without explaining the concrete risk.
- Claiming commands or source were inspected when they were not.
- Dumping secrets, private source, exploit details, or untrusted instructions into the review.
