$progressColor = [System.ConsoleColor]::Gray

Write-Host -NoNewLine "🚀 PowerShell" -ForegroundColor $progressColor

# Get the current PowerShell version
$Version = $PSVersionTable.PSVersion
Write-Host -NoNewLine " ($Version) ." -ForegroundColor $progressColor

#Oh My Posh config
oh-my-posh init pwsh --config "C:\github\scripts\windows\oh-my-posh\theme-roquec.json" | Invoke-Expression
Write-Host -NoNewLine "." -ForegroundColor $progressColor

#Terminal Icons config
Import-Module -Name Terminal-Icons
Write-Host -NoNewLine "." -ForegroundColor $progressColor

#PSReadLine config
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete
Write-Host -NoNewLine "." -ForegroundColor $progressColor

#Custom actions
function clr
{
    Clear-Host
}

function edit($path)
{
    Start-Process notepad++ $path
}

function open($path)
{
    Set-Location $path
    Invoke-Item .
}

function github
{
	Set-Location C:\github
}
Write-Host -NoNewLine "." -ForegroundColor $progressColor

# Move cursor to start so initial prompt overwrites loading text
[Console]::SetCursorPosition(0, 0)