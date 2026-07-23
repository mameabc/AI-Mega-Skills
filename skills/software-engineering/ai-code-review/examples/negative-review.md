# Negative Review Example

## Scenario

A pull request adds an administrative export route, checks only whether a user has a session, and contains no non-admin authorization test.

## Review

```text
High: `src/routes/admin.ts:57` authorizes the new export route using the presence of a session but does not enforce the existing admin scope. Any authenticated user can reach the export path and receive organization-wide data. The neighboring `src/auth/scopes.ts:18` defines the required scope, but no test covers this route. Enforce the admin scope at the route boundary and add an authenticated-non-admin regression test before merge.
```

## Why It Works

It names the exact path, trigger, impact, source evidence, and smallest remediation. The severity is tied to reachable data exposure rather than reviewer preference.
