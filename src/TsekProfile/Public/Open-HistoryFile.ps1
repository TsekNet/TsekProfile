function Open-HistoryFile {
  <#
  .SYNOPSIS
    Opens the PowerShell history file.
  .DESCRIPTION
    Opens the (Get-PSReadLineOption).HistorySavePath file conditionally in one
    of the following programs:
    1. PowerShell ISE, if detected as the current host.
    2. VSCode, if detected as the current host.
    3. Notepad, if the current host is netiher of the above.
  .EXAMPLE
    Open-HistoryFile
  #>

  $HISTORY_PATH = (Get-PSReadLineOption).HistorySavePath

  switch ($host.Name) {
    'Windows PowerShell ISE Host' { $psISE.CurrentPowerShellTab.Files.Add($HISTORY_PATH) }
    'Visual Studio Code Host' {
      $editor = 'code.cmd'
      if ($env:TERM_PROGRAM_VERSION -like '*insider') {
        $editor = 'code-insiders.cmd'
      }
      & $editor $HISTORY_PATH
    }
    default { notepad $HISTORY_PATH }
  }
}