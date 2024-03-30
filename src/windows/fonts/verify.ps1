param(
    [bool]$Output = $false
)

function Get-Result()
{
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

    $msg += "✒️ Font Installation:"
    foreach ($fontResult in $fontResults)
    {
        if($fontResult.Ok)
        {
            $msg += "`n    + $($fontResult.Font) is installed ✅"
        }
        else
        {
            $msg += "`n    - $($fontResult.Font) is not installed ❌"
        }
    }

    $result = New-Object PSObject -Property @{
        Ok = $ok
        Fonts = $fontResults
        Msg = $msg
    }
    $result | Add-Member -MemberType ScriptMethod -Name ToString -Force -Value {return "$($this.Msg)"}

    return $result
}

if($Output) {
    Write-Output (Get-Result)
} else {
    Write-Output (Get-Result).Msg
}