# TODO: Remove reliance on oh-my-posh theme
function Write-Theme {
  <#
  .SYNOPSIS
    Custom oh-my-posh theme built by @TsekNet.
  .DESCRIPTION
    This module is a custom theme lerages the oh-my-posh Powerline module.

    You should be able to just run Set-Theme TsekNet if you've already got
    oh-my-posh installed. if you're missing oh-my-posh you'll see errors in the
    console.
  .EXAMPLE
    Write-Theme TsekNet

    Levergaes the oh-my-posh Set-Theme function to define select this theme.
  #>
  $prompt = Write-Prompt -Object $sl.PromptSymbols.StartSymbol -ForegroundColor $sl.Colors.White -BackgroundColor $sl.Colors.SessionInfoBackgroundColor

  # Check the last command state and indicate if failed
  if ($LastCommandFailed) {
    $prompt += Write-Prompt -Object $sl.PromptSymbols.WarningSymbol -ForegroundColor $sl.Colors.White -BackgroundColor $sl.Colors.Red
    $prompt += Write-Prompt -Object $sl.PromptSymbols.SegmentForwardSymbol -ForegroundColor $sl.Colors.Red -BackgroundColor $sl.Colors.Cyan
  }

  # Add invocation number
  $prompt += Write-Prompt -Object " $($MyInvocation.HistoryId) " -ForegroundColor $sl.Colors.DarkGray -BackgroundColor $sl.Colors.Cyan
  $prompt += Write-Prompt -Object $($sl.PromptSymbols.SegmentForwardSymbol) -ForegroundColor $sl.Colors.Cyan -BackgroundColor $sl.Colors.Gray

  $fullPath = $pwd.Path.Replace("$($env:SystemDrive)\", '').Replace('\', ' ' + $sl.PromptSymbols.ForwardHollowArrow + ' ')

  if (Test-VirtualEnv) {
    $prompt += Write-Prompt -Object "$($sl.PromptSymbols.SegmentForwardSymbol) " -ForegroundColor $sl.Colors.SessionInfoBackgroundColor -BackgroundColor $sl.Colors.Red
    $prompt += Write-Prompt -Object "$($sl.PromptSymbols.VirtualEnvSymbol) $(Get-VirtualEnvName) " -ForegroundColor $sl.Colors.White -BackgroundColor $sl.Colors.Red
    $prompt += Write-Prompt -Object "$($sl.PromptSymbols.SegmentForwardSymbol) " -ForegroundColor $sl.Colors.Red -BackgroundColor $sl.Colors.DarkCyan
  }
  else {
    $prompt += Write-Prompt -Object " $env:SystemDrive " -ForegroundColor $sl.Colors.DarkCyan -BackgroundColor $sl.Colors.Gray
    $prompt += Write-Prompt -Object $($sl.PromptSymbols.SegmentForwardSymbol) -ForegroundColor $sl.Colors.Gray -BackgroundColor $sl.Colors.DarkCyan
  }

  # Writes the drive portion
  # Reduce the path displayed if it is long
  if (($fullPath.Split($sl.PromptSymbols.ForwardHollowArrow).count -gt 2)) {
    $One = $fullPath.split($sl.PromptSymbols.ForwardHollowArrow)[-1]
    $Two = $fullPath.split($sl.PromptSymbols.ForwardHollowArrow)[-2]

    if ($One.Length -gt 10) { $One = "$($One[0..7] -join '')~" }
    if ($Two.Length -gt 10) { $Two = "$($Two[0..7] -join '')~" }

    $prompt += Write-Prompt -Object " $($fullPath.split($sl.PromptSymbols.ForwardHollowArrow)[0], " .. ", $Two, $One -join ($sl.PromptSymbols.ForwardHollowArrow)) " -ForegroundColor $sl.Colors.White -BackgroundColor $sl.Colors.DarkCyan
  }
  else {
    $prompt += Write-Prompt -Object " $fullPath "-ForegroundColor $sl.Colors.White -BackgroundColor $sl.Colors.DarkCyan
  }

  # Adds Pre/Postfix to the VCS Prompt
  $status = Get-VCSStatus
  if ($status) {
    $themeInfo = Get-VcsInfo -status ($status)
    $prompt += Write-Prompt -Object $sl.PromptSymbols.SegmentForwardSymbol -ForegroundColor $sl.Colors.DarkCyan -BackgroundColor $sl.Colors.Magenta
    $prompt += Write-Prompt -Object " $($themeInfo.VcInfo) " -BackgroundColor $sl.Colors.Magenta -ForegroundColor $sl.Colors.Black
    $prompt += Write-Prompt -Object $sl.PromptSymbols.SegmentForwardSymbol -ForegroundColor $sl.Colors.Magenta
  }
  else {
    $prompt += Write-Prompt -Object $sl.PromptSymbols.SegmentForwardSymbol -ForegroundColor $sl.Colors.DarkCyan
  }

  $timestamp = Get-Date -f "T"

  # Writes the Invocation time and date
  $prompt += Set-CursorForRightBlockWrite -textLength ($timestamp.Length + 13)
  $prompt += Write-Prompt $($sl.PromptSymbols.SegmentBackwardSymbol) -ForegroundColor $sl.Colors.DarkCyan
  $prompt += Write-Prompt $(Get-Elapsed) -ForegroundColor $sl.Colors.Yellow -BackgroundColor $sl.Colors.DarkCyan
  $prompt += Write-Prompt $($sl.PromptSymbols.SegmentBackwardSymbol) -ForegroundColor $sl.Colors.Blue -BackgroundColor $sl.Colors.DarkCyan
  $prompt += Write-Prompt $timestamp -ForegroundColor $sl.Colors.Yellow -BackgroundColor $sl.Colors.Blue

  # Move the actual prompt to the next line and set the prompt
  $prompt += Set-Newline

  $prompt += Write-Prompt -Object " $($sl.PromptSymbols.HeartSymbol) " -ForegroundColor $sl.Colors.Red -BackgroundColor $sl.Colors.Gray
  $prompt += Write-Prompt -Object "$($sl.PromptSymbols.SegmentForwardSymbol) " -ForegroundColor $sl.Colors.Gray
  $prompt += ' '
  $prompt
}

$sl = $global:ThemeSettings #local settings
$sl.Colors.Black = [ConsoleColor]::Black
$sl.Colors.Blue = [ConsoleColor]::Blue
$sl.Colors.Cyan = [ConsoleColor]::Cyan
$sl.Colors.DarkBlue = [ConsoleColor]::DarkBlue
$sl.Colors.DarkCyan = [ConsoleColor]::DarkCyan
$sl.Colors.DarkRed = [ConsoleColor]::DarkRed
$sl.Colors.DarkGray = [ConsoleColor]::DarkGray
$sl.Colors.Gray = [ConsoleColor]::Gray
$sl.Colors.Magenta = [ConsoleColor]::Magenta
$sl.Colors.Red = [System.ConsoleColor]::Red
$sl.Colors.White = [ConsoleColor]::White
$sl.Colors.Yellow = [ConsoleColor]::Yellow
$sl.Colors.BackgroundColor = $sl.Colors.DarkCyan
$sl.PromptSymbols.ForwardHollowArrow = [char]::ConvertFromUtf32(0xE0B1)
$sl.PromptSymbols.PromptIndicator = [char]::ConvertFromUtf32(0x276F)
$sl.PromptSymbols.SegmentBackwardSymbol = [char]::ConvertFromUtf32(0xE0B2)
$sl.PromptSymbols.SegmentForwardSymbol = [char]::ConvertFromUtf32(0xE0B0)
$sl.PromptSymbols.HeartSymbol = [char]::ConvertFromUtf32(0x2764)
$sl.PromptSymbols.WarningSymbol = [char]::ConvertFromUtf32(0x203C)
$sl.PromptSymbols.StartSymbol = ''