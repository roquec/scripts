# Paths
$referenceProfilePath = "$PSScriptRoot\profile.ps1"
$profilePath = $PROFILE

# Check if the directory exists
$profileDir = Split-Path -Path $profilePath
if (-not (Test-Path -Path $profileDir)) {
    Write-Error "PowerShell directory not found in [$profileDir]."
}

# Overwrite current profile with reference
Copy-Item -Path $referenceProfilePath -Destination $profilePath -Force
