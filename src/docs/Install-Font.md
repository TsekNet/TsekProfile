---
external help file: TsekProfile-help.xml
Module Name: TsekProfile
online version:
schema: 2.0.0
---

# Install-Font

## SYNOPSIS
Download Powerline fonts from GitHub.

## SYNTAX

```
Install-Font [[-FontPath] <FileInfo>] [<CommonParameters>]
```

## DESCRIPTION
Powerline fonts are required for the custom characters that are used in the
oh-my-posh theme that this profile uses.

## EXAMPLES

### EXAMPLE 1
```
Install-Font -FontPath "$env:LOCALAPPDATA\Microsoft\Windows\Fonts\DejaVu Sans Mono for Powerline.ttf"
```

## PARAMETERS

### -FontPath
Fully qualified path to install the selected font to.

```yaml
Type: FileInfo
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: "$env:LOCALAPPDATA\Microsoft\Windows\Fonts\DejaVu Sans Mono for Powerline.ttf"
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
