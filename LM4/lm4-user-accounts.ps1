<#
.SYNOPSIS
Creates a report of Active Directory user accounts.

.DESCRIPTION
Gets every user in the Departments OU and exports their name,
department, status to lm4-user-accounts.csv.
#>

function Export-UserAccountReport {
    $reportPath = "$PSScriptRoot\lm4-user-accounts.csv"

    Get-ADUser -Filter * -SearchBase "OU=Departments,DC=nwtc,DC=local" -Properties Department |
        Select-Object Name, Department, Enabled |
        Export-Csv -Path $reportPath -NoTypeInformation

    Write-Output "Report saved to $reportPath"
}

Export-UserAccountReport