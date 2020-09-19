function Get-ExportedFunction {
  <#
  .SYNOPSIS
    Output the functions made available by this module.
  .DESCRIPTION
    The output from this function is used when loading the PowerShell profile,
    and for making ad-hoc checking of the helper functions in the profile more
    accessible.
  .EXAMPLE
    Get-ExportedFunction
  #>
  $module = Get-Module -Name TsekProfile

  if (-not $module) {
    throw 'Failed to locate TsekProfile module.'
  }

  $functions = $module.ExportedCommands.Values.Name -join ', '

  if (-not $functions) {
    throw 'Failed to determine exported TsekProfile functions.'
  }

  # Use [Console]::Write to prevent newlines.
  Write-Host 'Profile helper functions: ' -NoNewline
  Write-Host $functions -ForegroundColor Green
}
