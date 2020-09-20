#region Test Configuration
Set-Location -Path $PSScriptRoot
$MODULE = 'TsekProfile'
Get-Module $MODULE | Remove-Module -Force
$MANIFEST = [System.IO.Path]::Combine('..', '..', '..', $MODULE, "$MODULE.psd1")
Import-Module $MANIFEST -Force
#endregion

InModuleScope $MODULE {
  Describe "Invoke-FontScripts function tests" -Tag Unit {
    It "Fonts path not found" {
      Mock Test-Path { return $false }
      { Invoke-FontScripts } | Should Throw
    }
    It "Fonts path not found" {
      Mock Test-Path { return $true }
      { Invoke-FontScripts } | Should -Not Throw
    }
  }
}