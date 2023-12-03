# Oefening 1: Rapport Windows Systeem
Write-Host "* Rapport Windows Systeem *" -ForegroundColor Yellow
Write-Host "---------------------------" -ForegroundColor Yellow 

Write-Output "Computernaam          : $env:COMPUTERNAME"
Write-Output "Gebruikersprofiel     : $env:USERPROFILE"
Write-Output "Processor Architectuur: $Env:PROCESSOR_ARCHITECTURE"

$windowsVersion = (Get-WmiObject Win32_OperatingSystem).Caption
Write-Output "Windows Versie        : $windowsVersion"
Write-Output ""

# Oefening 2: Tabel - Services Automatic Services LocalSystem
Write-Host "* Tabel: Services Automatic Services LocalSystem" -ForegroundColor Yellow
$oefening2 = Get-Service * -ErrorAction SilentlyContinue | 
             Where-Object {$_.Username -eq "LocalSystem" -and $_.StartType -eq "Automatic"} | 
             Select-Object -Property Name, DisplayName, Username, @{Name="StartupType";Expression={$_.StartType}} | 
             Sort-Object DisplayName
$oefening2 | Format-Table -AutoSize
Write-Output ""

# Oefening 3: Tabel - Processen uitgaande van Microsoft die het afgelopen uur zijn gestart
Write-Host "* Tabel: Processen uitgaande van Microsoft die het afgelopen uur zijn gestart" -ForegroundColor Yellow
$oefening3 = Get-Process * | 
             Where-Object { $_.StartTime -ge (Get-Date).AddHours(-1) -and $_.Company -like 'Microsoft*' } | 
             Select-Object -Property Id, Name, StartTime, Company
$oefening3 | Format-Table -AutoSize
Write-Output ""

# Oefening 4: Tabel - 10 grootste PrivateMemorySize processen
Write-Host "* Tabel: 10 grootste PrivateMemorySize processen" -ForegroundColor Yellow
$oefening4 = Get-Process | 
             Sort-Object PrivateMemorySize -Descending | 
             Select-Object -Property ProcessName, PrivateMemorySize, CPU, Path | 
             Select-Object -First 10
$oefening4 | Format-Table -AutoSize
Write-Output ""

# Oefening 5: Tabel - 20 kleinste DLL's in C:\Program Files (x86)
Write-Host "* Tabel: 20 kleinste DLL's in C:\Program Files (x86)" -ForegroundColor Yellow
$oefening5 = Get-ChildItem -Path 'C:\Program Files (x86)' -Recurse -ErrorAction SilentlyContinue | 
             Where-Object {$_.Name -like "*.dll"} | 
             Sort-Object Length -Descending | 
             Select-Object -Last 20 | 
             Select-Object -Property Length, Name | 
             Sort-Object Length
$oefening5 | Format-Table -AutoSize
Write-Output ""

# Oefening 6: Totaal aantal verborgen bestanden in het gebruikersprofiel met de totale bestandsgrootte
Write-Host "* Totaal aantal hidden files in het gebruikersprofiel met de totale file size" -ForegroundColor Yellow
$oefening6 = Get-ChildItem -Path $env:USERPROFILE -Hidden -Recurse -File | 
             Measure-Object Length -Sum | 
             Select-Object Count, @{Name="Totale Grootte (MB)";Expression={$_.Sum/1mb}}
$oefening6 | Format-Table -AutoSize
