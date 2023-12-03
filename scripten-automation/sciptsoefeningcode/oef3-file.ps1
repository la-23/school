param(
    [parameter(Mandatory)]$ServiceName,
    [switch]$Askuser,
    [switch]$info
)
$statusService = Get-Service -Name $ServiceName -ErrorAction SilentlyContinue

if ($statusService.Status -eq "Running") {
    Write-Output "$ServiceName is already running"
}
elseif ($statusService.Status -eq "Stopped") {
    if ($Askuser -eq $true) {
        $antwoord = Read-Host "do you want to start $ServiceName yes/no"
        if ($antwoord -eq "yes") {
            $statusService.Start()
        }

    }
    else {
        $statusService.Start()
    }

}
else {
    Write-Output "$ServiceName bestaat niet"
}
