$fontsFolder = (New-Object -ComObject Shell.Application).Namespace(0x14)

Write-Output "Installing fonts in $fontsFolder"

foreach ($file in Get-ChildItem -Path "$PSScriptRoot\*.ttf")
{
    $fileName = $file.Name

    Write-Output "Found font to install: $fileName"

    if (-not(Test-Path -Path "C:\Windows\fonts\$fileName" )) {
        Write-Output "Installing font: $fileName"
        Get-ChildItem $file | ForEach-Object { $fontsFolder.CopyHere($_.fullname) }
        Write-Output "Installed font: $fileName"
    }
}