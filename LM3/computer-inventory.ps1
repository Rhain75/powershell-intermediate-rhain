$cred = Get-Credential

Get-ADComputer -Filter * -Properties OperatingSystem -Server 172.16.0.5 -Credential $cred |
    Select-Object Name, DistinguishedName, OperatingSystem |
    Export-Csv -Path .\computer-inventory.csv -NoTypeInformation