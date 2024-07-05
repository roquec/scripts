param(
    [bool]$Output = $false
)

function Get-Result()
{
    $winget = & "$PSScriptRoot\winget\verify.ps1" -Output $true
    $fonts = & "$PSScriptRoot\fonts\verify.ps1" -Output $true
    $windowsTerminal = & "$PSScriptRoot\windows-terminal\verify.ps1" -Output $true
    $powershell = & "$PSScriptRoot\powershell\verify.ps1" -Output $true
    $ohMyPosh = & "$PSScriptRoot\oh-my-posh\verify.ps1" -Output $true
    $windowsConfig =  & "$PSScriptRoot\configuration\verify.ps1" -Output $true
    
    $ok = ($winget.Ok -and $fonts.Ok -and $windowsTerminal.Ok -and $powershell.Ok -and $ohMyPosh.Ok -and $windowsConfig.Ok)
    $msg = $winget.Msg + "`n`n" + $fonts.Msg + "`n`n" + $windowsTerminal.Msg + "`n`n" + $powershell.Msg + "`n`n" + $ohMyPosh.Msg + "`n`n" + $windowsConfig.Msg
    
    $result = New-Object PSObject -Property @{
        Ok = $ok
        Winget = $winget
        Fonts = $fonts
        WindowsTerminal = $windowsTerminal
        PowerShell = $powershell
        OhMyPosh = $ohMyPosh
        WindowsConfig = $windowsConfig
        Msg = $msg
    }
    $result | Add-Member -MemberType ScriptMethod -Name ToString -Force -Value {return "$($this.Msg)"}

    return $result
}

if($Output) {
    Write-Output (Get-Result)
} else {
    Write-Output (Get-Result).Msg
}