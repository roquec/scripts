$encoding = 'UTF8'

$summary_output = "## 📝 Windows setup app configuration report"

# Check Windows Terminal
$summary_output += "`n### ⚙️ Windows Terminal"
Write-Output "Verifying Windows Terminal configuration..."

$localAppData = $env:LOCALAPPDATA
$searchPattern = "Microsoft.WindowsTerminal*\LocalState"
$settingsDir = Get-ChildItem -Path "$localAppData\Packages" -Recurse | Where-Object { $_.FullName -like "*$searchPattern" } | Select-Object -First 1
$settingsPath = Join-Path -Path $settingsDir.FullName -ChildPath "settings.json"

if (-not (Test-Path -Path $settingsPath)) {
    Write-Error "Windows Terminal settings not found."
}

$referenceSettings = Get-Content -Path "$PSScriptRoot\..\..\windows\windows-terminal\settings.json" -Encoding $encoding -Raw | ForEach-Object { $_ -replace "`r`n", "`n" }
$settings = Get-Content -Path $settingsPath -Encoding $encoding -Raw | ForEach-Object { $_ -replace "`r`n", "`n" }

if($settings -ne $referenceSettings)
{
    $message = "❌ Windows Terminal is not properly configured"
}
else
{
    $message = "✅ Windows Terminal configuration is OK"
}

Write-Host $message
$summary_output += "`n$message"


# Check PowerShell
$summary_output += "`n### ⚙️ PowerShell"
Write-Output "Verifying PowerShell configuration..."


$profilePath = [Environment]::GetFolderPath([Environment+SpecialFolder]::MyDocuments) + "\PowerShell\Microsoft.PowerShell_profile.ps1"
if (-not (Test-Path -Path $profilePath)) {
    Write-Error "PowerShell profile not found."
}

$referenceProfile = Get-Content -Path "$PSScriptRoot\..\..\windows\powershell\profile.ps1" -Encoding $encoding -Raw | ForEach-Object { $_ -replace "`r`n", "`n" }
$pwshProfile = Get-Content -Path $profilePath -Encoding $encoding -Raw | ForEach-Object { $_ -replace "`r`n", "`n" }


if($pwshProfile -ne $referenceProfile)
{
    $message = "❌ PowerShell is not properly configured"
}
else
{
    $message = "✅ PowerShell configuration is OK"
}

Write-Host $message
$summary_output += "`n$message"


$summary >> $summary_output