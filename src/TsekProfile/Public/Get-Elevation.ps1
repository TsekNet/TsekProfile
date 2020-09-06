function Get-Elevation {
  <#
  .SYNOPSIS
    Detects whether Powershell is running as administrator.
  .DESCRIPTION
    Leverages the Test-Administrator cmdlet to return whether the current
    PowerShell console is running as administrator.

    Elevation is also used in the console title.
  .EXAMPLE
    Get-Elevation -Verbose
  #>
  [CmdletBinding()]
  param ()
  if (Test-Administrator) {
    $script:elevation = "Admin"
    Write-Verbose "Powershell is running as: $elevation"
  }
  else {
    $script:elevation = "Non-Admin"
    Write-Verbose "Powershell is running as: $elevation"
  }
}