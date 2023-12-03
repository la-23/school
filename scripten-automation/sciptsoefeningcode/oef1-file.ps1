
param (
    $path
)

if (! $path){
    Write-Host "geen parameter"

}
elseif(Test-Path $path){
    Write-Output "de $path bestaat"
}
else{
    Write-Output "de $path bestaat niet"
}
