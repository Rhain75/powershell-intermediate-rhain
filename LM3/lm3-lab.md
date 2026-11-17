Identify cmdlets
command -Module ActiveDirectory -Noun ADUser
command -Module ActiveDirectory -Noun ADGroup
command -Module ActiveDirectory -Noun ADComputer
command -Module ActiveDirectory -Noun ADOrganizationalUnit

Users= 88
3 useful properties
1. Enabled since it finds disabled accounts and shows as true or false
2. LastLogonDate finds unused accounts and shows a date and time
3. PasswordLastSet finds passwords that are old or never changed so it gives a date and time

