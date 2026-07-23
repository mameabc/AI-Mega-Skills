param([switch]$Check)

$ErrorActionPreference = "Stop"
$repoRoot = Split-Path -Parent $PSScriptRoot
$readmePath = Join-Path $repoRoot "README.md"
$registryPath = Join-Path $repoRoot "registry/skills.json"
$begin = "<!-- BEGIN GENERATED SKILL CATALOG -->"
$end = "<!-- END GENERATED SKILL CATALOG -->"
$newline = "`n"
$registry = Get-Content -LiteralPath $registryPath -Raw | ConvertFrom-Json
$skills = @($registry.skills | Where-Object { $null -ne $_ })
$lines = @($begin, "## Published Skills", "")
if ($skills.Count -eq 0) { $lines += "No Skills have been published yet." }
else {
  $lines += "| Skill | Domain | Version | Status | Description |"; $lines += "| --- | --- | --- | --- | --- |"
  foreach ($skill in @($skills | Sort-Object domain, slug)) { $lines += "| [$($skill.name)](skills/$($skill.domain)/$($skill.slug)/) | $($skill.domain) | $($skill.version) | $($skill.status) | $($skill.description) |" }
}
$block = (($lines + $end) -join $newline) + $newline
$readme = Get-Content -LiteralPath $readmePath -Raw
$pattern = "(?s)" + [regex]::Escape($begin) + ".*?" + [regex]::Escape($end) + "\r?\n?"
if ($readme -notmatch $pattern) { $newReadme = $readme.TrimEnd() + $newline + $newline + $block }
else { $newReadme = [regex]::Replace($readme, $pattern, [System.Text.RegularExpressions.MatchEvaluator]{ param($match) "" }) + $block }
if ($Check) { if ($readme -cne $newReadme) { throw "README generated catalog is stale. Run scripts/generate-readme.ps1." } }
else { [IO.File]::WriteAllText($readmePath, $newReadme, [Text.UTF8Encoding]::new($false)) }
Write-Host "README generation passed."
