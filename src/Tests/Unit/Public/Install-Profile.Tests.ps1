#region Test Configuration
Set-Location -Path $PSScriptRoot
$MODULE = 'TsekProfile'
Get-Module $MODULE | Remove-Module -Force
$MANIFEST = [System.IO.Path]::Combine('..', '..', '..', $MODULE, "$MODULE.psd1")
Import-Module $MANIFEST -Force
#endregion

InModuleScope $MODULE {
  Describe "Install-Profile function tests" -Tag Unit {
    It "Profile directory exists" {
      Mock Set-Content
      Mock Invoke-Profile
      Install-Profile
      Assert-MockCalled Set-Content
      Assert-MockCalled Invoke-Profile
    }
    It "Profile directory does not exist" {
      Mock Test-Path { return $false }
      Mock New-Item
      Mock Write-Verbose
      Mock Set-Content
      Mock Invoke-Profile
      Install-Profile
      Assert-MockCalled New-Item
      Assert-MockCalled Write-Verbose
      Assert-MockCalled Set-Content
      Assert-MockCalled Invoke-Profile
    }
  }
}