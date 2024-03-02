# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force;
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install programs
choco install git -y
choco install notepadplusplus -y
choco install 1password -y
choco install visualstudio2019community -y
choco install dotnetcore-sdk -y