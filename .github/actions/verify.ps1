$summary = ("
<h1 align='center'>📝 Windows Setup Report 📝</h1>
");

$summary += Invoke-Expression -Command "$PSScriptRoot\verify-install.ps1"

$summary += Invoke-Expression -Command "$PSScriptRoot\verify-terminal.ps1"

$summary >> "$PSScriptRoot\report.md"
#$summary >> $env:GITHUB_STEP_SUMMARY