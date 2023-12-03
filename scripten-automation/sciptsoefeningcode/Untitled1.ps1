$find_to_find = "hosts"

$contentfile = Get-ChildItem -Path C:\Windows\System32 -Recurse -File | Where-Object {$_.Name -eq "$find_to_find"}
Get-Content $contentfile


$find_to_find = "networks"

$contentfile = Get-ChildItem -Path C:\Windows\System32 -Recurse -File | Where-Object {$_.Name -eq "$find_to_find"}
Get-Content $contentfile