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

$summary_output = "## 📝 Windows setup app installation report"

foreach ($line in $lines)
{
    if($line.StartsWith("Name  "))
    {
        $foundHeader = $true
        $nameIndex = 0
        $nameLength = [regex]::Match( $line,'\bId\b' ).Index - 1
        $versionIdex = [regex]::Match( $line,'\bVersion\b' ).Index
        $versionLength = [regex]::Match( $line,'\bAvailable\b' ).Index - $versionIdex
    }

    if($line -and $foundHeader) 
    {
        $appToCheck = $false
        foreach ($app in $apps) {
            if ($line -like "*$app*") {
                $appToCheck = $true
                break # Exit the loop as soon as a match is found
            }
        }

        if($appToCheck) 
        {
            $name = $line.Substring($nameIndex, $nameLength).Trim()
            $version = $line.Substring($versionIdex, $versionLength).Trim()
            $message = "✅ app **$name** is installed with version **$version**"
        } 
        else
        {
            $message = "❌ app **$name** is not installed"
        }

        Write-Host $message
        $summary_output += "`n$message"
    }
}

$summary >> $summary_output

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