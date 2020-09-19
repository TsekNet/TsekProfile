#region Test Configuration
Set-Location -Path $PSScriptRoot
$ModuleName = 'TsekProfile'
Get-Module $ModuleName | Remove-Module -Force
$PathToManifest = [System.IO.Path]::Combine('..', '..', '..', $ModuleName, "$ModuleName.psd1")
Import-Module $PathToManifest -Force
#endregion

InModuleScope $ModuleName {
  $functionName = 'Get-ExportedFunction'
  Describe "$functionName Function Tests" -Tag Unit {
    It "Module Exists" {
      Get-Module -Name TsekProfile | Should -Not -BeNullOrEmpty
    }
    It "Write-Host is Called 2 times" {
      Mock Write-Host {}
      Get-ExportedFunction
      Assert-MockCalled Write-Host -Exactly 2 -Scope It
    }
    It "Module Does Not Exist" {
      Mock -CommandName Get-Module -MockWith { throw 'Fake Error' }
      Remove-Module -Name TsekProfile
      { Get-ExportedFunction } | Should Throw
    }
  }
}