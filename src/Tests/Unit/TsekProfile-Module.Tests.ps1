#region Test Configuration
Set-Location -Path $PSScriptRoot
$ModuleName = 'TsekProfile'
$PathToManifest = [System.IO.Path]::Combine('..', '..', $ModuleName, "$ModuleName.psd1")
$PathToModule = [System.IO.Path]::Combine('..', '..', $ModuleName, "$ModuleName.psm1")
#endregion

Describe 'Module Tests' -Tag Unit {
    Context "Module Tests" {
        It 'Passes Test-ModuleManifest' {
            Test-ModuleManifest -Path $PathToManifest | Should Not BeNullOrEmpty
            $? | Should Be $true
        }#manifestTest
        It 'Root module TsekProfile.psm1 should exist' {
            $PathToModule | Should Exist
            $? | Should Be $true
        }#psm1Exists
        It 'Manifest should contain TsekProfile.psm1' {
            $PathToManifest |
                Should -FileContentMatchExactly "TsekProfile.psm1"
        }#validPSM1
    }#context_ModuleTests
}#describe_ModuleTests
