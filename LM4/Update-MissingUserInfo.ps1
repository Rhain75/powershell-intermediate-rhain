# Update-MissingUserInfo.ps1
# Fills in missing Department, Email, and Phone

$users = Get-ADUser -Filter * -SearchBase "OU=Departments,DC=nwtc,DC=local" -Properties Department, EmailAddress, OfficePhone

foreach ($user in $users) {

    if (-not $user.Department) {
        $ou = ($user.DistinguishedName -split ',')[1] -replace 'OU=', ''
        Set-ADUser $user -Department $ou
        Write-Output "$($user.Name) - Department set to $ou"
    }

    if (-not $user.EmailAddress) {
                $email = "$($user.Name)@nwtc.local"
        Set-ADUser $user -EmailAddress $email
        Write-Output "$($user.Name) - Email set to $email"
    }

    if (-not $user.OfficePhone) {
        Set-ADUser $user -OfficePhone "920-555-5555"
        Write-Output "$($user.Name) - Phone set to 920-555-5555"
    }
}
