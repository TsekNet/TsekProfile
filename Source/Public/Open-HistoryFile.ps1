# Open PowerShell command history file
function Open-HistoryFile { code-insiders (Get-PSReadLineOption | Select-Object -ExpandProperty HistorySavePath) }