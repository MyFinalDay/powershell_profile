Get-Date

start-Sleep -Seconds 1

"`t" + "*" * 100
"`n"
"`t" + "*" * 100
"`n"

Write-Host "`nExport Alias, History..."
# if ((Get-Alias | Measure-Object).Count -ne 158 ) {
#     Export-Alias E:\DataIn\SettingPowershell\alias.csv
# }
# if ((Get-History | Measure-Object).Count -gt 50) {
#     Get-History | Export-Csv E:\DataIn\SettingPowershell\history.csv
# }

Set-Content E:\DataIn\SettingPowershell\tmpShudownInfo.txt ([datetime]::Now)

. E:\DataIn\PowershellScriptData\utils\sendMsglog.ps1

Write-Host "`nShutdown..."



Write-Host "kill..."
Stop-Process -Name ONENOTEM, rider64 ONENOTE, Code, git-cmd, bash, PxCook firefox, chrome, EgretWing, wechat*, webstorm64, emacs, git-bash, ConEmu64, KanKan, FSViewer -ErrorAction SilentlyContinue

shutdown.exe -s -t 8
start-Sleep -Seconds 7
Stop-Process -Name powershell, powershell_ise
