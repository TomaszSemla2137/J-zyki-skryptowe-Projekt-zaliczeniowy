#System
Write-Output "== Informacje o nazwa podawanych danych=="
Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object Caption, Version, BuildNumber, OSArchitecture, LastBootUpTime | Format-Table -AutoSize | Out-Host
#Prcoesor
Write-Output "== Informacje o nazwa podawanych danych=="
Get-CimInstance -ClassName Win32_Processor | Select-Object Name, NumberOfCores, NumberOfLogicalProcessors, MaxClockSpeed, L2CacheSize, L3CacheSize | Format-Table -AutoSize | Out-Host
#Ram
Write-Output "== Informacje o nazwa podawanych danych=="
Get-CimInstance -ClassName Win32_PhysicalMemory | Select-Object DeviceLocator, Capacity, Speed, Manufacturer, PartNumber | Format-Table -AutoSize | Out-Host
#Płyta główna
Write-Output "== Informacje o nazwa podawanych danych=="
Get-CimInstance -ClassName Win32_BaseBoard | Select-Object Manufacturer, SerialNumber, Product, Version | Format-Table -AutoSize | Out-Host
#karta graficzna i monitory
Write-Output "== Informacje o nazwa podawanych danych=="
Get-CimInstance -ClassName Win32_VideoController | Select-Object Name, AdapterRAM, DriverVersion, VideoModeDescription | Format-Table -AutoSize | Out-Host
#Dyski
Write-Output "== Informacje o nazwa podawanych danych=="
Get-PhysicalDisk | Select-Object FriendlyName, MediaType, Size, HealthStatus | Format-Table -AutoSize | Out-Host
#Karty sieciowe
Write-Output "== Informacje o nazwa podawanych danych=="
Get-NetAdapter | Select-Object Name, InterfaceDescription, Status, MacAddress, LinkSpeed | Format-Table -AutoSize | Out-Host
#Adresacja IP, bramy domyślne oraz DNS
Write-Output "== Informacje o nazwa podawanych danych=="
Get-NetIPConfiguration | Select-Object InterfaceAlias, IPv4Address, IPv4DefaultGateway, DNSServer | Format-Table -AutoSize | Out-Host
#Aktywne połączenia
Write-Output "== Informacje o nazwa podawanych danych=="
Get-NetTCPConnection -State Established, Listen | Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort, State, OwningProcess | Format-Table -AutoSize | Out-Host
#Tablica routingu i pamięć podręczna ARP
Write-Output "== Informacje o nazwa podawanych danych=="
Get-NetRoute | Format-Table -AutoSize | Out-Host
Get-NetNeighbor | Format-Table -AutoSize | Out-Host
#Monitor zasobów systemowych
Write-Output "== Informacje o nazwa podawanych danych=="
Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 15 Name, CPU, WorkingSet | Format-Table -AutoSize | Out-Host
#Usługi systemowe
Write-Output "== Informacje o nazwa podawanych danych=="
Get-Service | Select-Object Name, DisplayName, Status, StartType | Format-Table -AutoSize | Out-Host
#Sterowniki
Write-Output "== Informacje o nazwa podawanych danych=="
Get-CimInstance -ClassName Win32_PnPSignedDriver | Select-Object DeviceName, DriverVersion, Manufacturer | Format-Table -AutoSize | Out-Host
#Programy autostartu
Write-Output "== Informacje o nazwa podawanych danych=="
Get-CimInstance -ClassName Win32_StartupCommand | Select-Object Name, Command, Location | Format-Table -AutoSize | Out-Host
 