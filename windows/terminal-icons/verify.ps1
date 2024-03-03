param(
    [bool]$Output = $false
)

function Get-Result()
{
    $installed = Get-InstalledModule -Name Terminal-Icons -erroraction 'silentlycontinue'

    $msg += "📁 Terminal Icons Module:"
    if($installed)
    {
        $ok = $true
        $msg += "`n    + OK: Terminal-Icons module is installed ✅"
    }
    else
    {
        $ok = $false
        $msg += "`n    - Error: Terminal-Icons module is not installed ❌"
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