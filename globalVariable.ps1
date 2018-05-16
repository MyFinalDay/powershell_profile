# global variable
$Global:myStr1 = @"
 |\ ^&_-+=$,;\)@~%`][<. ;:}{*!T>/o01OIl'
"@

$Global:usualPsArr = @("explorer", "gvim", "node", "firefox", "chrome", "powershell", "qq*", "Code", "atom",
    "wechatdevtools", "mongobooster", "emacs", "EgretWing", "Postman", "powershell_ise")

$Global:sysToolsArr = @(
    'winver', 'mspaint', 'magnify', 'charmap', 'msinfo32', 'resmon', 'psr',
    'devmgmt', 'msconfig', 'compmgmt', 'appwiz.cpl', 
    'control', 'firewall.cpl', 'main.cpl', 'ncpa.cpl', 'sysdm.cpl', 'timedate.cpl'
)

$Global:myHash1 = @{level = 1; scope = "root"; isGlobal = $true; lang = @('powershell', 'C#')}

$Global:myPslibFilePath = @{
    psLibFilePath = 'E:\DataIn\PowershellScriptData\psLib.ps1';
    aliasFilePath = 'E:\DataIn\SettingPowershell\alias.csv';
}

$Global:myUsualNetUrl = @{
    stackedit = 'https://stackedit.io/';
    myGithub  = 'https://myfinalday.github.io/';
}

$Global:myWorkPathHash = @{
    appJs               = 'E:\DataIn\NodejsData\testWebpack\testSmall\src\';
    weChatTmpFile       = 'C:\Users\mydell\Documents\WeChat Files\wxid_fodh1nkdqos422\Files';
    emacsRecentFile     = 'E:\UserSoft\Ecmas\emacs\bin\RecentFlie';
    forQuickTest        = 'E:\DataIn\VScodeData\forQuickTest';

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
    weilairensheng      = 'E:\DataIn\WorkFor\weilairensheng';
    tripShootImg        = 'E:\DataIn\WorkFor\DescriptionDocument\lvpai\bf????4-18\sy????';
    tripSGhootAssets    = 'E:\DataIn\WorkFor\tripShoot\mobile\src\assets';

    ngrokUrl            = 'leeboo.ngrok.gznuode.cn';
    ConsoleApplication2 = 'E:\DataIn\VisulStudio2015Data\newTestSmallCode\ConsoleApplication2';
}

$Global:programPathHash = @{
    gvim                    = 'E:\UserSoft\amixVim\vim80\gvim.exe';
    weChat                  = 'E:\UserSoft\WeChat\WeChat.exe'
    gitBash                 = 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Git\Git Bash.lnk';
    'notepad++'             = 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Notepad++\Notepad++.lnk';
    BingDict                = 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\??????\????.lnk';
    ideaLicenseServer       = 'C:\Users\mydell\Desktop\IntelliJIDEALicenseServer_windows_amd64.exe - ????.lnk' ;
    webstorm64              = 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\JetBrains Toolbox\WebStorm.lnk';
    chrome                  = 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe';
    qq                      = 'C:\Program Files (x86)\Tencent\QQ\Bin\QQ.exe';
    wechatdevtools          = 'E:\UserSoft\??web?????\wechatdevtools.exe';
    powershell              = 'C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe';
    mspaint                 = 'C:\WINDOWS\system32\mspaint.exe';
    ChsIME                  = 'C:\Windows\System32\InputMethod\CHS\ChsIME.exe';
    Explorer                = 'C:\WINDOWS\Explorer.EXE';

    firefox                 = 'E:\UserSoft\Firefox_64\firefox.exe';

    sublime_text            = 'E:\UserSoft\Sublime Text 3x64\sublime_text.exe';
    IDEA                    = 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\JetBrains Toolbox\IntelliJ IDEA Ultimate.lnk';
    Postman                 = 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Postman\Postman.lnk';
    emacs                   = 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Gnu Emacs\Emacs.lnk';
    powershell_ise          = 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Windows PowerShell\Windows PowerShell ISE.lnk';
    Everyting               = 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Everything\Search Everything.lnk';
    baidunetdisk            = 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\????\????.lnk';
    Wox                     = 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Wox\Wox.lnk';
    sndvol                  = 'C:\WINDOWS\system32\SndVol.exe';
    Everything              = 'E:\UserSoft\Everything\Everything.exe';
    kuaibu                  = 'E:\UserSoft\Kuaibu\kuaibu\kuaibu.exe';
    PotPlayerMini64         = 'E:\UserSoft\PotPlayer\PotPlayerMini64.exe';

    ConEmu64                = 'E:\UserSoft\conEmu2\ConEmu64.exe';
    node                    = 'E:\UserSoft\nodeJS\node.exe';
    FSViewer                = 'E:\UserSoft\FastStone Image Viewer\FSViewer.exe';
    
    'Microsoft.Msn.Weather' = 'C:\Program Files\WindowsApps\Microsoft.BingWeather_4.23.10923.0_x64__8wekyb3d8bbwe\Microsoft.Msn.Weather.exe';
    'Microsoft.Photos'      = 'C:\Program Files\WindowsApps\Microsoft.Windows.Photos_2018.18031.15040.0_x64__8wekyb3d8bbwe\Microsoft.Photos.exe';
    'Microsoft.Msn.News'    = 'C:\Program Files\WindowsApps\Microsoft.BingNews_4.23.10923.0_x64__8wekyb3d8bbwe\Microsoft.Msn.News.exe';

    SumatraPDF              = 'E:\UserSoft\SumatraPDF\SumatraPDF.exe';

    'jetbrains-toolbox'     = 'C:\Users\mydell\AppData\Local\JetBrains\Toolbox\bin\jetbrains-toolbox.exe';
    'PaintStudio.View'      = 'C:\Program Files\WindowsApps\Microsoft.MSPaint_4.1804.13047.0_x64__8wekyb3d8bbwe\PaintStudio.View.exe';
    'KanKan'                = 'E:\UserSoft\Meitu\KanKan\KanKan.exe';
    Thunder                 = 'E:\UserSoft\Thunder9\Program\Thunder.exe';
    QQLive                  = 'E:\UserSoft\QQLive\QQLive.exe';
    cmd                     = 'C:\WINDOWS\SYSTEM32\cmd.exe';
    PxCook                  = 'E:\UserSoft\pxcook2\PxCook\PxCook.exe';
    Bandizip                = 'E:\UserSoft\Bandizip\Bandizip.exe';
    'xampp-control'         = 'E:\UserSoft\Xampp\xampp-control.exe';
    devenv                  = 'E:\UserSoft\VisulStuido\Common7\IDE\devenv.exe';
    python                  = 'C:\Python36\python.exe';
}

$Global:myUtilPath = @{
    colorTable = 'E:\DataIn\NodejsData\testWebpack\testSmall\src\brower\dom\colorTable.html';
}

$Global:myUsualFilePath = @{
    english = 'E:\DataIn\NodejsData\testWebpack\testSmall\src\utils\studyEnglish\';
}

$Global:AppInfoMap = Get-WmiObject -Class Win32_OperatingSystem

$Global:myMsg = @{
    AppId     = 'wx97807883a836a66d';
    yx        = 'file:///E:/DataIn/WorkFor/DescriptionDocument/bubuweiying/yx/bbwy_yx_0314/start.html';
    oldDomain = 'https://bubuweiying.customer.minapp.com/';
    phone     = '13681208909' ;

}

$Global:yx = 'file:///E:/DataIn/WorkFor/DescriptionDocument/bubuweiying/yx/bbwy_yx_0314/start.html'
