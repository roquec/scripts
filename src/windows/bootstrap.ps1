$TempDir = "$env:TEMP\windows-setup"
Remove-Item $TempDir -Recurse -Force -ErrorAction SilentlyContinue
New-Item -Path $TempDir -ItemType Directory > $null
$ZipPath = "$TempDir\bundle.zip"
$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest -Uri https://github.com/roquec/scripts/archive/refs/heads/main.zip -OutFile $ZipPath
$ProgressPreference = 'Continue'
Expand-Archive -LiteralPath $ZipPath -DestinationPath $TempDir

winget install -e --id Microsoft.PowerShell --accept-package-agreements --accept-source-agreements > setup.log

$Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
[Environment]::SetEnvironmentVariable("Path", $Path, "Process")

$setupScript = "$TempDir\scripts-main\src\windows\setup.ps1"
pwsh -File  $SetupScript

Remove-Item $TempDir -Recurse -Force