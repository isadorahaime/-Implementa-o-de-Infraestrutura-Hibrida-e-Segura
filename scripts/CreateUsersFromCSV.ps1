# Importa usuários de um CSV e os cria no AD
$users = Import-Csv "C:\scripts\usuarios_novos.csv"

foreach ($user in $users) {
    New-ADUser -Name $user.Name -SamAccountName $user.Login `
    -UserPrincipalName "$($user.Login)@thm.local" `
    -Path "OU=$($user.Department),OU=THM,DC=thm,DC=local" `
    -AccountPassword (ConvertTo-SecureString "SenhaPadrao123!" -AsPlainText -Force) `
    -Enabled $true
}
