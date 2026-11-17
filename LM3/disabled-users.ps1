<#Synopsis
gets all disabled AD users and exports their account info toa csv file
Description
It prompts the admin for AD credentials and connects to the domain controller, then gets all user accounts that are disabled
#>
$cred = Get-Credential
$disabled = Get-ADUser -Filter 'Enabled -eq $false' -Properties LastLogonDate, Description -Server 172.16.0.5 -Credential $cred
$disabled | Format-Table Name, SamAccountName, Enabled, LastLogonDate
$disabled | Select-Object Name, SamAccountName, Enabled, LastLogonDate, Description |
Export-Csv -Path .\disabled-users.csv -NoTypeInformation