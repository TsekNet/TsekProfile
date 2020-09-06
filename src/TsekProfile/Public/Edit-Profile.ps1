# Make it easy to edit this profile once it's installed
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

  switch ($host.Name) {
    'Windows PowerShell ISE Host' { $psISE.CurrentPowerShellTab.Files.Add($PATH) }
    'Visual Studio Code Host' {
      $editor = 'code.cmd'
      if ($env:TERM_PROGRAM_VERSION -like '*insider') {
        $editor = 'code-insiders.cmd'
      }
      & $editor $PATH
    }
    default { notepad $PATH }
  }
}