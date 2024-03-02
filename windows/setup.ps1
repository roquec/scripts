Write-Output "Installing applications via WinGet"

$apps = @(
    "Microsoft.PowerShell"
    "JanDeDobbeleer.OhMyPosh"
    "Microsoft.WindowsTerminal"
    "7zip.7zip"
    "Git.Git"
    "Microsoft.DotNet.SDK.8"
    "Microsoft.NuGet"
    "Microsoft.PowerToys"
    "Microsoft.RemoteDesktopClient"
    "Microsoft.SQLServerManagementStudio"
    "Microsoft.VisualStudioCode"
    "Microsoft.VisualStudio.2022.Community"
    "Notepad++.Notepad++"
    "OpenJS.NodeJS"
    "VideoLAN.VLC"
    "AgileBits.1Password"
)

foreach ($appName in $apps)
{
    Write-Output "Installing $appName"
    winget install $appName --silent --no-upgrade --accept-package-agreements --accept-source-agreements > setup.log
    if ($LASTEXITCODE -eq 0)
    {
        Write-Output "$appName installed successfully"
    }
    # 0x8A150061 (APPINSTALLER_CLI_ERROR_PACKAGE_ALREADY_INSTALLED)
    elseif ($LASTEXITCODE -eq -1978335135)
    {
        Write-Output "$appName already installed"
    }
    else
    {
        Write-Error "$appName failed to install! winget exit code $LASTEXITCODE"
    }
}

# Update path variable after the installations
Write-Output "Updating path variable"
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

Write-Output "Configuring Windows Terminal"
& $PSScriptRoot + "\windows-terminal\setup.ps1"

Write-Output "Configuring PowerShell"
& $PSScriptRoot + "\powershell\setup.ps1"

Write-Output "Installing fonts"
& $PSScriptRoot + "\fonts\setup.ps1"