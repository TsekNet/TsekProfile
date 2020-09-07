---
external help file: TsekProfile-help.xml
Module Name: TsekProfile
online version:
schema: 2.0.0
---

# Set-WindowTitle

## SYNOPSIS
Updates the console title with information about the currently running
environment.

## SYNTAX

```
Set-WindowTitle [-Force] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Obtains the following environment information and writes it to the console
title:
- Elevation level (admin/non-admin)
- PowerShell version
- $env:COMPUTERNAME (hostname)

## EXAMPLES

### EXAMPLE 1
```
Set-WindowTitle -Force
```

## PARAMETERS

### -Force
Controls whether or not the user is prompted to change the window title.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
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
