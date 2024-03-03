$encoding = 'UTF8'

$summary = "## 📝 Windows setup app configuration report"

# Check Windows Terminal
$summary += "`n### ⚙️ Windows Terminal"
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
$summary += "`n$message"


# Check PowerShell
$summary += "`n### ⚙️ PowerShell"
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
$summary += "`n$message"


# Check PowerShell
$summary += "`n### ⚙️ Oh My Posh"
Write-Output "Verifying Oh My Posh configuration..."

$themePath = [Environment]::GetFolderPath([Environment+SpecialFolder]::MyDocuments) + "\PowerShell\theme.json"
if (-not (Test-Path -Path $profilePath)) {
    Write-Error "Oh My Posh profile not found."
}
$referenceTheme = Get-Content -Path "$PSScriptRoot\..\..\windows\oh-my-posh\theme.json" -Encoding $encoding -Raw | ForEach-Object { $_ -replace "`r`n", "`n" }
$ohmyposhTheme = Get-Content -Path $themePath -Encoding $encoding -Raw | ForEach-Object { $_ -replace "`r`n", "`n" }

if($ohmyposhTheme -ne $referenceTheme)
{
    $message = "❌ Oh My Posh is not properly configured"
}
else
{
    $message = "✅ Oh My Posh configuration is OK"
}

Write-Host $message
$summary += "`n$message"


$summary >> $env:GITHUB_STEP_SUMMARY