# AI Code Review Best Practices

- Read the complete change and affected behavior before writing findings.
- Start with correctness and security impact, then assess maintainability and style.
- Trace realistic failure paths instead of listing hypothetical concerns.
- Cite exact locations and authoritative evidence for every blocking finding.
- Separate defects, questions, observations, and preferences.
- Recommend the smallest credible remediation, not an unsolicited rewrite.
- Check tests for behavior, boundaries, isolation, determinism, and regression value.
- Review API and architecture changes for compatibility and operational consequences.
- Use fresh commands and label unverified evidence honestly.
- Preserve positive observations that explain why safe behavior should remain.
