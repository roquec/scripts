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

$msg += "✒️ Application Installation:"
foreach ($fontResult in $fontResults)
{
    if($fontResult.Ok)
    {
        $msg += "`n    + Font [$($fontResult.Font)] is installed ✅"
    }
    else
    {
        $msg += "`n    - Font [$($fontResult.Font)] is not installed ❌"
    }
}

$result = New-Object PSObject -Property @{
    Ok = $ok
    Fonts = $fontResults
    Msg = $msg
}
$result | Add-Member -MemberType ScriptMethod -Name ToString -Force -Value {return "$($this.Msg)"}

$result