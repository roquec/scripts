Write-Output "✒️ Installing fonts..."

$fontsFolder = (New-Object -ComObject Shell.Application).Namespace(0x14)

[System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") | Out-Null
$installedFonts = (New-Object System.Drawing.Text.InstalledFontCollection).Families

foreach ($file in Get-ChildItem -Path "$PSScriptRoot\*.ttf")
{
    $fileName = $file.Name
    $fontName = $file.BaseName

    $isInstalled = $false
    foreach($installedFont in $installedFonts)
    {
        if($installedFont.Name -eq $fontName)
        {
            $isInstalled = $true
            break
        }
    }

    if (-not( Test-Path -Path "C:\Windows\fonts\$fileName") -and -not($isInstalled)) {
        Get-ChildItem $file | ForEach-Object { $fontsFolder.CopyHere($_.fullname) }
        Write-Output "    + $fileName installed successfully ✅"
    } 
    else 
    {
        Write-Output "    - $fileName already installed ⚠️"
    }
}