---
external help file:
Module Name:
online version:
schema: 2.0.0
---

# Import-GitRepo

## SYNOPSIS
This function will download a Github Repository without using Git

## SYNTAX

```
Import-GitRepo [-Owner] <String> [-Repository] <String> [[-Branch] <String>] [-FilePath] <String[]>
 [-ThemeName] <String[]> [<CommonParameters>]
```

## DESCRIPTION
This function will download files from Github without using Git. 
You will
need to know the Owner, Repository name, branch (default master), and
FilePath. 
The Filepath will include any folders and files that you want to
download.

## EXAMPLES

### EXAMPLE 1
```
Import-GitRepo -Owner MSAdministrator -Repository WriteLogEntry -Verbose -FilePath `
```

'WriteLogEntry.psm1',
    'WriteLogEntry.psd1',
    'Public',
    'en-US',
    'en-US\about_WriteLogEntry.help.txt',
    'Public\Write-LogEntry.ps1'

## PARAMETERS

### -Owner
Repository owner

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Repository
Name of the repository

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Branch
Branch to download from

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: Master
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -FilePath
List of files/paths to download

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ThemeName
List of posh-git themes to download

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 5
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Int32
## NOTES

## RELATED LINKS
