Write-Host "Inhoud van de Windows hosts file: C:\Windows\System32\drivers\etc\hosts " -ForegroundColor Yellow 
Get-Content "C:\Windows\System32\drivers\etc\hosts"


Get-ChildItem -Path "C:\Users" -Recurse -File -Include *.doc, *.docx | Where-Object { $_.LastWriteTime -ge "2022-10-01" } 

