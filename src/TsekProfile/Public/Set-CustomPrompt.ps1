function Set-CustomPrompt {
  <#
  .SYNOPSIS
    Custom PowerShell prompt.
  .DESCRIPTION
    This prompt adds the following functionality:

    1. Invocation ID count (how many times a command was executed)
    2. The custom output of the current directory, with optional trimming if the current directory is determined to be too long.
    3. Posh-Git integration
    4. Built-in timers for each command executed in the console
    5. The current local time
    6. A custom ASCII symbol placed before the cursor
  .PARAMETER Symbol
    ASCII code for the symbol placed before the cursor in the console.
  .PARAMETER Force
    Controls whether or not the user is prompted to change their prompt.
  .EXAMPLE
    Set-CustomPrompt -Symbol '26A1' -Force

    Forces the prompt to change, using the 'High Voltage' Emoji (⚡) as the
    ASCII character is placed before the cursor.
  .NOTES
    This theme has taken inspiration heavily from the Agnoster oh-my-posh theme.
  #>
  [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
  param (
    [string]$Symbol = '1F680', # Heart
    [switch]$Force
  )

  begin {
    $black = [System.ConsoleColor]::Black
    $blue = [System.ConsoleColor]::Blue
    $dark_cyan = [System.ConsoleColor]::DarkCyan
    $gray = [System.ConsoleColor]::Gray
    $magenta = [System.ConsoleColor]::Magenta
    $red = [System.ConsoleColor]::Red
    $white = [System.ConsoleColor]::White

    $custom_symbol = [char]::ConvertFromUtf32("0x$Symbol")
    $house_symbol = [char]::ConvertFromUtf32('0x1F3E0')

    $forward_arrow = [char]::ConvertFromUtf32(0xE0B1)
    $backward_symbol = [char]::ConvertFromUtf32(0xE0B2)
    $forward_symbol = [char]::ConvertFromUtf32(0xE0B0)
    $warning_symbol = [char]::ConvertFromUtf32(0x203C)
  }

  process {
    if ($Force -or $PSCmdlet.ShouldProcess('PowerShell prompt', 'overwrite')) {
      # Check the last command state and indicate if failed
      if ($Global:Error.Count -gt $Global:err_count) {
        $Global:err_count ++
        $prompt += Write-Prompt -Object $warning_symbol -ForegroundColor $white -BackgroundColor $red
        $prompt += Write-Prompt -Object $forward_symbol -ForegroundColor $red -BackgroundColor $blue
      }

      # Add invocation number
      $prompt += Write-Prompt -Object " $($MyInvocation.HistoryId) " -ForegroundColor $dark_gray -BackgroundColor $blue
      $prompt += Write-Prompt -Object $($forward_symbol) -ForegroundColor $blue -BackgroundColor $gray

      $full_path = $pwd.Path.Replace("$($pwd.Drive.Name)\", '').Replace('\', ' ' + $forward_arrow + ' ')

      if (Test-VirtualEnv) {
        $prompt += Write-Prompt -Object "$($forward_symbol) " -ForegroundColor $black -BackgroundColor $red
        $prompt += Write-Prompt -Object "$($sl.PromptSymbols.VirtualEnvSymbol) $(Get-VirtualEnvName) " -ForegroundColor $white -BackgroundColor $red
        $prompt += Write-Prompt -Object "$($forward_symbol) " -ForegroundColor $red -BackgroundColor $dark_cyan
      }
      else {
        $prompt += Write-Prompt -Object " $($pwd.Drive.Name) " -ForegroundColor $dark_cyan -BackgroundColor $gray
        $prompt += Write-Prompt -Object $($forward_symbol) -ForegroundColor $gray -BackgroundColor $dark_cyan
      }

      # Writes the drive portion
      # Reduce the path displayed if it is long
      if (($full_path.Split($forward_arrow).count -gt 2)) {
        $One = $full_path.split($forward_arrow)[-1]
        $Two = $full_path.split($forward_arrow)[-2]

        if ($One.Length -gt 10) { $One = "$($One[0..7] -join '')~" }
        if ($Two.Length -gt 10) { $Two = "$($Two[0..7] -join '')~" }

        # Don't include drive letter
        $partial_path = ' .. ', $Two, $One -join $forward_arrow
        $prompt += Write-Prompt -Object "$partial_path " -ForegroundColor $white -BackgroundColor $dark_cyan
      }
      else {
        # Don't include drive letter
        $partial_path = $($full_path.split($forward_arrow)[1..($full_path.length)])
        $prompt += Write-Prompt -Object "$partial_path "-ForegroundColor $white -BackgroundColor $dark_cyan
      }

      # Adds Pre/Postfix to the VCS Prompt
      $status = Get-VCSStatus
      if ($status) {
        $themeInfo = Get-VcsInfo -status ($status)
        $prompt += Write-Prompt -Object $forward_symbol -ForegroundColor $dark_cyan -BackgroundColor $magenta
        $prompt += Write-Prompt -Object " $($themeInfo.VcInfo) " -BackgroundColor $magenta -ForegroundColor $black
        $prompt += Write-Prompt -Object $forward_symbol -ForegroundColor $magenta
      }
      else {
        $prompt += Write-Prompt -Object $forward_symbol -ForegroundColor $dark_cyan
      }

      $timestamp = Get-Date -f "T"

      # Writes the Invocation time and date
      $prompt += Set-CursorForRightBlockWrite -textLength ($timestamp.Length + 13)
      $prompt += Write-Prompt $backward_symbol -ForegroundColor $dark_cyan
      $prompt += Write-Prompt $(Get-Elapsed) -ForegroundColor $gray -BackgroundColor $dark_cyan
      $prompt += Write-Prompt $backward_symbol -ForegroundColor $blue -BackgroundColor $dark_cyan
      $prompt += Write-Prompt $timestamp -ForegroundColor $gray -BackgroundColor $blue

      # Move the actual prompt to the next line and set the prompt
      $prompt += Set-Newline

      if ($pwd.Path -eq "$env:HOMEDRIVE\Tmp") {
        $prompt += Write-Prompt -Object " $house_symbol " -ForegroundColor $red -BackgroundColor $gray
      }
      else {
        $prompt += Write-Prompt -Object " $custom_symbol " -ForegroundColor $red -BackgroundColor $gray
      }
      $prompt += Write-Prompt -Object "$forward_symbol " -ForegroundColor $gray
      $prompt += ' '
    }
  }
  end {
    return $prompt
  }
}