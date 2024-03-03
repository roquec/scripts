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


$fontsResult = Invoke-Expression -Command "$PSScriptRoot\..\..\windows\fonts\verify.ps1"

$totalFonts = $fontsResult.Fonts.Count
$installedFonts = ($fontsResult.Fonts | Where-Object { $_.Ok }).Count
if($fontsResult.Ok)
{
    $fontsResultMsg = "✅ OK: All **$totalFonts** fonts successfully installed!"
}
else
{
    $fontsResultMsg = "❌ Errors: only **$installedFonts** out of **$totalFonts** fonts installed"
}

foreach ($fontResult in $fontsResult.Fonts)
{
    if($fontResult.Ok)
    {
        $message = "✅ Font ``$($fontResult.Font)`` is installed"
    }
    else
    {
        $message = "❌ Font ``$($fontResult.Font)`` is not installed"
    }
    $fontsResultDetailsMsg += "`n$message"
}


$summary = ("

### 🖥️ Application Installation

<div style='padding-left: 40px;'>
$($installationResult)

<details>
    <summary>See details</summary>

    $($installationDetails)

</details>
</div>

### ✒️ Font Installation 

<div style='padding-left: 40px;'>

$($fontsResultMsg)

<details>
    <summary>See details</summary>

    $($fontsResultDetailsMsg)

</details>

</div>");

$summary