Write-Output "🖥️ Installing applications..."

. "$PSScriptRoot\util.ps1"

$applications = Get-AppsToInstall

foreach ($application in $applications)
{
    $appVersion = $application.Version
    if($appVersion)
    {
        $versionArg = "--version $appVersion"
    }

    $appName = $application.Name
    
    $elapsed = Measure-Command { winget install $appName $versionArg --silent --no-upgrade --accept-package-agreements --accept-source-agreements > setup.log }
    if ($LASTEXITCODE -eq 0)
    {
        $minutes = $elapsed.Minutes
        $seconds = $elapsed.Seconds
        $milliseconds = $elapsed.Milliseconds
        
        Write-Output "    + $appName installed successfully in ${minutes}m ${seconds}s ${milliseconds}ms ✅"
    }
    elseif ($LASTEXITCODE -eq -1978335135) # 0x8A150061
    {
        Write-Output "    - $appName already installed ⚠️"
    }
    else
    {
        Write-Output "    x $appName failed to install! winget exit code $LASTEXITCODE ❌"
    }
}