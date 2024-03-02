$ProgressColor = [System.ConsoleColor]::Gray

Write-Host -NoNewLine "🚀 PowerShell" -ForegroundColor $ProgressColor

# Get the current PowerShell version
$Version = $PSVersionTable.PSVersion
Write-Host -NoNewLine " ($Version) ." -ForegroundColor $ProgressColor

#Oh My Posh config
oh-my-posh init pwsh | Invoke-Expression
oh-my-posh init pwsh --config "C:\github\scripts\oh-my-posh\theme-roquec.json" | Invoke-Expression
Write-Host -NoNewLine "." -ForegroundColor $ProgressColor

#Terminal Icons config
Import-Module -Name Terminal-Icons
Write-Host -NoNewLine "." -ForegroundColor $ProgressColor

#PSReadLine config
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete
Write-Host -NoNewLine "." -ForegroundColor $ProgressColor

#Custom actions
function clr
{
    clear
}

function edit($path)
{
    start notepad++ $path
}

function open($path)
{
    cd $path
    ii .
}

function github
{
	cd C:\github
}

function naos
{
    cd C:\github\naos
}

Write-Host -NoNewLine "." -ForegroundColor $ProgressColor

# Move cursor to start so initial prompt overwrites loading text
[Console]::SetCursorPosition(0, 0)