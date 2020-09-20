#region Test Configuration
Set-Location -Path $PSScriptRoot
$MODULE = 'TsekProfile'
Get-Module $MODULE | Remove-Module -Force
$MANIFEST = [System.IO.Path]::Combine('..', '..', '..', $MODULE, "$MODULE.psd1")
Import-Module $MANIFEST -Force
#endregion

InModuleScope $MODULE {
  Describe "Install-Font function tests" -Tag Unit {
    It "Git command not found" {
      Mock Get-Command { throw }
      { Install-Font } | Should Throw
    }
    It "Font path not found" {
      Mock Test-Path { return $false }
      Mock Write-Verbose
      { Install-Font } | Should Throw
      Assert-MockCalled Write-Verbose 0
    }
    It "Font does not exist yet" {
      Mock Get-Command
      Mock Write-Verbose
      Mock git
      Mock Invoke-FontScript
      Install-Font -Verbose
      Assert-MockCalled Write-Verbose 1
      Assert-MockCalled git 1
      Assert-MockCalled Invoke-FontScript
    }
  }
}