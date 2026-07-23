# AI Code Review Troubleshooting

## The Diff Is Incomplete

Stop the decision, identify the missing base, generated output, dependency, or file, and request the complete change before approving.

## Intent Is Unclear

Ask for acceptance criteria and intended compatibility. Review observable behavior only after the missing contract is resolved or clearly marked as a risk.

## A Finding Is Hard to Reproduce

Separate observed behavior from hypothesis, provide the trigger and evidence, and request a focused test or owner confirmation. Do not inflate severity to compensate for uncertainty.

## The Review Has Too Many Findings

Remove duplicates and style-only comments, group findings by root cause, and order by impact. Keep only feedback that changes a safe merge decision or materially improves the code.

## Tests Are Missing or Unreliable

Identify the changed behavior and the smallest deterministic regression or boundary test. Record the gap if the required environment or fixture is unavailable.

## Security Evidence Needs Sensitive Access

Stop before accessing secrets or production data. Use a minimal local reproduction, sanitized fixture, official policy, or authorized security process.

## API or Architecture Impact Is Unclear

Trace callers, schemas, ownership, deployment boundaries, migrations, and rollback. State the unknown and decision owner rather than rejecting a design on preference.

## The Agent Cannot Run Checks

Report the exact unavailable command or permission, inspect source and tests that are accessible, downgrade certainty, and leave explicit validation gaps.
