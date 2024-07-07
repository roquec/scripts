Write-Output "🪟 Configuring Windows..."

Set-ItemProperty -Path "HKCU:\Software\Microsoft\Clipboard" -Name "EnableClipboardHistory" -Value 1

Write-Output "    + Clipboard history enabled ✅"

wsl --install | Out-Null

Write-Output "    + WSL installed ✅"