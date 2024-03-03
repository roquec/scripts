$fontResults = @()
$ok = $true

[System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") | Out-Null
$installedFonts = (New-Object System.Drawing.Text.InstalledFontCollection).Families

foreach ($file in Get-ChildItem -Path "$PSScriptRoot\*.ttf")
{
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

    $fontResult = New-Object PSObject -Property @{
        Font = $fontName
        Ok = $isInstalled
    }

    $fontResults += $fontResult

    if(-not $isInstalled)
    {
        $ok = $false
    }
}


$result = New-Object PSObject -Property @{
    Ok = $ok
    Fonts = $fontResults
}

$result