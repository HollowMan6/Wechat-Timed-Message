# Install Dependencies
pip install -r requirements.txt

# Setup Environmental Variables
Write-Host "---Enter your Actions Secrets, empty if it doesn't exists---"
$secrets = "TITLE", "MSG", "PPTOKEN", "PPTOPIC", "SERVERCHANSCKEY", "CONTENT", "IMAGE", "CORPID", "CORPSECRET", "AGENTID", "CRONEXP", "DELAYS"
$cmd = 'Set-Location ' + (Get-Item .).FullName + '; '
ForEach ($secret in $secrets) {
    $content = Read-Host ('-' + $secret)
    if (!$content) {
        $content = 'NONE'
    }
    $cmd += '$env:' + "$secret='$content'; "
    Invoke-Expression $cmd
}
$cmd += 'python clock.py'
if (Test-Path clock.ps1) {
    Remove-Item clock.ps1
}
Write-Output $cmd >> clock.ps1
if (-not (Test-Path logs.txt)) {
    New-Item logs.txt
}
Invoke-WmiMethod -Class Win32_Process -Name Create -ArgumentList "powershell.exe -WindowStyle hidden -File $PWD\clock.ps1" -Confirm
Get-Content logs.txt -Wait
