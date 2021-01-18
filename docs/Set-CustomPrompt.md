---
external help file: TsekProfile-help.xml
Module Name: TsekProfile
online version:
schema: 2.0.0
---

# Set-CustomPrompt

## SYNOPSIS
Custom PowerShell prompt.

## SYNTAX

```
Set-CustomPrompt [[-Symbol] <String>] [-Force] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
This prompt adds the following functionality:

1.
Invocation ID count (how many times a command was executed)
2.
The custom output of the current directory, with optional trimming if the current directory is determined to be too long.
3.
Posh-Git integration
4.
Built-in timers for each command executed in the console
5.
The current local time
6.
A custom ASCII symbol placed before the cursor

## EXAMPLES

### EXAMPLE 1
```
Set-CustomPrompt -Symbol '26A1' -Force
```

Forces the prompt to change, using the 'High Voltage' Emoji (⚡) as the
ASCII character is placed before the cursor.

## PARAMETERS

### -Symbol
ASCII code for the symbol placed before the cursor in the console.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 1F680
Accept pipeline input: False
Accept wildcard characters: False
```

### -Force
Controls whether or not the user is prompted to change their prompt.

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
This theme has taken inspiration heavily from the Agnoster oh-my-posh theme.

## RELATED LINKS
