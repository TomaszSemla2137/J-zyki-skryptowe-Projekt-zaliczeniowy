PowerShell
        1. Diagonostyka
    A: Na co pozwala mi powershell?
-Informacje o systemie (jego wersja, jądro i kofniguracji):
`Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object Caption, Version, BuildNumber, OSArchitecture, LastBootUpTime`
-Procesor (liczba rdzeni, wątków, taktowanie bazowe oraz Cache):
`Get-CimInstance -ClassName Win32_Processor | Sekect-Object Name, NumberOfCores, NumberOfLogicalProcessors, MaxClockSpeed, L2CacheSize, L3CacheSize`
-Ram (pojemonść, takotwanie, producent i numer seryjny modułu)
`Get-CimInstance -ClassName Win32_PhysicalMemory | Select-Object DeviceLocator, Capity, Speed, Manufacturer, PartNumber`
-Płyta główna
`Get-CimInstance -ClassName Win32_BaseBoard | Select-Object `
-Karta graficzna oraz monitory
`Get-CimInstance -ClassName Win32_VideoController | Select-Object `
-Dyski 
`Get-PhysicalDisk | Select-Object `
-Karty sieciowe
`Get-CimInstance -ClassName Win32_Battery | Select-Object `
-Adresacja IP, bramy domyślne oraz DNS
`Get-NetAdapter | Select-Object `
-Aktywne połączenia i otwarte porty
`Get-NetTCPConnection -State Established, Listen | Select-Object `
-Tablica Routingu i pamięć podręczna ARP
`Get-NetRouge`
`Get-NetNeighbor`
-Monitor zużycia zasobów
`Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 15 Name, CPU, WorkingSet`
-Usługi systemowe
`Get-Service | Select-Object Name, DisplayName, Status, StartType`
-Sterowniki
`Get-CimInstance -ClassName Win32_PnPSignedDriver | Select-Object DeviceName, DriverVersion, Manufacturer`
-Programy autostartu
`Get-CimInstance -ClassName Win32_StartupCommand | Select-Object Name, Command, Location`
    B: implementacja w pliku "specyfikacja.ps1"
aby wszystkie skrypty działały i były uruchamiane grupowo w pliku `.ps1` muszę po pierwsze dodać formatowanie tekstu z nagłówkiem czego te dane dotyczą, na przykład:
`Write-Output `"== Informacje o nazwa podawanych danych=="``
oraz potrzebujemy klauzuli wypisującej te dane, czyli na końcu powyższych metod należy dodać fragment:
`| Format-Table -AutoSize | Out-Host`