param(
  [ValidateSet('junction','readonly','writable')][string]$Mode,
  [string]$Path,
  [string]$Target
)
$ErrorActionPreference = 'Stop'
if ($Mode -eq 'junction') {
  New-Item -ItemType Junction -Path $Path -Target $Target | Out-Null
} else {
  $file = Get-Item -LiteralPath $Path
  $file.IsReadOnly = $Mode -eq 'readonly'
}
