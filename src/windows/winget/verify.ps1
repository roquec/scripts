param(
    [bool]$Output = $false
)

function Get-Result()
{
    . "$PSScriptRoot\util.ps1"

    $applications = Get-AppsToInstall

    $wingetOutput = winget list | Out-String
    $lines = $wingetOutput -split "`n"

    # Get index positions from header
    foreach ($line in $lines)
    {
        if($line.StartsWith("Name  "))
        {
            $contentLineStart = $lines.IndexOf($line) + 2
            $versionIdex = [regex]::Match( $line,'\bVersion\b' ).Index
            $versionLength = [regex]::Match( $line,'\bAvailable\b' ).Index - $versionIdex
            break
        }
    }

    $wingetApps = $lines[$contentLineStart..($lines.Length - 2)]


    $appResults = @()

    $ok = $true

    foreach ($app in $applications)
    {
        $appId = $app.Id
        $appName = $app.Name

        $isInstalled = $false
        foreach ($wingetApp in $wingetApps) {
            if ($wingetApp -like "*$appId*" -or $wingetApp -like "*$appName*") {
                $isInstalled = $true
                $version = $wingetApp.Substring($versionIdex, $versionLength).Trim()
            }
        }

        $status = New-Object PSObject -Property @{
            App = $appId
            Version = $version
            Ok = $isInstalled
        }

        $appResults += $status

        if(-not $isInstalled)
        {
            $ok = $false
        }
    }

    $msg += "🖥️ Application Installation:"
    foreach ($appResult in $appResults)
    {
        if($appResult.Ok)
        {
            $msg += "`n    + $($appResult.App) is installed with version $($appResult.Version) ✅"
        }
        else
        {
            $msg += "`n    - $($appResult.App) is not installed ❌"
        }
    }

    $result = New-Object PSObject -Property @{
        Ok = $ok
        Apps = $appResults
        Msg = $msg
    }
    $result | Add-Member -MemberType ScriptMethod -Name ToString -Force -Value {return "$($this.Msg)"}

    return $result
}

if($Output) {
    Write-Output (Get-Result)
} else {
    Write-Output (Get-Result).Msg
}