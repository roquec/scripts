Write-Host "Verifying windows setup state..."
Write-Host " "
Invoke-Expression -Command "$PSScriptRoot\winget\verify.ps1" | Out-Null
Write-Host " "
Invoke-Expression -Command "$PSScriptRoot\fonts\verify.ps1" | Out-Null
Write-Host " "
Invoke-Expression -Command "$PSScriptRoot\windows-terminal\verify.ps1" | Out-Null
Write-Host " "
Invoke-Expression -Command "$PSScriptRoot\powershell\verify.ps1" | Out-Null
Write-Host " "
Invoke-Expression -Command "$PSScriptRoot\oh-my-posh\verify.ps1" | Out-Null
Write-Host " "
Write-Host "In case of missing installations or configurations run setup.ps1 script."