# Update-DepartmentNames.ps1
# Fixes misspelled or invalid department names

$users = Get-ADUser -Filter * -SearchBase "OU=Departments,DC=nwtc,DC=local" -Properties Department

foreach ($user in $users) {
    $old = $user.Department

    if ($old -eq 'ITT') {
        $new = 'IT'
    }
    elseif ($old -eq 'Finanace') {
        $new = 'Finance'
    }
    elseif ($old -eq 'Unknown') {
        $new = ($user.DistinguishedName -split ',')[1] -replace 'OU=', ''
    }
    else {
        continue
    }

    Set-ADUser $user -Department $new
    Write-Output "$($user.Name) - changed from '$old' to '$new'"
}