@{
  PSDependOptions      = @{
    DependencyType = 'PSGalleryModule'
    Target         = 'CurrentUser'
    Import         = $true
    AllowClobber   = $true
  }
  Pester               = '4.10.1'
  InvokeBuild          = '5.6.1'
  PSScriptAnalyzer     = '1.19.1'
  platyPS              = '0.12.0'
  'posh-git'           = 'latest'
  'Get-ChildItemColor' = 'latest'
  PSWriteHTML          = 'latest'
}