# 
# ******************************************************************************** 
Set-Content E:\DataIn\SettingPowershell\tmpStartInfo.txt ([datetime]::Now)

Write-Host "`nTimeSpan Last shutdown computer..."
New-TimeSpan -End ([datetime]::Now) -Start (Get-Content E:\DataIn\SettingPowershell\tmpShudownInfo.txt) -ErrorAction SilentlyContinue | Format-Table 
# ******************************************************************************** 
# some variables
# ******************************************************************************** 

$oneNote = "start 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office 2013\OneNote 2013.lnk'"
$firfox = "start E:\UserSoft\Firefox_64\firefox.exe"

$wox = "start C:\Users\mydell\AppData\Local\Wox\app-1.3.183\Wox.exe"
$cmder = "start E:\UserSoft\conEmu2\ConEmu64.exe"
$emacs = "start 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Gnu Emacs\Emacs.lnk'";

$ideaLicenseServer = "start 'C:\Users\mydell\Desktop\IntelliJIDEALicenseServer_windows_amd64.exe - ????.lnk'"
$westorm64 = "start 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\JetBrains Toolbox\WebStorm.lnk'"

$sourceTree = "start C:\Users\mydell\Desktop\SourceTree.lnk"
$weChat = "start E:\UserSoft\WeChat\WeChat.exe"

$wecharDevelopTools = "start C:\Users\mydell\Desktop\??web?????.lnk"
$chrome = "start 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Google Chrome.lnk'"

$code = "start 'E:\UserSoft\Microsoft VS Code\Code.exe'"

$Global:startLoadTime = Get-Date
$Global:startLoadTimeAllProcess = Get-Process



# ******************************************************************************** 
# some cmdlet
# ******************************************************************************** 

Start-Sleep -Seconds 1

Write-Host "Open...".PadLeft(20)
# Invoke-Expression $oneNote
# Invoke-Expression $wox

Invoke-Expression $cmder
Invoke-Expression $emacs
Invoke-Expression $chrome

# Start-Process powershell -Verb runas

Write-Host "`nSet..."
# Set-Alias st E:\UserSoft\Sublime Text 3x64\sublime_text.exe


Write-Host "`nImport Alias,History..."
# Import-Alias E:\DataIn\SettingPowershell\alias.csv -Force

Start-Sleep -Seconds 30
Stop-Process -Name ThunderPlatform, lantern, ONENOTEM, 'Resilio Sync', jetbrains-toolbox, Xmp, Thunder*, knatsvc, QQLive, QQ* -ErrorAction SilentlyContinue



Set-Location $HOME

Write-Host "`nThat all...".PadLeft(20) -ForegroundColor Red

Start-Sleep -Seconds 20
Stop-Process -Id $PID
