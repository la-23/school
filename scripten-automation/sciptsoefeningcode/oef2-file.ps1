param(
    $servicenaam
)

$statuservice = Get-Service -Name $servicenaam
 

if ($statuservice.Status -eq "stopped") {
    <# Action to perform if the condition is true #>
    Write-Output "de service $servicenaam is getopt"
}
elseif ($statuservice.Status -eq "running") {
    <# Action when this condition is true #>
    Write-Output "de service $servicenaam runt"
}

