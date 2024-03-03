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

# Execute winget list and capture the output
$wingetOutput = winget list | Out-String
# Split the output into lines
$lines = $wingetOutput -split "`n"

$summaryOutput = "## 📝 Windows setup app installation report"

foreach ($line in $lines)
{
    if($line.StartsWith("Name  "))
    {
        $contentLineStart = $lines.IndexOf($line) + 2
        $nameIndex = 0
        $nameLength = [regex]::Match( $line,'\bId\b' ).Index - 1
        $versionIdex = [regex]::Match( $line,'\bVersion\b' ).Index
        $versionLength = [regex]::Match( $line,'\bAvailable\b' ).Index - $versionIdex
        break
    }
}


$installedApps = $lines[$contentLineStart..($lines.Length - 1)]
foreach ($app in $apps)
{
    $isInstalled = $false
    foreach ($installedApp in $installedApps) {
        if ($installedApp -like "*$app*") {
            $isInstalled = $true
            $name = $installedApp.Substring($nameIndex, $nameLength).Trim()
            $version = $installedApp.Substring($versionIdex, $versionLength).Trim()
        }
    }

    if ($isInstalled) {
        $message = "✅ app **$name** is installed with version **$version**"
    }
    else
    {
        $message = "❌ app **$app** is not installed"
    }
    Write-Host $message
    $summaryOutput += "`n$message"
}

$summary >> $summaryOutput

<#
$appList = winget list

foreach ($appName in $apps)
{
    $versions = $appList | Select-String -pattern $appName -SimpleMatch

    if ($null -ne $versions) {
        foreach ($app in $versions) {
            # Extracts and cleans up the application name and version from the output
            $appDetails = $app -split '\s+', 0
            $installedAppName = $appDetails[0]
            $installedAppVersion = $appDetails[2]
            Write-Host "Application is installed: $installedAppName - Version: $installedAppVersion"
        }
    } else {
        Write-Host "Application '$appName' is not installed."
    }
}
#>