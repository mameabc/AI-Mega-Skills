# System Prompt Design Common Mistakes

- Combining system responsibilities, task instructions, and repository context into one unmaintainable block.
- Using "senior engineer" or "expert" as a substitute for authority, scope, and acceptance rules.
- Giving the agent contradictory priorities without an escalation path.
- Defining a workflow without transitions for ambiguity, unsafe requests, tool failures, or blocked work.
- Requiring polished output while omitting evidence, paths, assumptions, or residual risk.
- Assuming system, developer, custom instruction, and user roles have identical precedence across vendors.
- Embedding volatile model names, tool syntax, repository facts, or credentials in the stable prompt.
- Treating a system prompt as a security boundary when permissions and runtime controls are required.
- Combining reviewer, debugger, architect, test, and documentation roles without a clear mode boundary.
- Changing the prompt without recording version, evaluation cases, regressions, or rollback state.
