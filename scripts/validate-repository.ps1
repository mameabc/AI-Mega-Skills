$ErrorActionPreference = "Stop"

$requiredFiles = @(
  "README.md",
  "ROADMAP.md",
  "CONTRIBUTING.md",
  "docs/architecture/repository-structure.md",
  "docs/governance/ai-contributor-guide.md",
  "docs/governance/maintainers.md",
  "docs/quality/documentation-writing-standards.md",
  "docs/quality/naming-conventions.md",
  "docs/quality/repository-coding-standards.md",
  "docs/quality/skill-authoring-standards.md",
  "docs/quality/skill-quality-standard.md",
  "docs/quality/skill-review-standards.md",
  "docs/quality/skill-validation-rules.md",
  "docs/releases/release-workflow.md",
  "docs/releases/versioning.md",
  "docs/domains/500-skill-domain-roadmap.md",
  "docs/workflow/development-workflow.md",
  "templates/skill/SKILL.md",
  "templates/skill/README.md",
  "templates/skill/CHECKLIST.md",
  "templates/skill/BEST_PRACTICES.md",
  "templates/skill/COMMON_MISTAKES.md",
  "templates/skill/TROUBLESHOOTING.md",
  "templates/skill/manifest.json",
  "templates/prompts/skill-authoring-prompt.md",
  "templates/prompts/skill-review-prompt.md",
  "templates/prompts/skill-validation-prompt.md",
  "templates/examples/skill-example.md",
  "templates/reviews/skill-review.md",
  "templates/validation/skill-validation-report.md"
)

$missing = @()
foreach ($file in $requiredFiles) {
  if (-not (Test-Path -LiteralPath $file -PathType Leaf)) {
    $missing += $file
  }
}

if ($missing.Count -gt 0) {
  Write-Error ("Missing required files:`n" + ($missing -join "`n"))
}

$placeholderPatterns = @(
  "\bTBD\b",
  "\bTODO\b",
  "lorem ipsum",
  "coming soon"
)

$markdownFiles = Get-ChildItem -Path . -Filter "*.md" -Recurse -File |
  Where-Object { $_.FullName -notmatch "\\.git\\" }

foreach ($file in $markdownFiles) {
  $content = Get-Content -LiteralPath $file.FullName -Raw
  foreach ($pattern in $placeholderPatterns) {
    if ($content -match $pattern) {
      Write-Error "Placeholder pattern '$pattern' found in $($file.FullName)"
    }
  }
}

if (Test-Path -LiteralPath "skills" -PathType Container) {
  $requiredSkillFiles = @(
    "SKILL.md",
    "README.md",
    "CHECKLIST.md",
    "BEST_PRACTICES.md",
    "COMMON_MISTAKES.md",
    "TROUBLESHOOTING.md",
    "manifest.json"
  )

  $skillDirs = Get-ChildItem -LiteralPath "skills" -Directory -Recurse |
    Where-Object { Test-Path -LiteralPath (Join-Path $_.FullName "SKILL.md") -PathType Leaf -or Test-Path -LiteralPath (Join-Path $_.FullName "manifest.json") -PathType Leaf }

  foreach ($dir in $skillDirs) {
    foreach ($requiredSkillFile in $requiredSkillFiles) {
      $requiredPath = Join-Path $dir.FullName $requiredSkillFile
      if (-not (Test-Path -LiteralPath $requiredPath -PathType Leaf)) {
        Write-Error "Skill directory missing ${requiredSkillFile}: $($dir.FullName)"
      }
    }

    $manifestPath = Join-Path $dir.FullName "manifest.json"
    try {
      $manifest = Get-Content -LiteralPath $manifestPath -Raw | ConvertFrom-Json
    } catch {
      Write-Error "Invalid manifest JSON: $manifestPath"
    }

    $skillSlug = Split-Path -Leaf $dir.FullName
    $domainSlug = Split-Path -Leaf (Split-Path -Parent $dir.FullName)

    if ($manifest.slug -ne $skillSlug) {
      Write-Error "Manifest slug '$($manifest.slug)' does not match folder '$skillSlug': $manifestPath"
    }

    if ($manifest.domain -ne $domainSlug) {
      Write-Error "Manifest domain '$($manifest.domain)' does not match folder '$domainSlug': $manifestPath"
    }
  }
}

Write-Host "Repository validation passed."
