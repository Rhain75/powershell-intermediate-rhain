$cred = Get-Credential
$disabled = Get-ADUser -Filter 'Enabled -eq $false' -Properties LastLogonDate, Description -Server 172.16.0.5 -Credential $cred
$disabled | Format-Table Name, SamAccountName, Enabled, LastLogonDate
$disabled | Select-Object Name, SamAccountName, Enabled, LastLogonDate, Description |
Export-Csv -Path .\disabled-users.csv -NoTypeInformation