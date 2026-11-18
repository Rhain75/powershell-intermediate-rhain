Task 1- Create a new employee account
created jordan.bennett
OU location OU=IT, OU=departments, DC=nwtc, DC=local
Command used was 

$pw = Read-Host "Password" -AsSecureString
New-ADUser -Name "Jordan Bennett" -SamAccountName "jordan.bennett" -Department "IT" -Title "Systems Technician" -EmailAddress "jordan.bennett@nwtc.local" -Path "OU=IT,OU=Departments,DC=nwtc,DC=local" -AccountPassword $pw -Enabled $true

Task 2- Correct missing user info

*number of accounts fixed is 5

Info added-

Hayden Miller,Jordan Bennett, old.employee, former.staff, temp.employee
Department: HR, Email: old.employee@nwtc.local, Phone: 920-555-5555 for each (hayden only got a dept and jordan only got a phone #)

Commands used-
Update-MissingUserInfo.ps1

Task 3-
Users corrected Sam Jackson-IT, Robin Young-IT, Robin Miller-Finance
Commands used were Update-DepartmentNames.ps1

Task 4- 
user added was Jordan Bennett to vpn_users
user that was removed was helpdesk from serveradmins

commands used-
Add-ADGroupMember -Identity "VPN_users" -Members "jordan.bennett"
Remove-ADGroupMember -Identity "ServerAdmins" -Members "HelpDesk" -Confirm:$false

Task 5-
Current Membership- domainusers, serveradmins
action taken: removed svc_backup from serveradmins and added it to the backup operators

Commands used-
Get-ADPrincipalGroupMembership svc_backup | Select-Object -ExpandProperty Name
Remove-ADGroupMember -Identity "ServerAdmins" -Members "svc_backup" -Confirm:$false
Add-ADGroupMember -Identity "Backup Operators" -Members "svc_backup"
the reason for the change was because svc_backup is an account that only needs to back up files it didnt need full admin rights

Task 6-
Commands used-
Get-ADUser -Filter "Name -eq 'temp.employee'" | Disable-ADAccount
New-ADUser -Name "former.employee" -SamAccountName "former.employee" -Path "OU=HR,OU=Departments,DC=nwtc,DC=local"
Disable-ADAccount -Identity "former.employee"