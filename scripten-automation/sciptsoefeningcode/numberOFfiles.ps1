param(
    $path
)
$aantalfiles = (Get-ChildItem -File $path -Recurse).count
Write-Output "onder de map $path bevind zich $aantalfiles"
