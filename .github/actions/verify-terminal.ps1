# Check Windows Terminal
$windowsTerminalResult = Invoke-Expression -Command "$PSScriptRoot\..\..\windows\windows-terminal\verify.ps1"
if($windowsTerminalResult.Ok)
{
    $windowsTerminalResultMsg = "✅ OK: Windows Terminal settings are correct!"
}
else
{
    $windowsTerminalResultMsg = "❌ Error: Windows Terminal settigns do not match reference"
}

$summary = ("

### ⚙️ Windows Terminal Settings

<div style='margin-left: 40px;'>
    $($windowsTerminalResultMsg)
</div>
");


# Check PowerShell
$powershellResult = Invoke-Expression -Command "$PSScriptRoot\..\..\windows\powershell\verify.ps1"
if($powershellResult.Ok)
{
    $powershellResultMsg = "✅ OK: PowerShell profile is correct!"
}
else
{
    $powershellResultMsg = "❌ Error: PowerShell profile does not match reference"
}

$summary += ("

### 🚀 PowerShell Profile

<div style='marging-left: 40px;'>
    $($powershellResultMsg)
</div>
");


# Check Oh My Posh
$ohmyposhResult = Invoke-Expression -Command "$PSScriptRoot\..\..\windows\oh-my-posh\verify.ps1"
if($ohmyposhResult.Ok)
{
    $ohmyposhResultMsg = "✅ OK: Oh My Posh theme is correct!"
}
else
{
    $ohmyposhResultMsg = "❌ Error: Oh My Posh theme does not match reference"
}

$summary += ("

### 🎨 Oh My Posh Theme

<div style='margin-left: 40px;'>
    $($ohmyposhResultMsg)
</div>
");


$summary