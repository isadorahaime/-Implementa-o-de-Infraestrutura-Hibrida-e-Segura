# Lista todos os usuários, mostrando o Nome, Logon e a OU onde ele pertence
Get-ADUser -Filter * -Properties CanonicalName | 
Select-Object Name, SamAccountName, @{Name="Unidade_Organizacional"; Expression={$_.CanonicalName.Split('/')[1]}} |
Sort-Object Unidade_Organizacional |
Format-Table -AutoSize
