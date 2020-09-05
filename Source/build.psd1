@{
    Path = "TsekProfile.psd1"
    OutputDirectory = "..\bin\TsekProfile"
    Prefix = '.\_PrefixCode.ps1'
    SourceDirectories = 'Classes','Private','Public'
    PublicFilter = 'Public\*.ps1'
    VersionedOutputDirectory = $true
}
