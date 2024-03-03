Write-Host "---------------------------------------" -ForegroundColor White
Write-Host "|  Installing applications via WinGet |" -ForegroundColor White
Write-Host "---------------------------------------" -ForegroundColor White
Write-Host " "
$wingetSetup = $PSScriptRoot + "\winget\setup.ps1"
& $wingetSetup
Write-Host "All apps installed!" -ForegroundColor Green

Write-Host " "
Write-Host " "
Write-Host "---------------------------------------" -ForegroundColor White
Write-Host "|       Updating path variables       |" -ForegroundColor White
Write-Host "---------------------------------------" -ForegroundColor White
Write-Host " "
$Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
[Environment]::SetEnvironmentVariable("Path", $Path, "Process")
Write-Host "Path environment variable updated!" -ForegroundColor Green

Write-Host " "
Write-Host " "
Write-Host "---------------------------------------" -ForegroundColor White
Write-Host "|     Configuring Windows Terminal    |" -ForegroundColor White
Write-Host "---------------------------------------" -ForegroundColor White
Write-Host " "
$windowsTerminalSetup = $PSScriptRoot + "\windows-terminal\setup.ps1"
& $windowsTerminalSetup
Write-Host "Windows Terminal configured!" -ForegroundColor Green

Write-Host " "
Write-Host " "
Write-Host "---------------------------------------" -ForegroundColor White
Write-Host "|        Configuring Oh MY Posh       |" -ForegroundColor White
Write-Host "---------------------------------------" -ForegroundColor White
Write-Host " "
$ohmyposhSetup = $PSScriptRoot + "\oh-my-posh\setup.ps1"
& $ohmyposhSetup
Write-Host "Oh MY Posh configured!" -ForegroundColor Green

Write-Host " "
Write-Host " "
Write-Host "---------------------------------------" -ForegroundColor White
Write-Host "|        Configuring PowerShell       |" -ForegroundColor White
Write-Host "---------------------------------------" -ForegroundColor White
Write-Host " "
$powershellSetup = $PSScriptRoot + "\powershell\setup.ps1"
& $powershellSetup
Write-Host "PowerShell configured!" -ForegroundColor Green

Write-Host " "
Write-Host " "
Write-Host "---------------------------------------" -ForegroundColor White
Write-Host "|      Installing Terminal Icons      |" -ForegroundColor White
Write-Host "---------------------------------------" -ForegroundColor White
Write-Host " "
$terminalIconsSetup = $PSScriptRoot + "\terminal-icons\setup.ps1"
& $terminalIconsSetup
Write-Host "Terminal Icons installed!" -ForegroundColor Green

Write-Host " "
Write-Host " "
Write-Host "---------------------------------------" -ForegroundColor White
Write-Host "|           Installing fonts          |" -ForegroundColor White
Write-Host "---------------------------------------" -ForegroundColor White
Write-Host " "
$fontsSetup = $PSScriptRoot + "\fonts\setup.ps1"
& $fontsSetup
Write-Host " "
Write-Host "All fonts installed!" -ForegroundColor Green


Write-Host " "
Write-Host " "
Write-Host "WINDOWS SETUP COMPLETED" -ForegroundColor White