# global variable
$Global:myStr1 = @"
 |\ ^&_-+=$,;\)@~%`][<. ;:}{*!T>/o01OIl'
"@
$Global:usualPsArr = @("explorer", "gvim", "node", "firefox", "chrome", "powershell", "qq*", "Code", "atom", "wechatdevtools", "mongobooster", "emacs", "EgretWing", "Postman", "powershell_ise")
$Global:sysToolsArr = @('winver', 'mspaint', 'magnify', 'charmap', 'msinfo32', 'resmon')
$Global:myHash1 = @{level = 1; scope = "root"; isGlobal = $true; lang = @('powershell', 'C#')}
# $Global:myPsFilePath = 'E:\DataIn\PowershellScriptData\psLib.ps1'
# $Global:myAliasFilePath = 'E:\DataIn\SettingPowershell\alias.csv'

$Global:myPslibFilePath = @{
    psLibFilePath = 'E:\DataIn\PowershellScriptData\psLib.ps1';
    aliasFilePath = 'E:\DataIn\SettingPowershell\alias.csv';
}

$Global:myWorkPathHash = @{
    appJs               = 'E:\DataIn\NodejsData\testWebpack\testSmall\src\';
    weChatTmpFile       = 'C:\Users\mydell\Documents\WeChat Files\wxid_fodh1nkdqos422\Files';
    tutorPlatform       = 'E:\DataIn\WorkFor\tutorPlatform\client\admin\src\components\backend';
    yjxy_wxapp          = 'E:\DataIn\WorkFor\yjxy-wxapp\admin\src\components';
    treatmentCheck      = 'E:\DataIn\WorkFor\treatmentCheck\client\src\components';
    sp_BusinessCard     = 'E:\DataIn\WorkFor\sp-BusinessCard\mobile\pages';
    officialWebsite2018 = 'E:\DataIn\WorkFor\officialWebsite2018\client';
    bubuweiying         = 'E:\DataIn\WorkFor\bubuweiying\wxapp_bubuweiying\src';
    descriptionDoc      = 'E:\DataIn\WorkFor\DescriptionDocument\bubuweiying';
    wepy                = 'E:\DataIn\VScodeData\newTestXiaoChengXu\testWepy';
}

$Global:processPathHash = @{
    gvim              = 'E:\UserSoft\amixVim\vim80\gvim.exe';
    gitBash           = 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Git\Git Bash.lnk';
    ideaLicenseServer = 'C:\Users\mydell\Desktop\IntelliJIDEALicenseServer_windows_amd64.exe - ????.lnk' ;
    webstorm          = 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\JetBrains Toolbox\WebStorm.lnk';
    chrome            = 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe';
    firefox           = 'E:\UserSoft\Firefox_64\firefox.exe';
    IDEA              = 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\JetBrains Toolbox\IntelliJ IDEA Ultimate.lnk';
    sublime_text      = 'E:\UserSoft\Sublime Text 3x64\sublime_text.exe';
    Postman           = 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Postman\Postman.lnk';
}

$Global:myUsualFilePath = @{
    english = 'E:\DataIn\NodejsData\testWebpack\testSmall\src\utils\studyEnglish\';
}

$Global:AppInfoMap = Get-WmiObject -Class Win32_OperatingSystem

$Global:myAppId = 'wx97807883a836a66d'
