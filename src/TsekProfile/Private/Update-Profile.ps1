function Update-Profile {
  <#
.SYNOPSIS
  Update the PowerShell Profile.
.DESCRIPTION
  Executes multiple functions defined in the TsekProfile module to install and
  configure the profile on the local system.

  Optionally, when this profile is being updated, you can hold SHIFT to
  display verbose messages.
.PARAMETER Force
  Controls whether or not the user is prompted to change directory.
.EXAMPLE
  profile.ps1 -Verbose
#>
  [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Medium')]
  param (
    [switch]$Force
  )

  # Hold shift to turn on verbosity if running Windows PowerShell
  if ('Desktop' -eq $PSVersionTable.PSEdition) {
    Add-Type -Assembly PresentationCore, WindowsBase
    try {
      if ([System.Windows.Input.Keyboard]::IsKeyDown([System.Windows.Input.Key]::LeftShift) -OR
        [System.Windows.Input.Keyboard]::IsKeyDown([System.Windows.Input.Key]::RightShift)) {
        $VerbosePreference = "Continue"
      }
    }
    catch {
      Write-Warning 'Error displaying verbosity via SHIFT key.'
    }
  }

  try {
    Write-Verbose '==Removing default start up message=='
    Clear-Host

    Write-Verbose '==Setting custom oh-my-posh theme=='
    Set-Theme 'TsekNet' -Verbose:$false

    Write-Verbose '==Checking console elevation=='
    Get-Elevation

    Write-Verbose '==Setting the console title=='
    if ($ThemeSettings.Options) { $ThemeSettings.Options.ConsoleTitle = $false }
    Set-WindowTitle -Force

    if ($Force -or $PSCmdlet.ShouldContinue($Path, 'Change current directory.')) {
      Write-Verbose '==Setting the default directory for new PowerShell consoles=='
      Set-Path 'C:\Tmp' -Force
    }

    Write-Verbose '==Installing fonts if necessary=='
    Install-Font

    Write-Verbose '==Changing to bash-like tab completion=='
    Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
    Set-PSReadLineOption -ShowToolTips -BellStyle Visual -HistoryNoDuplicates

    Write-Verbose '==Setting aliases=='
    Set-Alias ll Get-ChildItemColor -Option AllScope
    Set-Alias ls Get-ChildItemColorFormatWide -Option AllScope
    Set-Alias History Open-HistoryFile -Option AllScope

    Write-Verbose '==Getting and displaying list of helper functions=='
    Get-ExportedFunction
  }
  catch {
    throw "Error configuring `$profile on line $($_.InvocationInfo.ScriptLineNumber): $_"
  }
}