---
external help file: TsekProfile-help.xml
Module Name: TsekProfile
online version:
schema: 2.0.0
---

# Install-Profile

## SYNOPSIS
Copy the TsekNet PowerShell profile to the appropriate location, and execute
the profile script.

## SYNTAX

```
Install-Profile [[-Scope] <String>] [<CommonParameters>]
```

## DESCRIPTION
By default, overwrite the $profile.CurrentUserAllHosts file with the
contents of the profile.ps1 file in this directory.

Once the file is copied over, the profile script is executed.

## EXAMPLES

### EXAMPLE 1
```
Copy-Profile -Scope AllUsersAllHosts
```

Overwrite the AllUsersAllHosts PowerShell Profile with the code in .

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
