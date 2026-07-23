# System Prompt Design Troubleshooting

## The Agent Ignores Stable Rules

Check host precedence, installation location, truncation, adapter behavior, and conflicting instructions before rewriting the prompt. Confirm the rule appears in the actual deployed layer.

## The Agent Acts Outside Its Role

Compare the requested action with scope and authority. Add a concrete handoff or escalation condition, then enforce the boundary with permissions or workflow controls when it matters.

## The Prompt Is Too Long and Behavior Is Inconsistent

Remove duplicated principles, task examples, stale repository facts, and provider syntax. Keep only durable role contracts and move volatile material to context or task prompts.

## Workflow Phases Are Skipped

Define observable entry and exit conditions for each phase, especially plan checkpoints and verification. Add a state-shaped output contract rather than repeating "be thorough."

## Outputs Are Polished but Unreliable

Require paths, evidence, assumptions, failed checks, and residual risk. Compare against representative cases and inspect whether the prompt encourages unsupported claims.

## Role Templates Conflict

Keep role templates separate, define one active role per deployment, and use explicit handoff rules for cross-role work. Do not build a universal prompt by concatenating every template.

## Vendor Behavior Differs

Read the host's current instruction and precedence documentation, record the adapter mapping, and test equivalent capabilities. Keep provider-specific corrections in the adapter rather than weakening the portable contract.

## A Prompt Change Regresses Existing Workflows

Restore the prior version, compare the failing cases, identify the changed responsibility or precedence, and roll forward with a narrower change plus regression coverage.
