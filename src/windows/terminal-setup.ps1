Write-Output " "
Write-Output "This scripts require the following apps to be installed:"
Write-Output "  - Windows Terminal"
Write-Output "  - PowerShell"
Write-Output "  - Oh My Posh"
Write-Output "  - JetBrainsMono NF font (for oh-my-posh theme)"
Write-Output " "
Write-Output "They can be installed by running the full setups.ps1 script."
Write-Output " "
Write-Output "🏃 TERMINAL SETUP STARTING..."
Write-Output " "

& "$PSScriptRoot\windows-terminal\setup.ps1"
Write-Output " "
& "$PSScriptRoot\powershell\setup.ps1"
Write-Output " "
& "$PSScriptRoot\oh-my-posh\setup.ps1"

Write-Output " "
Write-Output "✅ TERMINAL SETUP COMPLETED SUCCESSFULLY!"
Write-Output " "