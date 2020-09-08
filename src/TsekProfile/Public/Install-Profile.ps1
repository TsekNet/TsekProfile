function Install-Profile {
  <#
  .SYNOPSIS
    Copy the TsekNet PowerShell profile to the appropriate location, and execute
    the profile script.
  .DESCRIPTION
    By default, overwrite the $profile.CurrentUserAllHosts file with the
    contents of the profile.ps1 file in this directory.

    Once the file is copied over, the profile script is executed.
  .Parameter Scope
    Name of the PowerShell profile scope to use.
    See https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles for more information.
  .EXAMPLE
    Copy-Profile -Scope AllUsersAllHosts

    Overwrite the AllUsersAllHosts PowerShell Profile with the code in .
  #>
  [CmdletBinding()]
  param(
    [ValidateSet('AllUsersAllHosts', 'AllUsersCurrentHost', 'CurrentUserAllHosts', 'CurrentUserCurrentHost')]
    [string]$Scope = "CurrentUserAllHosts"
  )

  $profile_dir = Split-Path $PROFILE.$Scope
  $theme_dir = $ThemeSettings.MyThemesLocation
  $theme_file = "$theme_dir\TsekNet.psm1"

  if (-not (Test-Path $profile_dir)) {
    New-Item -Path $profile_dir -ItemType Directory | Out-Null
    Write-Verbose "Created new profile directory: $profile_dir"
  }

  if (-not (Test-Path $theme_dir)) {
    New-Item -Path $theme_dir -ItemType Directory | Out-Null
    Write-Verbose "Created new oh-my-posh themes directory: $theme_dir"
  }

  Set-Content -Path $theme_file -Value 'Write-Theme'

  Set-Content -Path $profile.CurrentUserAllHosts -Value 'Update-Profile'
  Update-Profile
}