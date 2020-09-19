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

  $MODULE = 'TsekProfile'

  $functions = (Get-Module -Name $MODULE).ExportedCommands.Values.Name

  if (-not $functions) {
    throw "Failed to determine exported functions for: $MODULE"
  }

  $function_string = $functions -join ', '

  Write-Host "$MODULE exported functions: " -NoNewline
  Write-Host $function_string -ForegroundColor Green
}
