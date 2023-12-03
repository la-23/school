Get-ChildItem 'C:\Program Files' | Where-Object{$__.Name -like "*.exe"} | Measure-Object -Maximum | Select-Object -First 10 | select name,Length | Measure-Object length -Descending

