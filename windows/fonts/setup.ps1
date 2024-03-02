$fontsFolder = (New-Object -ComObject Shell.Application).Namespace(0x14)

foreach ($file in Get-ChildItem -Path "$PSScriptRoot\*.ttf")
{
    $fileName = $file.Name
    if (-not(Test-Path -Path "C:\Windows\fonts\$fileName" )) {
        Get-ChildItem $file | ForEach-Object { $fontsFolder.CopyHere($_.fullname) }
        Write-Host "Installed font: $fileName" -ForegroundColor Gray
    }
}