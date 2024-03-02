# Check Windows Terminal
Write-Output "Verifying Windows Terminal configuration..."

$localAppData = $env:LOCALAPPDATA
$searchPattern = "Microsoft.WindowsTerminal*\LocalState"
$settingsDir = Get-ChildItem -Path "$localAppData\Packages" -Recurse | Where-Object { $_.FullName -like "*$searchPattern" } | Select-Object -First 1
$settingsPath = Join-Path -Path $settingsDir.FullName -ChildPath "settings.json"

if (-not (Test-Path -Path $settingsPath)) {
    Write-Error "Windows Terminal settings not found."
}

$referenceSettings = Get-Content -Path "$PSScriptRoot\..\..\windows\windows-terminal\settings.json" | ConvertFrom-Json
$settings = Get-Content -Path $settingsPath | ConvertFrom-Json

if(Compare-Object -ReferenceObject $referenceSettings -DifferenceObject $settings)
{
    Write-Error "Windows Terminal settings does not match reference."
}
else
{
    Write-Output "Windows Terminal configuration is OK"
}


# Check PowerShell
Write-Output "Verifying PowerShell configuration..."

$encoding = 'UTF8'

$profilePath = [Environment]::GetFolderPath([Environment+SpecialFolder]::MyDocuments) + "\PowerShell\Microsoft.PowerShell_profile.ps1"
if (-not (Test-Path -Path $profilePath)) {
    Write-Error "PowerShell profile not found."
}

$referenceProfile = Get-Content -Path "$PSScriptRoot\..\..\windows\powershell\profile.ps1" -Encoding $encoding -Raw
$pwshProfile = Get-Content -Path $profilePath -Encoding $encoding -Raw

if($pwshProfile -ne $referenceProfile)
{
    Write-Error "PowerShell profile does not match reference."
}
else
{
    Write-Output "PowerShell configuration is OK"
}