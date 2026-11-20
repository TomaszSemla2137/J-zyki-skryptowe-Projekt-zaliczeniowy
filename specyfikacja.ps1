#System
Write-Output "== Informacje o nazwa podawanych danych=="
Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object Caption, Version, BuildNumber, OSArchitecture, LastBootUpTime | Format-Table -AutoSize | Out-Host
#

#

#

#

#

#

#

#

#

#

#

#

#

#
