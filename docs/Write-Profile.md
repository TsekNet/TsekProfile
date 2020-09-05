---
external help file: TsekProfile-help.xml
Module Name: TsekProfile
online version:
schema: 2.0.0
---

# Write-Profile

## SYNOPSIS
Install the TsekNet PowerShell profile.

## SYNTAX

```
Write-Profile [[-Scope] <String>] [[-URL] <Uri>] [<CommonParameters>]
```

## DESCRIPTION
Install the TsekNet PowerShell profile from GitHub for the desired scope.
By default, the existing profile will not be overwritten.

## EXAMPLES

### EXAMPLE 1
```
Overwrite the AllUsersAllHosts PowerShell Profile with data downloaded from the URL.
```

.\install.ps1 -Scope 'AllUsersAllHosts' -URL 'http://example.com'

## PARAMETERS

### -Scope
Name of the PowerShell profile scope to use.
See https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles for more information.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: CurrentUserAllHosts
Accept pipeline input: False
Accept wildcard characters: False
```

### -URL
Fully qualified URL to the profile.ps1 file to download.

```yaml
Type: Uri
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: Https://github.com/TsekNet/PowerShell-Profile/raw/master/profile.ps1
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
