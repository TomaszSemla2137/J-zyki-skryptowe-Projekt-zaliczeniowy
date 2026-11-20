PowerShell
# Diagonostyka
        
   ## A: Na co pozwala mi powershell?
    
-Informacje o systemie (jego wersja, jądro i konfiguracji):

`Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object Caption, Version, BuildNumber, OSArchitecture, LastBootUpTime`

-Procesor (liczba rdzeni, wątków, taktowanie bazowe oraz Cache):

`Get-CimInstance -ClassName Win32_Processor | Select-Object Name, NumberOfCores, NumberOfLogicalProcessors, MaxClockSpeed, L2CacheSize, L3CacheSize`

-Ram (pojemność, taktowanie, producent i numer seryjny modułu)

`Get-CimInstance -ClassName Win32_PhysicalMemory | Select-Object DeviceLocator, Capacity, Speed, Manufacturer, PartNumber`

-Płyta główna

`Get-CimInstance -ClassName Win32_BaseBoard | Select-Object Manufacturer, Product, SerialNumber, Version`

-Karta graficzna oraz monitory

`Get-CimInstance -ClassName Win32_VideoController | Select-Object Name, AdapterRAM, DriverVersion, VideoModeDescription`

-Dyski 

`Get-PhysicalDisk | Select-Object FriendlyName, MediaType, Size, HealthStatus`

-Karty sieciowe

`Get-NetAdapter | Select-Object Name, InterfaceDescription, Status, MacAddress, LinkSpeed`

-Adresacja IP, bramy domyślne oraz DNS

`Get-NetIPConfiguration | Select-Object InterfaceAlias, IPv4Address, IPv4DefaultGateway, DNSServer`

-Aktywne połączenia i otwarte porty

`Get-NetTCPConnection -State Established, Listen | Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort, State, OwningProcess`

-Tablica Routingu i pamięć podręczna ARP

`Get-NetRoute`

`Get-NetNeighbor`

-Monitor zużycia zasobów

`Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 15 Name, CPU, WorkingSet`

-Usługi systemowe

`Get-Service | Select-Object Name, DisplayName, Status, StartType`

-Sterowniki

`Get-CimInstance -ClassName Win32_PnPSignedDriver | Select-Object DeviceName, DriverVersion, Manufacturer`

-Programy autostartu

`Get-CimInstance -ClassName Win32_StartupCommand | Select-Object Name, Command, Location`

  ##  B: implementacja w pliku "specyfikacja.ps1"
    
aby wszystkie skrypty działały i były uruchamiane grupowo w pliku `.ps1` muszę po pierwsze dodać formatowanie tekstu z nagłówkiem czego te dane dotyczą, na przykład:

`Write-Output "== Informacje o nazwa podawanych danych=="`

oraz potrzebujemy klauzuli wypisującej te dane, czyli na końcu powyższych metod należy dodać fragment:

`| Format-Table -AutoSize | Out-Host`