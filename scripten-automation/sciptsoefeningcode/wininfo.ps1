Write-Host "* Rapport Windows Systeem *" -ForegroundColor Yellow
Write-Host "---------------------------" -ForegroundColor Yellow 

Write-Host "computername : $env:COMPUTERNAME    "
Write-Host "gebruikersprofies : $env:USERPROFILE   "
Write-Host "Processor Architecture : $Env:PROCESSOR_ARCHITECTURE     "

$windowsversie = (Get-ComputerInfo).WindowsProductName
Write-Host "windowsversie : $windowsversie  "
write-host"uptime:" 


