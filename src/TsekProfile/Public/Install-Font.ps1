function Install-Font {
  <#
  .SYNOPSIS
    Download Powerline fonts from GitHub.
  .DESCRIPTION
    Powerline fonts are required for the custom characters that are used in the
    oh-my-posh theme that this profile uses.
  .PARAMETER FontPath
   Fully qualified path to install the selected font to.
  .EXAMPLE
    Install-Font -FontPath "$env:LOCALAPPDATA\Microsoft\Windows\Fonts\DejaVu Sans Mono for Powerline.ttf"
  #>
  [CmdletBinding()]
  param (
    [System.IO.FileInfo]$FontPath = "$env:LOCALAPPDATA\Microsoft\Windows\Fonts\DejaVu Sans Mono for Powerline.ttf"
  )
  if (-not (Test-Path $FontPath)) {
    Write-Verbose "Installing Fonts to $($FontPath.DirectoryName)"
    git clone https://github.com/PowerLine/fonts
    Set-Location fonts
    .\install.ps1 'Deja*' -Confirm:$false
  }
}