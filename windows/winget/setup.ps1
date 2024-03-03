. "$PSScriptRoot\util.ps1"

$applications = Get-AppsToInstall

foreach ($application in $applications)
{
    $appName = $application.Name
    
    $elapsed = Measure-Command { winget install $appName --silent --no-upgrade --accept-package-agreements --accept-source-agreements > setup.log }
    if ($LASTEXITCODE -eq 0)
    {
        $minutes = $elapsed.Minutes
        $seconds = $elapsed.Seconds
        $milliseconds = $elapsed.Milliseconds
        Write-Host "+ $appName installed successfully in ${minutes}m ${seconds}s ${milliseconds}ms" -ForegroundColor Gray
    }
    elseif ($LASTEXITCODE -eq -1978335135) # 0x8A150061
    {
        Write-Host "- $appName already installed" -ForegroundColor Gray
    }
    else
    {
        Write-Error "x $appName failed to install! winget exit code $LASTEXITCODE"
    }
}