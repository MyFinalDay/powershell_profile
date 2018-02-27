# ******************************************************************************** 
# some variables
# ******************************************************************************** 

$oneNote = "start 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office 2013\OneNote 2013.lnk'"
$firfox = "start E:\UserSoft\Firefox_64\firefox.exe"

$wox = "start C:\Users\mydell\AppData\Local\Wox\app-1.3.183\Wox.exe"
$cmder = "start E:\UserSoft\cmderAnd\Cmder.exe"

$ideaLicenseServer = "start 'C:\Users\mydell\Desktop\IntelliJIDEALicenseServer_windows_amd64.exe - ????.lnk' -WindowStyle Hidden"
$westorm64 = "start 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\JetBrains Toolbox\WebStorm.lnk'"

$sourceTree = "start C:\Users\mydell\Desktop\SourceTree.lnk"
$weChat = "start E:\UserSoft\WeChat\WeChat.exe"

$wecharDevelopTools = "start C:\Users\mydell\Desktop\??web?????.lnk"
$chrome = "start 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Google Chrome.lnk'"

$mongobooster="start C:\Users\mydell\Desktop\mongobooster.lnk"

$Global:startLoadTime = Get-Date
$Global:startLoadTimeAllProcess = Get-Process



# ******************************************************************************** 
# some cmdlet
# ******************************************************************************** 

Start-Sleep -Seconds 2

Write-Host "Open...".PadLeft(20)
# Invoke-Expression $oneNote
Invoke-Expression $westorm64
Invoke-Expression $wox

Invoke-Expression $cmder

# Invoke-Expression $sourceTree

Invoke-Expression $weChat
Invoke-Expression $wecharDevelopTools

Invoke-Expression $firfox
Invoke-Expression $chrome
# Invoke-Expression $mongobooster
# Start-Process powershell -Verb runas


Start-Sleep -Seconds 20

Write-Host "`nKill..."
Stop-Process -Name ThunderPlatform, lantern, ONENOTEM, 'Resilio Sync', jetbrains-toolbox, Xmp, QQLive, QQ* -ErrorAction SilentlyContinue


Write-Host "`nSet..."
# Set-Alias st E:\UserSoft\Sublime Text 3x64\sublime_text.exe


Write-Host "`nImport Alias,History..."
# Import-Alias E:\DataIn\SettingPowershell\alias.csv -Force

Start-Sleep -Seconds 30
Invoke-Expression $ideaLicenseServer

Start-Sleep -Seconds 90
Stop-Process -Name ThunderPlatform, lantern, ONENOTEM, 'Resilio Sync', jetbrains-toolbox, Xmp, QQLive, QQ* -ErrorAction SilentlyContinue
Stop-Process -Name IntelliJIDEALicenseServer_windows_amd64 -ErrorAction SilentlyContinue

Set-Location $HOME

Write-Host "`nThat all...".PadLeft(20) -ForegroundColor Red

Start-Sleep -Seconds 15
Stop-Process -Id $PID
