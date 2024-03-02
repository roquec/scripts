mkdir c:\github

$progressPreference = 'silentlyContinue'
Write-Information "Downloading WinGet and its dependencies..."
Invoke-WebRequest -Uri https://aka.ms/getwinget -OutFile Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -OutFile Microsoft.VCLibs.x64.14.00.Desktop.appx
Invoke-WebRequest -Uri https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/Microsoft.UI.Xaml.2.8.x64.appx -OutFile Microsoft.UI.Xaml.2.8.x64.appx
Add-AppxPackage Microsoft.VCLibs.x64.14.00.Desktop.appx
Add-AppxPackage Microsoft.UI.Xaml.2.8.x64.appx
Add-AppxPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle

winget install --id=Git.Git -e --accept-package-agreements --accept-source-agreements
winget install --id=Microsoft.VisualStudioCode -e  
winget install --id=AgileBits.1Password -e
winget install --id=7zip.7zip -e 
winget install --id=Docker.DockerDesktop -e 
winget install --id=BlastApps.FluentSearch -e  
winget install --id=Google.Chrome -e  
winget install --id=LINQPad.LINQPad.7 -e   
winget install --id=Microsoft.dotnet -e  
winget install --id=JanDeDobbeleer.OhMyPosh -e  
winget install --id=Microsoft.PowerAutomateDesktop -e  
winget install --id=Microsoft.PowerShell -e  
winget install --id=Microsoft.PowerToys -e  
winget install --id=VideoLAN.VLC -e  
winget install --id=WhatsApp.WhatsApp -e