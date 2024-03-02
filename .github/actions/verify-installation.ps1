$apps = @(
    "7zip.7zip"
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
    "VideoLAN.VLC"
    "AgileBits.1Password"
)

$appList = winget list

foreach ($appName in $apps)
{
    $appList = winget list | Select-String "$appName"

    if ($null -ne $appList) {
        foreach ($app in $appList) {
            # Extracts and cleans up the application name and version from the output
            $appDetails = $app -split '\s+', 0, 'TrimEmptyEntries'
            $installedAppName = $appDetails[0]
            $installedAppVersion = $appDetails[1]
            Write-Host "Application is installed: $installedAppName - Version: $installedAppVersion"
        }
    } else {
        Write-Host "Application '$appName' is not installed."
    }
}
