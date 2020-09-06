function Copy-LastCommand {
  <#
  .SYNOPSIS
    Copies the last command to the clipboard.
  .DESCRIPTION
    Leverages the Get-History cmdlet to identify the last command
    executed and copies it to the clipboard by leveraging the Set-Clipboard cmdlet.
  .EXAMPLE
    Copy-LastCommand
  #>
  Get-History -Id $(((Get-History) | Select-Object -Last 1 |
    Select-Object ID -ExpandProperty ID)) |
    Select-Object -ExpandProperty CommandLine |
    Set-Clipboard
}