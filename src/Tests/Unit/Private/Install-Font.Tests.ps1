#region Test Configuration
Set-Location -Path $PSScriptRoot
$MODULE = 'TsekProfile'
Get-Module $MODULE | Remove-Module -Force
$MANIFEST = [System.IO.Path]::Combine('..', '..', '..', $MODULE, "$MODULE.psd1")
Import-Module $MANIFEST -Force
#endregion

InModuleScope $MODULE {
  Describe "Install-Font function tests" -Tag Unit {
    It "Early Return" {
      Mock Test-Path { return $true }
      { Install-Font } | Should -Not -Throw
    }
    It "Invoke-WebRequest failed" {
      Mock Test-Path { return $false }
      Mock Invoke-WebRequest { throw 'some error' }
      { Install-Font } | Should -Throw 'Failed to download [CascadiaCodePL]'
    }
    It "Expand-Archive failed" {
      Mock Test-Path { return $false }
      Mock Expand-Archive { throw }
      Mock Invoke-WebRequest
      { Install-Font } | Should -Throw 'Failed to unzip [CascadiaCodePL]'
    }
    It "Assert function calls" {
      Mock Test-Path { return $false }
      Mock Invoke-WebRequest
      Mock Expand-Archive
      Install-Font
      Assert-MockCalled Invoke-WebRequest 2
      Assert-MockCalled Expand-Archive 1
    }
  }
}