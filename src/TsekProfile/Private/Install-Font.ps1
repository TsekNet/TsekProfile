function Install-Font {
  <#
  .SYNOPSIS
    Download Powerline fonts from GitHub.
  .DESCRIPTION
    Powerline fonts are required for the custom characters that are used in the
    custom prompt.
  .LINK
    https://github.com/powerline/fonts/blob/master/samples/All.md
  .PARAMETER FontName
    Name of the font to install (ex: 'DejaVu Sans Mono for Powerline')
  .EXAMPLE
    Install-Font -FontName 'DejaVu Sans Mono for Powerline'
  #>
  [CmdletBinding()]
  param (
    [System.IO.FileInfo]$FontName = 'DejaVu Sans Mono for Powerline'
  )

  try {
    Get-Command git
  }
  catch {
    throw 'Failed to install fonts, Git not installed'
  }

  $font_path = "$env:LOCALAPPDATA\Microsoft\Windows\Fonts\"
  $font_file = "$font_path\$FontName.ttf"
  if (-not (Test-Path $font_file)) {
    Write-Verbose "Installing Fonts to $font_path"
    git clone https://github.com/PowerLine/fonts
    Invoke-FontScript
  }
}