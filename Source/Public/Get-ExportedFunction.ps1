function Get-ExportedFunction {
  try {
    $functions = (Get-Command -Module 'TsekProfile' -CommandType Function).Name -join ', '
    Write-Output "Profile helper functions: $functions"
  }
  catch {
    Write-Error "Error obtaining helper function list: $_"
  }
}