$ok = $true

$encoding = 'UTF8'
$profilePath = [Environment]::GetFolderPath([Environment+SpecialFolder]::MyDocuments) + "\PowerShell\Microsoft.PowerShell_profile.ps1"

if (Test-Path -Path $profilePath) {
    
    $referenceProfile = Get-Content -Path "$PSScriptRoot\..\..\windows\powershell\profile.ps1" -Encoding $encoding -Raw | ForEach-Object { $_ -replace "`r`n", "`n" }
    $pwshProfile = Get-Content -Path $profilePath -Encoding $encoding -Raw | ForEach-Object { $_ -replace "`r`n", "`n" }

    if($pwshProfile -ne $referenceProfile)
    {
        $ok = $false
    }
}

$result = New-Object PSObject -Property @{
    Ok = $ok
}

$result