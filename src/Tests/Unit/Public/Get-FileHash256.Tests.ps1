#region Test Configuration
Set-Location -Path $PSScriptRoot
$MODULE = 'TsekProfile'
Get-Module $MODULE | Remove-Module -Force
$MANIFEST = [System.IO.Path]::Combine('..', '..', '..', $MODULE, "$MODULE.psd1")
Import-Module $MANIFEST -Force
#endregion

InModuleScope $MODULE {
  Describe "Get-FileHash256 function tests" -Tag Unit {
    It "Path does not exist" {
      Mock Test-Path { return $false }
      { Get-FileHash256 } | Should Throw
    }
    It "Profile directory exists" {
      $file_path = 'C:\foo.ps1'
      $hash = 'FFF264192EF215A2A094547CE4A1A9DAE1071701B6F48B9D200D0F94883E4520'
      Mock Test-Path { return $true }
      Mock Get-FileHash { [PSCustomObject]@{
          Hash      = $hash
          Algorithm = 'SHA256'
          Path      = $file_path
        }
      } -Verifiable
      Mock Write-Host
      Get-FileHash256 $file_path
      Get-Clipboard | Should -BeExactly $hash
      Assert-MockCalled Write-Host -Exactly 2 -Scope It
    }
  }
}