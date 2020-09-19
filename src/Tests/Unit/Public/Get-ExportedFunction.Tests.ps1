#region Test Configuration
Set-Location -Path $PSScriptRoot
$MODULE = 'TsekProfile'
Get-Module $MODULE | Remove-Module -Force
$MANIFEST = [System.IO.Path]::Combine('..', '..', '..', $MODULE, "$MODULE.psd1")
Import-Module $MANIFEST -Force
#endregion

InModuleScope $MODULE {
  Describe "Get-ExportedFunction function tests" -Tag Unit {
    It "Write-Host is called two times" {
      Mock Write-Host {}
      Get-ExportedFunction
      Assert-MockCalled Write-Host -Exactly 2 -Scope It
    }
    It "Module has no exported functions" {
      Mock -CommandName Get-Module { $null }
      { Get-ExportedFunction } | Should Throw
    }
  }
}