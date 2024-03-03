param(
    [bool]$Output = $false
)

function Get-Result()
{
    $ok = $true

    $encoding = 'UTF8'
    $themePath = [Environment]::GetFolderPath([Environment+SpecialFolder]::MyDocuments) + "\PowerShell\theme.json"

    if (Test-Path -Path $themePath) {
        
        $referenceTheme = Get-Content -Path "$PSScriptRoot\..\..\windows\oh-my-posh\theme.json" -Encoding $encoding -Raw | ForEach-Object { $_ -replace "`r`n", "`n" }
        $ohmyposhTheme = Get-Content -Path $themePath -Encoding $encoding -Raw | ForEach-Object { $_ -replace "`r`n", "`n" }

        if($ohmyposhTheme -ne $referenceTheme)
        {
            $ok = $false
        }
    }

    $msg += "🎨 Oh My Posh Theme:"
    if($ok)
    {
        $msg += "`n    + Oh My Posh theme is correct ✅"
    }
    else
    {
        $msg += "`n    - Oh My Posh theme does not match reference ❌"
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