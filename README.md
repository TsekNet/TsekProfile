# TsekProfile

[![Minimum Supported PowerShell
Version](https://img.shields.io/badge/PowerShell-5.1+-purple.svg)](https://github.com/PowerShell/PowerShell)
[![License:
MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/TsekNet/TsekProfile/blob/master/LICENSE)
[![Windows-Build](https://github.com/TsekNet/TsekProfile/workflows/Windows-Build/badge.svg?branch=master)](https://github.com/TsekNet/TsekProfile/actions?query=workflow%3AWindows-Build)

<p align="center">
    <img src="./media/logo.png" alt="TsekProfile Logo" >
</p>

TsekProfile is a PowerShell profile that adds built-in functionality to your
PowerShell experience.

See my [blog post](https://tseknet.com/blog/psprofile) for more information.

## Installation

1. Install [dependencies](#included-modules):

    ```powershell
    Install-Module posh-git, oh-my-posh, Get-ChildItemColor, PSWriteHTML -Scope CurrentUser -AllowClobber
    ```

2. Install [git](https://git-scm.com/download/win) and reopen the PowerShell window

3. Install TsekProfile from the PowerShell Gallery:

    ```powershell
    Install-Module -Name TsekProfile -Scope CurrentUser
    ```

4. Copy the TsekNet PowerShell profile to the appropriate location and execute:

    ```powershell
    Install-Profile
    ```

## Usage

The following functions are made available after installing this profile:

```powershell
Copy-LastCommand, Edit-Profile, Get-ExportedFunction, Get-FileHash256, Install-Profile, Invoke-Profile, Open-HistoryFile, Set-CustomPrompt
```

TsekProfile leverages [platyPS](https://github.com/PowerShell/platyPS) to
automatically generate Markdown documentation. See [docs](/docs/TsekProfile.md)
for more information.

## Screenshots

PowerShell running in an administrative window while working on a git repo

![PowerShell Admin](media/admingit.png)

PowerShell running in a non-admin window while working in `C:\Tmp`

![PowerShell Non-Admin](media/nonadmin.png)

## Included Modules

The following (awesome) modules will be installed by default:

1. [posh-git](https://github.com/dahlbyk/posh-git): Integrates Git and
   PowerShell by providing Git status summary information
1. [oh-my-posh](https://github.com/JanDeDobbeleer): Exposes functions used to
   write fancy PowerShell prompts
1. [Get-ChildItemColor](https://github.com/joonro/Get-ChildItemColor): Provides
   colorization of outputs of `Get-ChildItem` Cmdlet of PowerShell
1. [PSWriteHTML](https://github.com/EvotecIT/PSWriteHTML): Output PowerShell
   commands to a formatted HTML page

Honorable mention: The [PowerLine](https://github.com/Jaykul/PowerLine) module,
which sparked the idea for this module's development.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.