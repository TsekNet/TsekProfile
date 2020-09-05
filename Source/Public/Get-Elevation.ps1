function Get-Elevation {
  [CmdletBinding()]
  param ()
  if (Test-Administrator) {
    $script:elevation = "Admin"
    Write-Verbose "Powershell is running as: $script:elevation"
  }
  else {
    $script:elevation = "Non-Admin"
    Write-Verbose "Powershell is running as: $script:elevation"
  }
}