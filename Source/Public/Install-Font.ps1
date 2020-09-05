function Install-Font {
  [CmdletBinding()]
  param (
    [System.IO.FileInfo]$TestFont = "$env:LOCALAPPDATA\Microsoft\Windows\Fonts\DejaVu Sans Mono for Powerline.ttf"
  )
  if (-not(Test-Path $TestFont)) {
    Write-Verbose "Installing Fonts to $($TestFont.DirectoryName)"
    git clone https://github.com/PowerLine/fonts
    Set-Location fonts
    .\install.ps1 'Deja*' -Confirm:$false
  }
}