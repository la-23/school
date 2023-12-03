
$aplc1 = Get-Process * | Where-Object {$_.Name -eq "*notepad*"}


$start_APPS = Start-Process -filepath  $aplicatiestart
$stop_apps = Stop-Process -Name $aplicatiestop

 Get-Process | Where-Object {$_.ProcessName -eq "notepad"}
