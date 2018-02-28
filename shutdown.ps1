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

Write-Host "`nShutdown..."
shutdown -s -t 8


Write-Host "Kill..."
Stop-Process -Name powershell, ONENOTEM, ONENOTE, Code, firefox, chrome, EgretWing -ErrorAction SilentlyContinue