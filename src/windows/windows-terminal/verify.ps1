param(
    [bool]$Output = $false
)

function Get-Result()
{
    $ok = $true

    $encoding = 'UTF8'
    $localAppData = $env:LOCALAPPDATA
    $searchPattern = "Microsoft.WindowsTerminal*\LocalState"
    $settingsDir = Get-ChildItem -Path "$localAppData\Packages" -Recurse | Where-Object { $_.FullName -like "*$searchPattern" } | Select-Object -First 1
    $settingsPath = Join-Path -Path $settingsDir.FullName -ChildPath "settings.json"

    if (Test-Path -Path $settingsPath) {

        $referenceSettings = Get-Content -Path "$PSScriptRoot\..\..\windows\windows-terminal\settings.json" -Encoding $encoding -Raw | ForEach-Object { $_ -replace "`r`n", "`n" }
        $settings = Get-Content -Path $settingsPath -Encoding $encoding -Raw | ForEach-Object { $_ -replace "`r`n", "`n" }

        if($settings -ne $referenceSettings)
        {
            $ok = $false
        }
    }

    $msg += "⚙️ Windows Terminal Settings:"
    if($ok)
    {
        $msg += "`n    + Windows Terminal settings are correct ✅"
    }
    else
    {
        $msg += "`n    - Windows Terminal settigns do not match reference ❌"
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