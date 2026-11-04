$employees = Import-Csv -path ".\employees-1.csv"

foreach ($employee in $employees) {
    Write-Output "$($employee.FirstName) $($employee.LastName)"
}
$report =$employees | Select-Object Firstname, Lastname, Department, Location
$report | Format-Table