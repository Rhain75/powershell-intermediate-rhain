function Get-StudentName {
    Write-Output "Rhain"
}

function Get-CourseInfo {
    $courseName = "PowerShell Intermediate"
    Write-Output $courseName
}

function Get-SystemInfo {
    Write-Output "Computer name: $env:COMPUTERNAME"
    Write-Output "Current date: $(Get-Date)"
}