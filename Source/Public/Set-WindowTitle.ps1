# Helper function to set the window title
function Set-WindowTitle {
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