function Install-Profile {
  <#
  .SYNOPSIS
    This function will download a Github Repository without using Git
  .DESCRIPTION
    This function will download files from Github without using Git.  You will
    need to know the Owner, Repository name, branch (default master), and
    FilePath.  The Filepath will include any folders and files that you want to
    download.
  .EXAMPLE
    Import-GitRepo -Owner MSAdministrator -Repository WriteLogEntry -Verbose -FilePath `
      'WriteLogEntry.psm1',
    'WriteLogEntry.psd1',
    'Public',
    'en-US',
    'en-US\about_WriteLogEntry.help.txt',
    'Public\Write-LogEntry.ps1'
  #>

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
    # Clear-Host

    Write-Verbose '==Getting latest profile files from GitHub=='
    Import-GitRepo -Owner tseknet -Repository PowerShell-Profile -FilePath `
      'profile.ps1',
    'Themes/TsekNet.psm1' -ThemeName 'TsekNet'

    Write-Verbose '==Importing modules required for profile=='
    $my_modules = @('posh-git', 'oh-my-posh', 'Get-ChildItemColor', 'PSWriteHTML')
    Import-MyModules -Modules $my_modules

    Write-Verbose '==Setting custom oh-my-posh theme=='
    Set-Theme 'TsekNet' -Verbose:$false

    Write-Verbose '==Checking console elevation=='
    Get-Elevation

    Write-Verbose '==Setting the console title=='
    if ($ThemeSettings.Options) { $ThemeSettings.Options.ConsoleTitle = $false }
    Set-WindowTitle -Force

    Write-Verbose '==Setting the default directory for new PowerShell consoles=='
    # Set-Path 'C:\Tmp' -Force

    Write-Verbose '==Installing fonts if necessary=='
    Install-Fonts

    Write-Verbose '==Changing to bash-like tab completion=='
    Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
    Set-PSReadLineOption -ShowToolTips -BellStyle Visual -HistoryNoDuplicates

    Write-Verbose '==Setting aliases=='
    Set-Alias ll Get-ChildItemColor -Option AllScope
    Set-Alias ls Get-ChildItemColorFormatWide -Option AllScope
    Set-Alias History Open-HistoryFile -Option AllScope

    Write-Verbose '==Getting and displaying list of helper functions=='
    Get-ExportedFunction

    Write-Verbose "==Overwriting $profile=="
    Write-Profile
  }
  catch {
    throw "Error configuring `$profile on line $($_.InvocationInfo.ScriptLineNumber): $_"
  }
}