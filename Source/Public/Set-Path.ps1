# Helper function to change directory to my development workspace
function Set-Path {
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
  if ($Force -or $PSCmdlet.ShouldContinue($Path, 'Change current directory.')) {
    Write-Verbose "Setting path to $Path."
    Set-Location $Path
  }
}