$ok = $true

$encoding = 'UTF8'
$themePath = [Environment]::GetFolderPath([Environment+SpecialFolder]::MyDocuments) + "\PowerShell\theme.json"

if (Test-Path -Path $themePath) {
    
    $referenceTheme = Get-Content -Path "$PSScriptRoot\..\..\windows\oh-my-posh\theme.json" -Encoding $encoding -Raw | ForEach-Object { $_ -replace "`r`n", "`n" }
    $ohmyposhTheme = Get-Content -Path $themePath -Encoding $encoding -Raw | ForEach-Object { $_ -replace "`r`n", "`n" }

    if($ohmyposhTheme -ne $referenceTheme)
    {
        $ok = $false
    }
}

$result = New-Object PSObject -Property @{
    Ok = $ok
}

$result