$result = Invoke-Expression -Command "$PSScriptRoot\..\..\windows\verify.ps1"

$summary = ("
<h1 align='center'>📝 Windows Setup Report 📝</h1>

<p>

$($result.Msg)

</p>
");

$summary >> $env:GITHUB_STEP_SUMMARY