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
    # TODO: Add color to function output.
    Write-Output "Profile helper functions: $functions"
  }
  catch {
    throw "Error obtaining helper function list: $_"
  }
}