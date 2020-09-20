function Invoke-FontScript {
  <#
  .SYNOPSIS
    Executes the font Powerline installation script.
  .DESCRIPTION
    A separate function is required to launch a dot-sourced script to make
    testing this functionality possible. This function relies on Install-Font to
    place the required directories in place.
  .LINK
    https://github.com/powerline/fonts/blob/master/install.ps1
  .EXAMPLE
    Invoke-FontScript
  #>

  if (-not (Test-Path .\fonts)) {
    throw "Failed to locate fonts folder"
  }

  .\fonts\install.ps1 -FontName $FontName
}