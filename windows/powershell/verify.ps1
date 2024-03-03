param(
    [bool]$Output = $false
)

function Get-Result()
{
    $msg += "🚀 PowerShell configuration:"

    $modulesOk = Get-InstalledModule -Name Terminal-Icons -erroraction 'silentlycontinue'
    if($modulesOk)
    {
        $msg += "`n    + OK: All modules installed ✅"
    }
    else
    {
        $msg += "`n    - Error: Missing modules ❌"
    }

    $profileOk = $true
    $encoding = 'UTF8'
    $profilePath = [Environment]::GetFolderPath([Environment+SpecialFolder]::MyDocuments) + "\PowerShell\Microsoft.PowerShell_profile.ps1"
    if (Test-Path -Path $profilePath) {
        
        $referenceProfile = Get-Content -Path "$PSScriptRoot\..\..\windows\powershell\profile.ps1" -Encoding $encoding -Raw | ForEach-Object { $_ -replace "`r`n", "`n" }
        $pwshProfile = Get-Content -Path $profilePath -Encoding $encoding -Raw | ForEach-Object { $_ -replace "`r`n", "`n" }

        if($pwshProfile -ne $referenceProfile)
        {
            $profileOk = $false
        }
    }

    if($profileOk -and $modulesOk)
    {
        $msg += "`n    + PowerShell profile is correct ✅"
        $ok = $true
    }
    else
    {
        $msg += "`n    - PowerShell profile does not match reference ❌"
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