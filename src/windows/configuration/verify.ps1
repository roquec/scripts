param(
    [bool]$Output = $false
)

function Get-Result()
{
    $ok = $true

    $clipboardHistory = (Get-ItemProperty -Path "HKCU:\Software\Microsoft\Clipboard" -Name "EnableClipboardHistory").EnableClipboardHistory

    $msg += "🪟 Windows configuration..."

    if($clipboardHistory)
    {
        $msg += "`n    + Clipboard history is enabled ✅"
    }
    else
    {
        $msg += "`n    - Clipboard history is not enabled ❌"
        $ok = $false
    }

    $wslStatus = wsl --status

    if($wslStatus)
    {
        $msg += "`n    + WSL is installed ✅"
    }
    else
    {
        $msg += "`n    - WSL is not installed ❌"
        $ok = $false
    }


    $result = New-Object PSObject -Property @{
        Ok = $ok
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