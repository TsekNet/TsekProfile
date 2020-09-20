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

  switch ((Get-Host).Name) {
    'Visual Studio Code Host' { Open-EditorFile $HISTORY_PATH }
    'Windows PowerShell ISE Host' { psedit $HISTORY_PATH }
    default { Start-Process "$env:windir\system32\notepad.exe" -ArgumentList @($HISTORY_PATH) }
  }
}