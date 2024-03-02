# Check Windows Terminal
$localAppData = $env:LOCALAPPDATA
$searchPattern = "Microsoft.WindowsTerminal*\LocalState"
$settingsDir = Get-ChildItem -Path "$localAppData\Packages" -Recurse | Where-Object { $_.FullName -like "*$searchPattern" } | Select-Object -First 1
$settingsPath = Join-Path -Path $settingsDir.FullName -ChildPath "settings.json"

if (-not (Test-Path -Path $settingsPath)) {
    Write-Error "Windows Terminal settings not found."
}

$referenceSettings = Get-Content -Path ".\windows\windows-terminal\settings.json" -Raw | ConvertFrom-Json
$settings = Get-Content -Path $settingsPath -Raw | ConvertFrom-Json

if($settings -ne $referenceSettings)
{
    Write-Error "Windows Terminal settings does not match reference."
}


# Check PowerShell
$profilePath = $PROFILE
if (-not (Test-Path -Path $profilePath)) {
    Write-Error "PowerShell profile not found."
}

$referenceProfile = Get-Content -Path ".\windows\powershell\profile.ps1" -Raw | ConvertFrom-Json
$pwshProfile = Get-Content -Path $profilePath -Raw | ConvertFrom-Json

if($pwshProfile -ne $referenceProfile)
{
    Write-Error "PowerShell profile does not match reference."
}