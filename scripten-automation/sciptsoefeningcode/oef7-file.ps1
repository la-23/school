$windowsitems = Get-Item C:\Windows
$programfilesItems = Get-Item 'C:\Program Files'
$powershellItems = Get-Item C:\powershell

$lijst = @()
$lijst += $windowsitems
$lijst += $programfilesItems
$lijst += $powershellItems

Write-Output $lijst
$lijst | Get-Member

foreach($item in $lijst){
    $name = $item.Name
    $time = $item.LastWriteTime
    $atribute = $item.Attributes

    if($name -eq "Windows"){
        Write-Host "Informatie over de folder c:\Windows" -ForegroundColor Green
        Write-Host "------------------------------------" -ForegroundColor Green
        Write-Host ("de folder {0} is aangemaakt op {1} en heeft de volgende atributen : {2}" -f $name, $time, $atribute)
    }
    elseif($name -eq "Program Files"){
        Write-Host "Informatie over de folder c:\Program Files" -ForegroundColor Green
        Write-Host "-------------------------------------------" -ForegroundColor Green
        Write-Host ("de folder {0} is aangemaakt op {1} en heeft de volgende atributen : {2}" -f $name, $time, $atribute)
    }
    elseif($name -eq "powershell"){
        Write-Host "Informatie over de folder c:\powershell" -ForegroundColor Green
        Write-Host "---------------------------------------" -ForegroundColor Green
        Write-Host ("de folder {0} is aangemaakt op {1} en heeft de volgende atributen : {2}" -f $name, $time, $atribute)
    }
}