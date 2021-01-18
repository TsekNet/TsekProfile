function Install-Font {
  <#
  .SYNOPSIS
    Download a font from a GitHub release.
  .DESCRIPTION
    Without the requirement of Git installed:, this function can be leveraged to:
      1. Download a font from a GitHub release to a temporary directory
      2. Extract the font to a temporary directory
      3. Install the font
      4. Clean up the temporary directories
  .LINK
    https://github.com/powerline/fonts/blob/master/install.ps1
    https://gist.github.com/f3l3gy/0e89dde158dde024959e36e915abf6bd
  .PARAMETER FontName
    Name of the font to install (ex: 'CascadiaCodePL')
  .EXAMPLE
    Install-Font -FontName 'CascadiaCodePL'
  #>
  [CmdletBinding()]
  param (
    [System.IO.FileInfo]$FontName = 'CascadiaCodePL',
    [string]$Repo = 'microsoft/cascadia-code'
  )
  $font_file = "$env:windir\fonts\$FontName.ttf"
  $release = "https://github.com/$Repo/releases/latest"

  if (Test-Path $font_file) {
    return
  }

  try {
    $tags = (Invoke-WebRequest -Uri $release -UseBasicParsing)
    $release_path = ($tags.Links -match "/releases/download/").href
    $uri = "https://github.com$release_path"
    Invoke-WebRequest $uri -OutFile "$env:TEMP/cascadia-code.zip"
  }
  catch {
    throw "Failed to download [$FontName] from [$download]: $_"
  }

  try {
    Expand-Archive "$env:TEMP/cascadia-code.zip"  -DestinationPath "$env:TEMP/cascadia-code-unzipped" -Force
  }
  catch {
    throw "Failed to unzip [$FontName]: $_"
  }

  Write-Verbose "Adding $FontName to Windows fonts"
  $fonts = (New-Object -ComObject shell.application).NameSpace(0x14)
  $fonts.CopyHere($font_file)

  Remove-Item @("$env:TEMP/cascadia-code.zip", "$env:TEMP/cascadia-code-unzipped") -Recurse -Force -ErrorAction SilentlyContinue
}