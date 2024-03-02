Write-Output "Installing applications via WinGet"

$InstallApps = @(
    <#"7zip.7zip"
    "Git.Git"
    "Microsoft.DotNet.SDK.8"
    "Microsoft.NuGet"
    "Microsoft.PowerShell"
    "Microsoft.PowerToys"
    "Microsoft.RemoteDesktopClient"
    "Microsoft.SQLServerManagementStudio"
    "Microsoft.VisualStudioCode"
    "Microsoft.VisualStudio.2022.Community"
    "Microsoft.WindowsTerminal"
    "Notepad++.Notepad++"
    "OpenJS.NodeJS"
    "VideoLAN.VLC" #>
    "AgileBits.1Password"
)

foreach ($appName in $InstallApps)
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
