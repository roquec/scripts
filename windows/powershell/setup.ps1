# Paths
$referenceProfilePath = "$PSScriptRoot\profile.ps1"
$profilePath = [Environment]::GetFolderPath([Environment+SpecialFolder]::MyDocuments) + "\PowerShell\profile.ps1"

# Check if the directory exists
$profileDir = Split-Path -Path $profilePath
if (-not (Test-Path -Path $profileDir)) {
    New-Item -Path $profileDir -ItemType Directory
}

# Overwrite current profile with reference
Copy-Item -Path $referenceProfilePath -Destination $profilePath -Force
