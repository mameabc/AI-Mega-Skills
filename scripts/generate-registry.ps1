param([switch]$Check)

$ErrorActionPreference = "Stop"
$repoRoot = Split-Path -Parent $PSScriptRoot
$registryPath = Join-Path $repoRoot "registry/skills.json"
$indexPath = Join-Path $repoRoot "registry/indexes/skills.md"
$skillsRoot = Join-Path $repoRoot "skills"
$newline = "`n"

$manifests = @()
if (Test-Path -LiteralPath $skillsRoot -PathType Container) {
  $manifests = @(Get-ChildItem -LiteralPath $skillsRoot -Recurse -Filter "manifest.json" -File |
    Where-Object { Test-Path -LiteralPath (Join-Path $_.Directory.FullName "SKILL.md") })
}

$skills = @(
  foreach ($file in $manifests) {
    try { $manifest = Get-Content -LiteralPath $file.FullName -Raw | ConvertFrom-Json }
    catch { throw "Invalid manifest JSON: $($file.FullName)" }
    $skillDirectory = $file.Directory.FullName
    $skillSlug = Split-Path -Leaf $skillDirectory
    $domainSlug = Split-Path -Leaf (Split-Path -Parent $skillDirectory)
    if ($manifest.slug -ne $skillSlug) { throw "Manifest slug '$($manifest.slug)' does not match '$skillSlug'." }
    if ($manifest.domain -ne $domainSlug) { throw "Manifest domain '$($manifest.domain)' does not match '$domainSlug'." }
    [pscustomobject]@{
      slug = [string]$manifest.slug; name = [string]$manifest.name; description = [string]$manifest.description
      domain = [string]$manifest.domain; subdomain = [string]$manifest.subdomain; version = [string]$manifest.version
      owners = @($manifest.owners); tags = @($manifest.tags); inputs = @($manifest.inputs); outputs = @($manifest.outputs)
      validation = @($manifest.validation); license = [string]$manifest.license; status = [string]$manifest.status
    }
  }
)

$duplicates = @($skills | Group-Object slug | Where-Object Count -gt 1)
if ($duplicates.Count -gt 0) { throw "Duplicate Skill slugs: $($duplicates.Name -join ', ')" }
$sortedSkills = @($skills | Sort-Object domain, slug)
$registryJson = (([ordered]@{ schemaVersion = 1; skills = $sortedSkills }) | ConvertTo-Json -Depth 10) + $newline
$indexLines = @(
  "# Skill Index", "", 'This file is generated from `registry/skills.json`. Do not edit it manually.', ""
)
if ($sortedSkills.Count -eq 0) { $indexLines += "No Skills have been published yet." }
else {
  $indexLines += "| Skill | Domain | Version | Status | Description |"; $indexLines += "| --- | --- | --- | --- | --- |"
  foreach ($skill in $sortedSkills) { $indexLines += "| [$($skill.name)](../../skills/$($skill.domain)/$($skill.slug)/) | $($skill.domain) | $($skill.version) | $($skill.status) | $($skill.description) |" }
}
$indexMarkdown = ($indexLines -join $newline) + $newline

if ($Check) {
  $currentRegistry = if (Test-Path -LiteralPath $registryPath) { Get-Content -LiteralPath $registryPath -Raw } else { "" }
  $currentIndex = if (Test-Path -LiteralPath $indexPath) { Get-Content -LiteralPath $indexPath -Raw } else { "" }
  if ($currentRegistry -cne $registryJson -or $currentIndex -cne $indexMarkdown) { throw "Generated registry files are stale. Run scripts/generate-registry.ps1." }
} else {
  [IO.File]::WriteAllText($registryPath, $registryJson, [Text.UTF8Encoding]::new($false))
  [IO.File]::WriteAllText($indexPath, $indexMarkdown, [Text.UTF8Encoding]::new($false))
}
Write-Host "Registry generation passed. Skills: $($sortedSkills.Count)"
