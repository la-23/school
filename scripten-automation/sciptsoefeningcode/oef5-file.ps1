$Collection = 1..100
ForEach ($Item in $Collection) {
    $percentage = $item/100*100
    Write-Progress -PercentComplete $percentage -Status "$percentage % complete" -Activity "search in progress"
    # Your actual script logic here
    Start-Sleep -Milliseconds 50
}


