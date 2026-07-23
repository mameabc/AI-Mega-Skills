# AI Skills Library Foundation Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build the repository foundation for a 500+ skill open-source AI Skills library before generating any skills.

**Architecture:** Use a documentation-first monorepo with future skills grouped by domain, machine-readable manifests, generated registry indexes, and CI-enforced quality checks. The first implementation stage establishes repository contracts and review workflow without adding skill implementations.

**Tech Stack:** Markdown documentation, JSON Schema, PowerShell validation script, GitHub Actions.

## Global Constraints

- Do not generate skills during the foundation phase.
- Keep future skill implementations under `skills/<domain>/<skill-slug>/`.
- Require a `SKILL.md` and `manifest.json` for every future skill.
- Use semantic versioning for both the library and individual skills.
- Reject bulk-generated skills unless each skill passes normal review standards.

---

### Task 1: Foundation Documentation

**Files:**
- Create: `README.md`
- Create: `ROADMAP.md`
- Create: `CONTRIBUTING.md`
- Create: `docs/architecture/repository-structure.md`
- Create: `docs/quality/skill-quality-standard.md`
- Create: `docs/workflow/development-workflow.md`
- Create: `docs/releases/versioning.md`
- Create: `docs/governance/maintainers.md`

**Interfaces:**
- Consumes: Empty repository baseline.
- Produces: Human-readable project standards used by all later tasks.

- [ ] **Step 1: Add README and roadmap**

Create the files listed above with the foundation content already present in this repository.

- [ ] **Step 2: Validate Markdown files exist**

Run:

```powershell
Get-ChildItem README.md, ROADMAP.md, CONTRIBUTING.md
```

Expected: all three files are listed.

- [ ] **Step 3: Commit**

```powershell
git add README.md ROADMAP.md CONTRIBUTING.md docs
git commit -m "docs: add repository foundation"
```

### Task 2: Domain Roadmap

**Files:**
- Create: `docs/domains/500-skill-domain-roadmap.md`

**Interfaces:**
- Consumes: Roadmap strategy from `ROADMAP.md`.
- Produces: A 625-slot domain backlog that can be pruned to 500+ accepted skills.

- [ ] **Step 1: Add domain allocation**

Create a domain table covering at least 20 domains and at least 500 planned skills.

- [ ] **Step 2: Add domain clusters**

For each domain, list practical clusters that future contributors can turn into skill proposals.

- [ ] **Step 3: Verify total capacity**

Run:

```powershell
Select-String -Path docs/domains/500-skill-domain-roadmap.md -Pattern "Total"
```

Expected: total planned capacity is greater than 500.

- [ ] **Step 4: Commit**

```powershell
git add docs/domains/500-skill-domain-roadmap.md
git commit -m "docs: add 500 skill domain roadmap"
```

### Task 3: Validation and CI

**Files:**
- Create: `scripts/validate-repository.ps1`
- Create: `.github/workflows/ci.yml`
- Create: `.github/pull_request_template.md`
- Create: `.github/ISSUE_TEMPLATE/skill-proposal.yml`

**Interfaces:**
- Consumes: Required documentation paths from Task 1 and Task 2.
- Produces: Local and GitHub validation entrypoint.

- [ ] **Step 1: Add validation script**

The script must fail when required foundation files are missing, when placeholder markers appear in docs, or when future skill folders are malformed.

- [ ] **Step 2: Add GitHub Actions workflow**

Run validation on pull requests and pushes to `main`.

- [ ] **Step 3: Run validation**

```powershell
pwsh scripts/validate-repository.ps1
```

Expected: `Repository validation passed.`

- [ ] **Step 4: Commit**

```powershell
git add scripts .github
git commit -m "ci: add repository validation workflow"
```

### Task 4: Schema and Registry Contract

**Files:**
- Create: `schemas/skill-manifest.schema.json`
- Create: `registry/domains/README.md`
- Create: `registry/indexes/README.md`

**Interfaces:**
- Consumes: Structure rules from `docs/architecture/repository-structure.md`.
- Produces: The manifest contract future skills must satisfy.

- [ ] **Step 1: Add JSON Schema**

Define required manifest fields: `slug`, `name`, `description`, `domain`, `subdomain`, `version`, `owners`, `tags`, `inputs`, `outputs`, `validation`, `license`, and `status`.

- [ ] **Step 2: Add registry documentation**

Document which files are curated and which will be generated.

- [ ] **Step 3: Run validation**

```powershell
pwsh scripts/validate-repository.ps1
```

Expected: `Repository validation passed.`

- [ ] **Step 4: Commit**

```powershell
git add schemas registry
git commit -m "docs: define skill manifest and registry contract"
```

