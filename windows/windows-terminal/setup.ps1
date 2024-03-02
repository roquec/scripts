# Path to the reference settings.json file
$referenceSettingsPath = "$PSScriptRoot\settings.json"

# Get the base LocalAppData folder
$localAppData = $env:LOCALAPPDATA

# Construct a search pattern to find the Windows Terminal settings.json file
$searchPattern = "Microsoft.WindowsTerminal*\LocalState"

# Find the directory that should contain the settings.json file
$settingsDir = Get-ChildItem -Path "$localAppData\Packages" -Recurse | Where-Object { $_.FullName -like "*$searchPattern" } | Select-Object -First 1
$settingsPath = Join-Path -Path $settingsDir.FullName -ChildPath "settings.json"

Write-Output $localAppData
Write-Output $settingsDir
Write-Output $settingsPath


if (-not ($settingsDir -and (Test-Path -Path $settingsDir))) {
    Write-Error "Windows Terminal LocalState directory not found. $settingsDir"
}

# Overwrite current settings with reference
Copy-Item -Path $referenceSettingsPath -Destination $settingsPath -Force
