$cred = Get-Credential
$users =Get-ADUser -Filter * -Properties Department, EmailAddress, OfficePhone -Server 172.16.0.5 -Credential $cred
$incomplete = $users | Where-Object { -not $_.Department -or -not $_.EmailAddress -or -not $_.OfficePhone }
$incomplete | Select-Object Name, SamAccountName, Department, EmailAddress, OfficePhone |
Export-Csv -Path .\incomplete-users.csv -NoTypeInformation