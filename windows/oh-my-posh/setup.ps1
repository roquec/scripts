Write-Output "🎨 Configuring Oh My Posh theme..."

# Paths
$referenceProfilePath = "$PSScriptRoot\theme.json"

Write-Output "    + Found reference theme.json file ✅"

$profilePath = [Environment]::GetFolderPath([Environment+SpecialFolder]::MyDocuments) + "\PowerShell\theme.json"

# Check if the directory exists
$profileDir = Split-Path -Path $profilePath
if (-not (Test-Path -Path $profileDir)) {
    New-Item -Path $profileDir -ItemType Directory | Out-Null
}

Write-Output "    + Copying reference theme file to destination ✅"

# Overwrite current profile with reference
Copy-Item -Path $referenceProfilePath -Destination $profilePath -Force

Write-Output "    + Oh My Posh theme configured ✅"