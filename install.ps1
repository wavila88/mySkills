# Installs the skills in this repo for Claude Code and opencode (user level).
# Usage: powershell -ExecutionPolicy Bypass -File .\install.ps1 [-Target claude|opencode|both] [-Skill start-free-day]
param(
  [ValidateSet('claude','opencode','both')][string]$Target = 'both',
  [string]$Skill = 'start-free-day'
)

$src = Join-Path $PSScriptRoot $Skill
if (-not (Test-Path (Join-Path $src 'SKILL.md'))) { throw "No SKILL.md in $src" }

$dests = @()
if ($Target -in 'claude','both')   { $dests += Join-Path $HOME ".claude\skills\$Skill" }
if ($Target -in 'opencode','both') { $dests += Join-Path $HOME ".config\opencode\skills\$Skill" }

foreach ($d in $dests) {
  New-Item -ItemType Directory -Force -Path $d | Out-Null
  Copy-Item -Path (Join-Path $src '*') -Destination $d -Recurse -Force
  Write-Host "Installed $Skill -> $d"
}
