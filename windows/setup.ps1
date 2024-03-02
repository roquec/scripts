$apps = @(
    "JanDeDobbeleer.OhMyPosh"
    "Microsoft.WindowsTerminal"
    "7zip.7zip"
    "Git.Git"
    "Microsoft.DotNet.SDK.8"
    "Microsoft.NuGet"
    #"Microsoft.PowerToys"
    "Microsoft.RemoteDesktopClient"
    #"Microsoft.SQLServerManagementStudio"
    "Microsoft.VisualStudioCode"
    "Microsoft.VisualStudio.2022.Community"
    "Notepad++.Notepad++"
    "OpenJS.NodeJS"
    "VideoLAN.VLC"
    "AgileBits.1Password"
)

Write-Host "---------------------------------------" -ForegroundColor White
Write-Host "|  Installing applications via WinGet |" -ForegroundColor White
Write-Host "---------------------------------------" -ForegroundColor White
Write-Host " "

foreach ($appName in $apps)
{
    $elapsed = Measure-Command { winget install $appName --silent --no-upgrade --accept-package-agreements --accept-source-agreements > setup.log }
    if ($LASTEXITCODE -eq 0)
    {
        $minutes = $elapsed.Minutes
        $seconds = $elapsed.Seconds
        $milliseconds = $elapsed.Milliseconds
        Write-Host "+ $appName installed successfully in ${minutes}m ${seconds}s ${milliseconds}ms" -ForegroundColor Green
    }
    elseif ($LASTEXITCODE -eq -1978335135) # 0x8A150061
    {
        Write-Host "- $appName already installed" -ForegroundColor Yellow
    }
    else
    {
        Write-Error "x $appName failed to install! winget exit code $LASTEXITCODE"
    }
    Write-Host " "
}

Write-Host " "
Write-Host "---------------------------------------" -ForegroundColor White
Write-Host "|       Updating path variables       |" -ForegroundColor White
Write-Host "---------------------------------------" -ForegroundColor White
Write-Host " "
$Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
[Environment]::SetEnvironmentVariable("Path", $Path, "Process")
Write-Host "Path environment variable updated!" -ForegroundColor Green

Write-Host " "
Write-Host " "
Write-Host "---------------------------------------" -ForegroundColor White
Write-Host "|     Configuring Windows Terminal    |" -ForegroundColor White
Write-Host "---------------------------------------" -ForegroundColor White
Write-Host " "
$windowsTerminalSetup = $PSScriptRoot + "\windows-terminal\setup.ps1"
& $windowsTerminalSetup
Write-Host "Windows Terminal configured!" -ForegroundColor Green

Write-Host " "
Write-Host " "
Write-Host "---------------------------------------" -ForegroundColor White
Write-Host "|        Configuring PowerShell       |" -ForegroundColor White
Write-Host "---------------------------------------" -ForegroundColor White
Write-Host " "
$powershellSetup = $PSScriptRoot + "\powershell\setup.ps1"
& $powershellSetup
Write-Host "PowerShell configured!" -ForegroundColor Green

Write-Host " "
Write-Host " "
Write-Host "---------------------------------------" -ForegroundColor White
Write-Host "|      Installing Terminal Icons      |" -ForegroundColor White
Write-Host "---------------------------------------" -ForegroundColor White
Write-Host " "
$terminalIconsSetup = $PSScriptRoot + "\terminal-icons\setup.ps1"
& $terminalIconsSetup
Write-Host "Terminal Icons installed!" -ForegroundColor Green

Write-Host " "
Write-Host " "
Write-Host "---------------------------------------" -ForegroundColor White
Write-Host "|           Installing fonts          |" -ForegroundColor White
Write-Host "---------------------------------------" -ForegroundColor White
Write-Host " "
$fontsSetup = $PSScriptRoot + "\fonts\setup.ps1"
& $fontsSetup
Write-Host "Fonts installed!" -ForegroundColor Green


Write-Host " "
Write-Host " "
Write-Host "WINDOWS SETUP COMPLETED" -ForegroundColor White