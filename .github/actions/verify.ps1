$result = & "$PSScriptRoot\..\..\src\windows\verify.ps1" -Output $true

$summary = ("
# 📝 Windows Setup Report 📝

``````text

$($result.Msg)

``````
");

$summary >> $env:GITHUB_STEP_SUMMARY

if(-not $result.Ok)
{
    Write-Error "Windows setup has concluded with errors."
}