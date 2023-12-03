
# oefening 1 rapport windows system : 
Write-Host "* Rapport Windows Systeem *" -ForegroundColor Yellow
Write-Host "---------------------------" -ForegroundColor Yellow 

Write-Host "computername : $env:COMPUTERNAME    "
Write-Host "gebruikersprofies : $env:USERPROFILE   "
Write-Host "Processor Architecture : $Env:PROCESSOR_ARCHITECTURE     "

#$windowsversie = (Get-ComputerInfo).WindowsProductName
$windowsVersion = (Get-WmiObject Win32_OperatingSystem).Caption
Write-Host "windowsversie : $windowsVersion  "

# oefening 2 : 
Write-Host "* Tabel: Services Automatic Services LocalSystem" -ForegroundColor Yellow
$oefening2 = Get-Service * -ErrorAction SilentlyContinue | Where-Object {$_.Username -eq "LocalSystem" -and $_.StartType -eq "Automatic"}| Select-Object -Property Name,DisplayName,Username,@{Name="StartupType";Expression={$_.StartType}} | Sort-Object DisplayName
Write-Output $oefening2 |Format-Table -AutoSize


# oefening 3 : 
Write-Host " * Tabel: Processen uitgaande van Microsoft die het afgelopen uur zijn gestart” -ForegroundColor Yellow
$oefening3 = Get-Process *  | Where-Object { $_.StartTime -ge (Get-Date).AddHours(-1) -and $_.Company -like 'Microsoft*' } | Select-Object -Property Id,Name,StartTime,Company
Write-Output $oefening3 | Format-Table -AutoSize

# oefening 4 : 

Write-Host "* Tabel: 10 grootste PrivateMemorySize processen" 
$oefening4 = Get-Process | Sort-Object PrivateMemorySize -Descending | Select-Object -Property ProcessName,PrivateMemorySize,CPU,Path | Select-Object -First 10
Write-Output $oefening4 | Format-Table -AutoSize

#oefening 5 : 
Write-Host " * Tabel: 20 kleinste DLL's in C:\Program Files (x86)'" -ForegroundColor Yellow
$oefening5 = get-ChildItem -Path 'C:\Program Files (x86)' -Recurse -ErrorAction SilentlyContinue | Where-Object{$_.Name -like "*.dll"} | Sort-Object Length -Descending | Select-Object -Last 20 | Select-Object -Property Length,Name | Sort-Object Length
Write-Output $oefening5 | Format-Table -AutoSize

#oefening 6 : 
Write-Host "* Totaal aantal hidden files in het gebruikersprofiel met de totale file size" -ForegroundColor Yellow
$oefening6 = Get-ChildItem -Path $env:USERPROFILE -hidden -Recurse -file | Measure-Object Length -Sum | Select-Object Count,@{Name="sum";Expression={$_.Sum/1mb}}
Write-Output $oefening6 | Format-Table -AutoSize



