function Get-AppsToInstall 
{
    $csvPath = "$PSScriptRoot\apps.csv"

    $applications = Import-Csv -Path $csvPath | ForEach-Object {
        $name = if ([string]::IsNullOrWhiteSpace($_.Name)) { $_.Id } else { $_.Name }
    
        New-Object PSObject -Property @{
            Id = $_.Id
            Name = $name
            Version = $_.Version
        }
    }

    return $applications
}