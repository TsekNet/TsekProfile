# Download Files from Github
function Import-GitRepo {
  <#
  .Synopsis
    This function will download a Github Repository without using Git
  .DESCRIPTION
    This function will download files from Github without using Git.  You will
    need to know the Owner, Repository name, branch (default master), and
    FilePath.  The Filepath will include any folders and files that you want to
    download.
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
  [Alias()]
  [OutputType([int])]
  param (
    # Repository owner
    [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
    [string]$Owner,

    # Name of the repository
    [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 1)]
    [string]$Repository,

    # Branch to download from
    [Parameter(ValueFromPipelineByPropertyName, Position = 2)]
    [string]$Branch = 'master',

    # List of files/paths to download
    [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 3)]
    [string[]]$FilePath,

    # List of posh-git themes to download
    [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 4)]
    [string[]]$ThemeName
  )

  begin {
    $modulespath = ($env:psmodulepath -split ";")[0]
    $PowerShellModule = "$modulespath\$Repository"
    $wc = New-Object System.Net.WebClient
    $wc.Encoding = [System.Text.Encoding]::UTF8
    if (-not(Test-Path $PowerShellModule)) {
      Write-Verbose "Creating module directory"
      New-Item -Type Container -Path $PowerShellModule -Force | Out-Null
    }

    if (-not(Test-Path $profile)) {
      Write-Verbose "Creating profile"
      New-Item -Path $profile -Force | Out-Null
    }
  }
  process {
    foreach ($item in $FilePath) {
      if ($item -like '*.*') {
        $url = "https://raw.githubusercontent.com/$Owner/$Repository/$Branch/$item"
        Write-Verbose "Attempting to download from '$url'"
        if ($item -like "*$ThemeName.psm1") {
          Write-Verbose "'$item' detected, overwriting..."
          $fullpath = "$(Join-Path -Path (Get-ChildItem $profile).Directory.FullName -ChildPath 'PoshThemes')\$ThemeName.psm1"
          if (-not(Test-Path $fullpath)) {
            Write-Verbose "Creating file '$fullpath'"
            New-Item -ItemType File -Force -Path $fullpath | Out-Null
          }
          ($wc.DownloadString("$url")) | Out-File $fullpath
        }
        elseif ($item -like '*profile.ps1') {
          Write-Verbose "'$item' detected, overwriting..."
          New-Item -ItemType File -Force -Path $profile | Out-Null
          Write-Verbose "Created file '$profile'"
          ($wc.DownloadString("$url")) | Out-File "$profile"
        }
        else {
          Write-Verbose "'$item' detected, overwriting..."
          New-Item -ItemType File -Force -Path "$PowerShellModule\$item" | Out-Null
          Write-Verbose "Created file '$PowerShellModule\$item'"
          ($wc.DownloadString("$url")) | Out-File "$PowerShellModule\$item"
        }
      }
      else {
        New-Item -ItemType Container -Force -Path "$PowerShellModule\$item" | Out-Null
        Write-Verbose "Created file '$PowerShellModule\$item'"
        $url = "https://raw.githubusercontent.com/$Owner/$Repository/$Branch/$item"
        Write-Verbose "Attempting to download from $url"
      }
    }
  }
  end {}
}