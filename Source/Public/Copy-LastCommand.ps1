# Copy the last command entered
function Copy-LastCommand {
  Get-History -Id $(((Get-History) | Select-Object -Last 1 |
        Select-Object ID -ExpandProperty ID)) |
      Select-Object -ExpandProperty CommandLine |
        clip
}