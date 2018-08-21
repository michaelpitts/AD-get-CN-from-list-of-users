Import-Module ActiveDirectory


$users = (Import-CSV "M:\userlist-names.csv") | select -exp Name


foreach ($user in $users) {
    Get-ADUser -Filter {Name -eq $user } -SearchBase "DC=MED,DC=HARVARD,DC=EDU" -Properties CanonicalName | Out-File -filepath M:\outfile.txt -Append}
