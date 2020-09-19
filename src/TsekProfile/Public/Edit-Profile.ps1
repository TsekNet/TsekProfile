function Edit-Profile {
  <#
  .SYNOPSIS
    Opens the $profile file an editor.
  .DESCRIPTION
    Opens the $profile.CurrentUserAllHosts file conditionally in one of the
    following programs:
    1. PowerShell ISE, if detected as the current host.
    2. VSCode, if detected as the current host.
    3. Notepad, if the current host is netiher of the above.
  .EXAMPLE
    Edit-Profile
  #>

  $PATH = $profile.CurrentUserAllHosts

  switch ((Get-Host).Name) {
    'Visual Studio Code Host' { Open-EditorFile $PATH }
    'Windows PowerShell ISE Host' { psedit $PATH }
    default { Start-Process "$env:windir\system32\notepad.exe" -ArgumentList @($PATH) }
  }
}