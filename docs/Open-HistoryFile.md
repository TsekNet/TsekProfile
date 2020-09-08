---
external help file: TsekProfile-help.xml
Module Name: TsekProfile
online version:
schema: 2.0.0
---

# Open-HistoryFile

## SYNOPSIS
Opens the PowerShell history file.

## SYNTAX

```
Open-HistoryFile
```

## DESCRIPTION
Opens the (Get-PSReadLineOption).HistorySavePath file conditionally in one
of the following programs:
1.
PowerShell ISE, if detected as the current host.
2.
VSCode, if detected as the current host.
3.
Notepad, if the current host is netiher of the above.

## EXAMPLES

### EXAMPLE 1
```
Open-HistoryFile
```

## PARAMETERS

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
