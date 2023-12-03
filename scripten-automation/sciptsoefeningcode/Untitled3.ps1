param(

    $path
)

$aantalfiles = (Get-ChildItem -File $path -Recurse).count

Write-Output "$path"

