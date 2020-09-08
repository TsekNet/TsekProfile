function Get-Elapsed {
  <#
  .SYNOPSIS
      Get the time span elapsed during the execution of command (by default the
      previous command).
  .DESCRIPTION
      Calls Get-History to return a single command and returns the difference
      between the Start and End execution time.
  .PARAMETER Format
    A Timespan format pattern such as "{0:ss\.ffff}"
  .EXAMPLE
    Get-Elapsed -Format '{0:h\:mm\:ss\.ffff}'
  #>
  [CmdletBinding()]
  param(
    [Parameter()]
    [string]$Format = '{0:h\:mm\:ss\.ffff}'
  )
  $null = $PSBoundParameters.Remove("Format")
  $LastCommand = Get-History -Count 1 @PSBoundParameters
  if (!$LastCommand) { return "0:00:00.0000" }
  $Duration = $LastCommand.EndExecutionTime - $LastCommand.StartExecutionTime
  $Format -f $Duration
}