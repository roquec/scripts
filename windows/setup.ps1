Write-Output "Installing applications via WinGet"

$apps = @(
    "Microsoft.PowerShell"
    "JanDeDobbeleer.OhMyPosh"
    "Microsoft.WindowsTerminal"
    <#
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
    #>
)

foreach ($appName in $apps)
{
    $elapsed = Measure-Command { winget install $appName --silent --no-upgrade --accept-package-agreements --accept-source-agreements > setup.log }
    if ($LASTEXITCODE -eq 0)
    {
        $minutes = $elapsed.Minutes
        $seconds = $elapsed.Seconds
        $milliseconds = $elapsed.Milliseconds
        Write-Output "$appName installed successfully in ${minutes}m ${seconds}s ${milliseconds}ms"
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
$Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
[Environment]::SetEnvironmentVariable("Path", $Path, "Process")
$env:Path += ";C:\Users\user\AppData\Local\Programs\oh-my-posh\bin"

Write-Output $env:Path

Write-Output "Configuring Windows Terminal"
$windowsTerminalSetup = $PSScriptRoot + "\windows-terminal\setup.ps1"
& $windowsTerminalSetup

Write-Output "Configuring PowerShell"
$powershellSetup = $PSScriptRoot + "\powershell\setup.ps1"
& $powershellSetup

Write-Output "Configuring Terminal Icons"
$terminalIconsSetup = $PSScriptRoot + "\terminal-icons\setup.ps1"
& $terminalIconsSetup

Write-Output "Installing fonts"
$fontsSetup = $PSScriptRoot + "\powershell\setup.ps1"
& $fontsSetup