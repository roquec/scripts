#Oh My Posh config
oh-my-posh init pwsh | Invoke-Expression
oh-my-posh init pwsh --config "C:\github\scripts\oh-my-posh\theme-roquec.json" | Invoke-Expression

#Terminal Icons config
Import-Module -Name Terminal-Icons

#PSReadLine config
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete

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