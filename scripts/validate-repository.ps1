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
  "docs/releases/release-workflow.md",
  "docs/releases/versioning.md",
  "docs/domains/500-skill-domain-roadmap.md",
  "docs/workflow/development-workflow.md"
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
  $skillDirs = Get-ChildItem -LiteralPath "skills" -Directory -Recurse |
    Where-Object { Test-Path -LiteralPath (Join-Path $_.FullName "SKILL.md") -PathType Leaf -or Test-Path -LiteralPath (Join-Path $_.FullName "manifest.json") -PathType Leaf }

  foreach ($dir in $skillDirs) {
    $skillFile = Join-Path $dir.FullName "SKILL.md"
    $manifestFile = Join-Path $dir.FullName "manifest.json"

    if (-not (Test-Path -LiteralPath $skillFile -PathType Leaf)) {
      Write-Error "Skill directory missing SKILL.md: $($dir.FullName)"
    }

    if (-not (Test-Path -LiteralPath $manifestFile -PathType Leaf)) {
      Write-Error "Skill directory missing manifest.json: $($dir.FullName)"
    }
  }
}

Write-Host "Repository validation passed."
