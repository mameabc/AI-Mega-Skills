# Roadmap

## Mission

Build the largest open-source AI Skills library by combining broad domain coverage with strict quality gates, discoverable metadata, repeatable review, and semantic versioning.

## North Star

A user should be able to find a skill by domain, task, toolchain, or expected output, trust its behavior, inspect its examples, and adopt it without reading the entire repository.

## Phase 0: Repository Foundation

**Goal:** Establish structure and contribution rules before generating skills.

Deliverables:

- Repository structure for domains, registry metadata, schemas, docs, and automation.
- Skill quality rubric with acceptance criteria.
- Contribution guide with proposal, authoring, review, and release flow.
- Versioning policy for skills and library releases.
- GitHub Actions workflow for markdown, schema, metadata, and placeholder checks.
- Implementation roadmap for 500+ skills grouped by domain.

Exit criteria:

- CI runs on pull requests.
- Contribution path is documented end to end.
- Each future skill has a defined metadata contract.
- Domain backlog can support 500+ skills without restructuring.

## Phase 1: Standards and Tooling

**Goal:** Make quality measurable before accepting skills.

Deliverables:

- JSON Schema for skill manifests.
- Registry index format.
- Validation script for manifests, domain placement, naming, required docs, and examples.
- Review checklist templates.
- Domain taxonomy with stable slugs.

Exit criteria:

- A contributor can validate a skill locally.
- Maintainers can reject incomplete skills with objective reasons.
- Registry generation is deterministic.

## Phase 2: Pilot Skill Batches

**Goal:** Prove the workflow with a small, representative set.

Recommended pilot domains:

- Software engineering
- Data analysis
- Writing and research
- Business operations
- Design and media

Exit criteria:

- 25 to 50 accepted skills.
- At least five domains represented.
- Every accepted skill has tests, examples, and owner metadata.
- CI catches malformed contributions.

## Phase 3: Domain Expansion

**Goal:** Scale to 250+ high-quality skills.

Deliverables:

- Domain steward model.
- Batch review process.
- Public contribution board.
- Release notes grouped by domain and impact.

Exit criteria:

- 250+ accepted skills.
- No domain has unreviewed bulk imports.
- Deprecated or superseded skills have migration notes.

## Phase 4: Largest Open-Source Library

**Goal:** Reach 500+ accepted skills without lowering standards.

Deliverables:

- 500+ validated skills.
- Generated searchable registry.
- Compatibility matrix for supported AI coding and agent environments.
- Usage analytics plan that does not require collecting private user data.
- Long-term maintenance policy.

Exit criteria:

- 500+ accepted skills across 20+ domains.
- Clear ownership for each domain.
- Stable release cadence.
- Public quality dashboard.

## Phase 5: Ecosystem

**Goal:** Turn the library into a durable open-source ecosystem.

Deliverables:

- External domain packs.
- Maintainer onboarding.
- Compatibility tests across supported runtimes.
- Documentation site.
- Community governance model.

