$results = Invoke-Expression -Command "$PSScriptRoot\..\..\windows\winget\verify.ps1"

$total = $results.Apps.Count
$installedCount = ($results.Apps | Where-Object { $_.Ok }).Count
if($results.Ok)
{
    $installationResult = "✅ OK: All **$total** apps successfully installed!"
}
else
{
    $installationResult = "❌ Errors: only **$installedCount** out of **$total** apps installed"
}

$installationDetails
foreach ($appResult in $results.Apps)
{
    if($appResult.Ok)
    {
        $message = "✅ App ``$($appResult.App)`` is installed with version ``$($appResult.Version)``"
    }
    else
    {
        $message = "❌ App ``$($appResult.App)`` is not installed"
    }
    $installationDetails += "`n$message"
}

$summary = ("
## 📝 Windows setup app installation report

$($installationResult)

<details>
    <summary>See details</summary>

    $($installationDetails)

</details>

<br />");

$summary >> $env:GITHUB_STEP_SUMMARY