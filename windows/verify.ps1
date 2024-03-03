$winget = Invoke-Expression -Command "$PSScriptRoot\winget\verify.ps1"
$fonts = Invoke-Expression -Command "$PSScriptRoot\fonts\verify.ps1"
$windowsTerminal = Invoke-Expression -Command "$PSScriptRoot\windows-terminal\verify.ps1"
$powershell = Invoke-Expression -Command "$PSScriptRoot\powershell\verify.ps1"
$ohMyPosh = Invoke-Expression -Command "$PSScriptRoot\oh-my-posh\verify.ps1"
$terminalIcons = Invoke-Expression -Command "$PSScriptRoot\terminal-icons\verify.ps1"

$ok = ($winget.Ok -and $fonts.Ok -and $windowsTerminal.Ok -and $powershell.Ok -and $ohMyPosh.Ok -and $terminalIcons.Ok)
$msg = $winget.Msg + "`n`n" + $fonts.Msg + "`n`n" + $windowsTerminal.Msg + "`n`n" + $powershell.Msg + "`n`n" + $ohMyPosh.Msg + "`n`n" + $terminalIcons.Msg

$result = New-Object PSObject -Property @{
    Ok = $ok
    Winget = $winget
    Fonts = $fonts
    WindowsTerminal = $windowsTerminal
    PowerShell = $powershell
    OhMyPosh = $ohMyPosh
    TerminalIcons = $terminalIcons
    Msg = $msg
}
$result | Add-Member -MemberType ScriptMethod -Name ToString -Force -Value {return "$($this.Msg)"}

$result