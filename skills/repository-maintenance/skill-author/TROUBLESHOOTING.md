# Skill Author Troubleshooting

## Duplicate Scope

Stop creation, compare the proposed behavior with the existing Skill, and identify whether an extension or refactor solves the need without a new slug.

## Generator Prompts Are Incomplete

Stop and gather the missing purpose, owner, domain, inputs, outputs, examples, or official references. Do not answer prompts with guessed values.

## Registry or README Drift

Run both generation scripts from the repository root. Inspect the generated diff; do not manually patch generated files.

## Validation Failure

Read the first failing path and rule, fix the authored source, rerun the generator if needed, and rerun the full validator.

## Unsafe or Unverifiable Workflow

Narrow the scope or request maintainer direction. Do not publish a Skill whose key claims or checks cannot be supported.
