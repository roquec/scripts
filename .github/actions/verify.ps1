$result = & "$PSScriptRoot\..\..\windows\verify.ps1" -Output $true

$summary = ("
<h1 align='center'>📝 Windows Setup Report 📝</h1>

``````text

$($result.Msg)

``````
");

$summary >> $env:GITHUB_STEP_SUMMARY

if(-not $result.Ok)
{
    Write-Error "Windows setup has concluded with errors."
}