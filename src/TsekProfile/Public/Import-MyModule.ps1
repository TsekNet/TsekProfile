# Helper function to ensure all modules are loaded, with error handling
function Import-MyModule {
  <#
  .SYNOPSIS
    This function will download a Github Repository without using Git
  .DESCRIPTION
    This function will download files from Github without using Git.  You will
    need to know the Owner, Repository name, branch (default master), and
    FilePath.  The Filepath will include any folders and files that you want to
    download.
  .PARAMETER Modules
    List of modules to optionally import
  .EXAMPLE
    Import-GitRepo -Owner MSAdministrator -Repository WriteLogEntry -Verbose -FilePath `
      'WriteLogEntry.psm1',
    'WriteLogEntry.psd1',
    'Public',
    'en-US',
    'en-US\about_WriteLogEntry.help.txt',
    'Public\Write-LogEntry.ps1'
  #>
  [CmdletBinding()]
  param (
    [Parameter(Mandatory)]
    [string[]]$Modules
  )

  foreach ($Module in $Modules) {
    if (Get-Module -ListAvailable -Name $Module -Verbose:$false) {
      Write-Verbose "Module '$Module' found, skipping install."
      Continue
    }
    try {
      Write-Verbose "Attemping to install module '$Module'"
      Import-Module -Name $Module -ErrorAction Stop -Verbose:$false
    }
    catch {
      $lookup = Find-Module -Name $Module
      if (-not $lookup) {
        Write-Error "Module `"$Module`" not found."
        continue
      }
      Install-Module -Name $Module -Scope AllUsers -Force -AllowClobber
      Import-Module -Name $Module -Scope Global -Verbose:$false
    }
  }
}