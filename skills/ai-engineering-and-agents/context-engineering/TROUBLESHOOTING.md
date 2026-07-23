# Context Engineering Troubleshooting

## The Agent Says It Cannot Find the Relevant Code

Start with repository orientation, search exact task terms and symbols, then follow imports, calls, routes, schemas, and tests. Record the search paths and expand only when a dependency is confirmed.

## The Agent Has Too Much Context but Performs Worse

Measure irrelevant retrieval, repeated instructions, stale history, and tool-log volume. Replace the dump with a ranked dependency slice and retain only facts that change the task or verification.

## The Agent Misses a Critical Constraint

Classify the constraint as task, policy, architecture, implementation, or verification context. Put it in an authoritative source or context packet, link it explicitly, and add a check that would reveal its omission.

## Summaries Become Stale

Attach a commit, version, timestamp, owner, or freshness signal to the summary. Refresh it after changed files, failed checks, migrations, or contradictory evidence.

## The Context Window Fills During a Long Task

Checkpoint objective, facts, decisions, completed steps, open questions, and next action. Remove duplicate prose and raw logs while retaining source links and critical evidence; continue with a new bounded packet.

## Retrieval Returns Similar but Wrong Files

Combine semantic candidates with exact symbols, structural relationships, ownership, and tests. Validate each candidate against the current behavior before treating it as authoritative.

## Different Agents Need Different Context

Keep the repository context and task packet portable, then add a small host adapter describing actual tools, limits, instruction files, and compaction behavior. Do not fork the source facts by vendor.

## Context Includes Sensitive Data

Stop retrieval, remove or redact the data, review index permissions and logs, and continue only with the minimum authorized information.
