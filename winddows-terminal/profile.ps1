Import-Module posh-git
Import-Module oh-my-posh
Import-Module PSReadLine

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

Set-PoshPrompt -Theme zash
# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

function github
{
	cd C:\github
}

function edit($path)
{
    start notepad++ $path
}