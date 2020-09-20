#region Test Configuration
Set-Location -Path $PSScriptRoot
$MODULE = 'TsekProfile'
Get-Module $MODULE | Remove-Module -Force
$MANIFEST = [System.IO.Path]::Combine('..', '..', '..', $MODULE, "$MODULE.psd1")
Import-Module $MANIFEST -Force
#endregion

InModuleScope $MODULE {
  Describe "Invoke-Profile function tests" -Tag Unit {
    It "Called function test" {
      Mock Clear-Host
      Invoke-Profile
      Assert-MockCalled Clear-Host
    }
    It "global:prompt function test" {
      Mock Set-CustomPrompt
      global:prompt
      Assert-MockCalled Set-CustomPrompt
    }
    It "Function throw caused by a terminating error" {
      Mock Clear-Host { throw }
      { Invoke-Profile } | Should Throw
    }
  }
}