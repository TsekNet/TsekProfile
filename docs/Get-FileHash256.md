---
external help file: TsekProfile-help.xml
Module Name: TsekProfile
online version:
schema: 2.0.0
---

# Get-FileHash256

## SYNOPSIS
Compute the SHA-256 hash for a given file.

## SYNTAX

```
Get-FileHash256 [[-Path] <FileInfo>] [<CommonParameters>]
```

## DESCRIPTION
Wrapper function for Get-FileHash which defaulst the Algorithm parameter to
SHA256 and copies the returned hash to the clipboard.

## EXAMPLES

### EXAMPLE 1
```
Get-FileHash256 -Path C:\Windows\System32\notepad.exe
```

## PARAMETERS

### -Path
Fully qualified path to the file for which to obtain the SHA-256 hash.

```yaml
Type: FileInfo
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
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
