# SYNOPSIS 
this script generates an employee report from a CSV file
DESCRIPTION
Imports employee data and exports reports to CSV and JSON#
$employees = Import-Csv -path ".\employees-1.csv"

foreach ($employee in $employees) {
    Write-Output "$($employee.FirstName) $($employee.LastName)"
}
$report =$employees | Select-Object Firstname, Lastname, Department, Location
$report | Format-Table
$report | export-csv -path ".\employee-report.csv" -notypeinformation
$report | ConvertTo-Json | set-content -path ".\employee-report.json"