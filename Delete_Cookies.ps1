Function Delete_Cookies ($usuario){

ls "C:\Users\$usuario\AppData\Roaming\Microsoft\Windows\Cookies" > $null
if ($? -eq "True")
{
Get-ChildItem -Path "C:\Users\$usuario\AppData\Roaming\Microsoft\Windows\Cookies" -Recurse | Remove-Item
Write-Host "Cookies Eliminados"
} else
{
Write-Host "Usuario no encontrado"
}
}

Write-Host "Introduzca su nombre de Usuario"
$user = Read-Host
Delete_Cookies $user