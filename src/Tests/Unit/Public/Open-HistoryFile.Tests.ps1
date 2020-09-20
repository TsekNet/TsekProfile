#region Test Configuration
Set-Location -Path $PSScriptRoot
$MODULE = 'TsekProfile'
Get-Module $MODULE | Remove-Module -Force
$MANIFEST = [System.IO.Path]::Combine('..', '..', '..', $MODULE, "$MODULE.psd1")
Import-Module $MANIFEST -Force
#endregion

InModuleScope $MODULE {
  Describe "Open-HistoryFile function tests" -Tag Unit {
    It "Open history file in Visual Studio Code" {
      Mock Get-Host { @{  Name = 'Visual Studio Code Host' } }
      function Open-EditorFile {}
      Mock Open-EditorFile
      Open-HistoryFile
      Assert-MockCalled Open-EditorFile
    }
    It "Open history file in PowerShell ISE" {
      Mock Get-Host { @{  Name = 'Windows PowerShell ISE Host' } }
      function psedit {}
      Mock psedit
      Open-HistoryFile
      Assert-MockCalled psedit
    }
    It "Open history file in Notepad" {
      Mock Get-Host { @{  Name = 'ConsoleHost' } }
      Mock Start-Process
      Open-HistoryFile
      Assert-MockCalled Start-Process
    }
  }
}