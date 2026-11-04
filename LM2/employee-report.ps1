$employees = Import-Csv -path ".\employees-1.csv"

foreach ($employee in $employees) {
    Write-Output "$($employee.FirstName) $($employee.LastName)"
}
