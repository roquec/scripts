$summary = ("
<h1 align='center'>📝 Windows Setup Report 📝</h1>
");

$result = Invoke-Expression -Command "$PSScriptRoot\..\..\windows\verify.ps1"

$summary += $result.Msg

$summary >> $env:GITHUB_STEP_SUMMARY