param(
  [Parameter(Mandatory = $true)][ValidatePattern('^[a-z0-9]+(?:-[a-z0-9]+)*$')][string]$DomainSlug,
  [Parameter(Mandatory = $true)][ValidatePattern('^[a-z0-9]+(?:-[a-z0-9]+)*$')][string]$SkillSlug
)

$ErrorActionPreference = "Stop"
$repoRoot = Split-Path -Parent $PSScriptRoot
$templateRoot = Join-Path $repoRoot "templates/skill"
$targetRoot = Join-Path $repoRoot "skills/$DomainSlug/$SkillSlug"
if (Test-Path -LiteralPath $targetRoot) { throw "Skill already exists: $targetRoot" }

function Ask([string]$label) {
  do { $value = Read-Host $label } while ([string]::IsNullOrWhiteSpace($value))
  return $value.Trim()
}
$values = @{
  "{{skill_slug}}" = $SkillSlug; "{{skill_name}}" = Ask "Skill name"; "{{skill_description}}" = Ask "Manifest description (20+ characters)"
  "{{one_sentence_description}}" = Ask "One-sentence description"; "{{short_problem_statement}}" = Ask "Problem this solves"
  "{{domain_slug}}" = $DomainSlug; "{{subdomain_slug}}" = Ask "Subdomain slug"; "{{owner_handle}}" = Ask "Owner handle"
  "{{tag_slug}}" = Ask "Primary tag slug"; "{{input_name}}" = Ask "Primary input name"; "{{input_description}}" = Ask "Primary input description"
  "{{source_or_file}}" = Ask "Source or file input"; "{{source_description}}" = Ask "Source or file description"
  "{{constraints}}" = Ask "Constraints input"; "{{constraint_description}}" = Ask "Constraints description"
  "{{required_input}}" = Ask "Required input summary"; "{{expected_output}}" = Ask "Expected output summary"
  "{{output_artifact_or_decision}}" = Ask "Output artifact or decision"; "{{validation_evidence}}" = Ask "Validation evidence"
  "{{handoff_or_next_step}}" = Ask "Handoff or next step"; "{{output_name}}" = Ask "Output name"; "{{output_description}}" = Ask "Output description"
  "{{validation_check}}" = Ask "Validation check"; "{{official_reference_title}}" = Ask "Official reference title"; "{{official_reference_url}}" = Ask "Official reference URL"
  "{{specific_trigger_condition}}" = Ask "Trigger condition"; "{{specific_workflow_or_decision_point}}" = Ask "Workflow or decision point"
  "{{specific_quality_or_review_need}}" = Ask "Quality or review need"; "{{out_of_scope_condition}}" = Ask "Out-of-scope condition"
  "{{safer_or_more_specific_skill_exists}}" = Ask "When a safer or more specific Skill exists"; "{{required_context_is_missing}}" = Ask "When required context is missing"
}

New-Item -ItemType Directory -Path $targetRoot -Force | Out-Null
Copy-Item -Path (Join-Path $templateRoot "*") -Destination $targetRoot -Recurse
Get-ChildItem -LiteralPath $targetRoot -Recurse -File | ForEach-Object {
  $content = Get-Content -LiteralPath $_.FullName -Raw
  foreach ($token in $values.Keys) { $content = $content.Replace($token, [string]$values[$token]) }
  if ($content -match "\{\{[^}]+\}\}") { throw "Unresolved template token in $($_.FullName)" }
  Set-Content -LiteralPath $_.FullName -Value $content -Encoding utf8NoBOM
}
& (Join-Path $PSScriptRoot "generate-registry.ps1")
& (Join-Path $PSScriptRoot "generate-readme.ps1")
Write-Host "Skill created and registered: skills/$DomainSlug/$SkillSlug"
