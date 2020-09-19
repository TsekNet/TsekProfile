#region Test Configuration
Set-Location -Path $PSScriptRoot
$MODULE = 'TsekProfile'
Get-Module $MODULE | Remove-Module -Force
$MANIFEST = [System.IO.Path]::Combine('..', '..', '..', $MODULE, "$MODULE.psd1")
Import-Module $MANIFEST -Force
#endregion

InModuleScope $MODULE {
  Describe "Edit-Profile function tests" -Tag Unit {
    It "Edit profile in Visual Studio Code" {
      Mock Get-Host { @{  Name = 'Visual Studio Code Host' } }
      function Open-EditorFile {}
      Mock Open-EditorFile
      Edit-Profile
      Assert-MockCalled Open-EditorFile
    }
    It "Edit profile in PowerShell ISE" {
      Mock Get-Host { @{  Name = 'Windows PowerShell ISE Host' } }
      function psedit {}
      Mock psedit
      Edit-Profile
      Assert-MockCalled psedit
    }
    It "Edit profile in Notepad" {
      Mock Get-Host { @{  Name = 'ConsoleHost' } }
      Mock Start-Process
      Edit-Profile
      Assert-MockCalled Start-Process
    }
  }
}