# Prompt Engineering Troubleshooting

## The Agent Produces Vague or Generic Work

Replace broad quality language with a concrete outcome, authoritative context, hard constraints, output schema, and observable acceptance checks.

## The Agent Edits the Wrong Files

List the repository root, allowed paths, excluded paths, relevant interfaces, and a plan checkpoint before implementation. Ask the agent to report the planned file set.

## Results Differ Across Coding Agents

Separate portable task instructions from host adapters. Record actual tools and permissions, remove provider-specific assumptions, and compare equivalent capabilities rather than command names.

## The Agent Claims Success Without Evidence

Require exact commands, test results, inspected files, assumptions, and unresolved risks in the output contract. Treat unsupported claims as failures in evaluation.

## The Prompt Is Too Long to Use Reliably

Remove repeated principles and non-authoritative context, move heavy reference material to linked files, and retain only instructions that change the evaluated behavior.

## A Revision Improves One Case and Hurts Another

Rerun the complete fixed test set, inspect the tradeoff, and narrow the rule. Do not optimize for a single example or hide regressions by changing the benchmark.

## The Request Involves Sensitive or Destructive Work

Add explicit authority, preview, confirmation, data-handling, and rollback requirements. Stop if the prompt cannot establish safe authority.
