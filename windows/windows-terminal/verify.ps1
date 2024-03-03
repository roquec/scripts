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


$result = New-Object PSObject -Property @{
    Ok = $ok
}

$result