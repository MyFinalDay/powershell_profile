# global variable
$Global:myStr1 = @"
 |\ ^&_-+=$,;\)@~%`][<. ;:}{*!T>/o01OIl'
"@

$Global:usualPsArr = @("explorer", "gvim", "node", "firefox", "chrome", "powershell", "qq*", "Code", "atom",
    "wechatdevtools", "mongobooster", "emacs", "EgretWing", "Postman", "powershell_ise")

$Global:sysToolsArr = @('winver', 'mspaint', 'magnify', 'charmap', 'msinfo32', 'resmon')
$Global:myHash1 = @{level = 1; scope = "root"; isGlobal = $true; lang = @('powershell', 'C#')}

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

    bubuweiying         = 'E:\DataIn\WorkFor\bubuweiying\wxapp_bubuweiying';
    bubuweiyingSrc      = 'E:\DataIn\WorkFor\bubuweiying\wxapp_bubuweiying\src';
    bubuweiyingImg      = 'E:\DataIn\WorkFor\bubuweiying\wxapp_bubuweiying\src\images';
    descriptionDoc      = 'E:\DataIn\WorkFor\DescriptionDocument\bubuweiying';
    wepy                = 'E:\DataIn\VScodeData\newTestXiaoChengXu\testWepy';
    wxYuHan             = 'E:\DataIn\VScodeData\newTestXiaoChengXu\wxYuHanStore\src\pages';

    tripShoot           = 'E:\DataIn\WorkFor\tripShoot\mobile';
}

$Global:programPathHash = @{
    gvim              = 'E:\UserSoft\amixVim\vim80\gvim.exe';
    weChat            = 'E:\UserSoft\WeChat\WeChat.exe'
    gitBash           = 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Git\Git Bash.lnk';
    'notepad++'       = 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Notepad++\Notepad++.lnk';
    BingDict          = 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\??????\????.lnk';
    ideaLicenseServer = 'C:\Users\mydell\Desktop\IntelliJIDEALicenseServer_windows_amd64.exe - ????.lnk' ;
    webstorm64        = 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\JetBrains Toolbox\WebStorm.lnk';
    chrome            = 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe';
    qq                = 'C:\Program Files (x86)\Tencent\QQ\Bin\QQ.exe';
    wechatdevtools    = 'E:\UserSoft\??web?????\wechatdevtools.exe';
    powershell        = 'C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe'
    firefox           = 'E:\UserSoft\Firefox_64\firefox.exe';

    sublime_text      = 'E:\UserSoft\Sublime Text 3x64\sublime_text.exe';
    IDEA              = 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\JetBrains Toolbox\IntelliJ IDEA Ultimate.lnk';
    Postman           = 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Postman\Postman.lnk';
    emacs             = 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Gnu Emacs\Emacs.lnk';
    powershell_ise    = 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Windows PowerShell\Windows PowerShell ISE.lnk';
    Everyting   = 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Everything\Search Everything.lnk';
    baiduDisk         = 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\????\????.lnk';
    Wox               = 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Wox\Wox.lnk';
    sndvol            = 'C:\WINDOWS\system32\SndVol.exe';
    Everything        = 'E:\UserSoft\Everything\Everything.exe';
}

$Global:myUsualFilePath = @{
    english = 'E:\DataIn\NodejsData\testWebpack\testSmall\src\utils\studyEnglish\';
}

$Global:AppInfoMap = Get-WmiObject -Class Win32_OperatingSystem

$Global:myMsg = @{
    AppId = 'wx97807883a836a66d';
    yx    = 'file:///E:/DataIn/WorkFor/DescriptionDocument/bubuweiying/yx/bbwy_yx_0314/start.html';
}

$Global:yx = 'file:///E:/DataIn/WorkFor/DescriptionDocument/bubuweiying/yx/bbwy_yx_0314/start.html'
