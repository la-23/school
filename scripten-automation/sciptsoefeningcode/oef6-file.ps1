$users = Import-Excel -Path C:\Users\student\Desktop\pxl_data.xlsx -WorksheetName "Studenten" 
$Departementen = Import-Excel -Path C:\Users\student\Desktop\pxl_data.xlsx -WorksheetName "Departementen"

$users | Get-Member
$departementen | Get-Member

$teller = 0
$teller2 = 0

foreach($student in $users){
    $teller = $teller + 1
}
Write-Host ("overzicht studenten ({0}) PXL:" -f $teller) -ForegroundColor Green

foreach($user in $users){
    $voornaam = $user.Voornaam
    $achternaam = $user.Naam
    $woonplaats = $user.Woonplaats

    Write-Host ("Student {0} {1} woonachtig te {2}" -f $voornaam, $achternaam, $woonplaats)
    
}


foreach($depart in $departementen){
    $teller2 = $teller2 + 1
}
Write-Host ("overzicht studenten ({0}) PXL:" -f $teller2) -ForegroundColor Green

foreach($departement in $Departementen){
    $departementNaam = $departement.Naam
    $DepartementRichting = $departement.Richting

    Write-Host ("Department {0} afdeling {1}" -f $departementNaam, $DepartementRichting)
}
