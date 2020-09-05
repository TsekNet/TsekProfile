# Helper function to ensure all modules are loaded, with error handling
function Import-MyModule {
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