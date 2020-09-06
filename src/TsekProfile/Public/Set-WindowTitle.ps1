function Set-WindowTitle {
  <#
  .SYNOPSIS
    Updates the console title with information about the currently running
    environment.
  .DESCRIPTION
    Obtains the following environment information and writes it to the console
    title:
    - Elevation level (admin/non-admin)
    - PowerShell version
    - $env:COMPUTERNAME (hostname)
  .PARAMETER Force
    Controls whether or not the user is prompted to change the window title.
  .EXAMPLE
    Set-WindowTitle -Force
  #>
  [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Medium')]
  param (
    [switch]$Force
  )
  $host_title = [ordered]@{
    'Elevation' = $elevation
    'Version'   = "v$($PSVersionTable.PSVersion.Major).$($PSVersionTable.PSVersion.Minor)"
    'Session'   = "$env:COMPUTERNAME".ToLower()
  }

  $formatted_title = "PS [$($host_title.Values -join ' | ')]"

  if ($Force -or $PSCmdlet.ShouldProcess('Title', 'Change current console title.')) {
    Write-Verbose "Setting Window Title to '$formatted_title'"
    $Host.UI.RawUI.WindowTitle = $formatted_title
  }

}