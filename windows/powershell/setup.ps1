Write-Output "🚀 Configuring PowerShell..."

$modulesOk = Get-InstalledModule -Name Terminal-Icons -erroraction 'silentlycontinue'
if($modulesOk)
{
    Write-Output "    - Terminal-Icons module already installed 🟡"
}
else
{
    Install-Module -Name Terminal-Icons -Repository PSGallery -Force
    Write-Output "    + Terminal-Icons module installed successfully ✅"
}

# Paths
$referenceProfilePath = "$PSScriptRoot\profile.ps1"

Write-Output "    + Found reference profile.ps1 file ✅"

$profilePath = [Environment]::GetFolderPath([Environment+SpecialFolder]::MyDocuments) + "\PowerShell\Microsoft.PowerShell_profile.ps1"

# Check if the directory exists
$profileDir = Split-Path -Path $profilePath
if (-not (Test-Path -Path $profileDir)) {
    New-Item -Path $profileDir -ItemType Directory | Out-Null
}

Write-Output "    + Copying reference profile file to destination ✅"

# Overwrite current profile with reference
Copy-Item -Path $referenceProfilePath -Destination $profilePath -Force

Write-Output "    + PowerShell profile configured ✅"