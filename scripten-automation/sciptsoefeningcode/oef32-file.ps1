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
        Write-Output "service $ServiceName stopped"
        $antwoord = Read-Host "do you want to start $ServiceName yes/no"
        if ($antwoord -eq "yes") {
            $statusService.Start()
            Write-Output "Starting $ServiceName"
        }
        else{
            Write-Output "dont start the service $ServiceName"
        }

    }
    else {
        $statusService.Start()
        Write-Output "service $ServiceName stopped"
        Write-Output "startinf $ServiceName"
    }

}
else {
    Write-Output "$ServiceName bestaat niet"
}
