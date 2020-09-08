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
  try {
    $functions = (Get-Command -Module 'TsekProfile' -CommandType Function).Name -join ', '

    # Use [Console]::Write to prevent newlines.
    [Console]::Write('Profile helper functions: ')
    Write-Prompt $functions -ForegroundColor Green
  }
  catch {
    throw "Error obtaining helper function list: $_"
  }
}