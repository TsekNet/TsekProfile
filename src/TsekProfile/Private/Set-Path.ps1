function Set-Path {
  <#
  .SYNOPSIS
    Change the current directory.
  .DESCRIPTION
    This is meant to enable consistency with new PowerShell windows. With the
    same directory opening by default when a profile is loaded, you can ensure
    you always start from the same blank slate.
  .PARAMETER Path
    Change the current directory to this value.

    Create this directory if it does not already exist.
  .PARAMETER Force
    Controls whether or not the user is prompted to change directory.
  .EXAMPLE
    Set-Path 'C:\Projects'
  #>
  [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Medium')]
  Param (
    [ValidateScript( {
        if (-not (Test-Path $_) ) {
          Write-Verbose "Creating default location $_"
          New-Item -ItemType Directory -Force -Path $_
        }
        return $true
      })]
    [System.IO.FileInfo]$Path,
    [switch]$Force
  )
  if ($Force -or $PSCmdlet.ShouldProcess($Path, 'change current directory.')) {
    Write-Verbose "Setting path to $Path."
    Set-Location $Path
  }
}