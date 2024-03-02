$TempDir = "$env:TEMP\windows-setup"
Remove-Item $TempDir -Recurse -Force -ErrorAction SilentlyContinue
New-Item -Path $TempDir -ItemType Directory > $null
$ZipPath = "$TempDir\bundle.zip"
$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest -Uri https://github.com/roquec/scripts/archive/refs/heads/main.zip -OutFile $ZipPath
$ProgressPreference = 'Continue'
Expand-Archive -LiteralPath $ZipPath -DestinationPath $TempDir
$setupScript = "$TempDir\scripts-main\windows\setup.ps1"
#& $SetupScript @args
#Remove-Item $TempDir -Recurse -Force