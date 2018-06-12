# global variable
$Global:myStr1 = @"
 |\ ^&_-+=$,;\)@~%`][<. ;:}{*!T>/o01OIl'
"@

$Global:sysToolsArr = @(
    "winver"       , "mspaint"      , "magnify"  ,
    "charmap"      , "msinfo32"     , "resmon"   ,
    "psr"          , "devmgmt"      , "msconfig" ,
    "compmgmt"     , "appwiz.cpl"   , "control"  ,
    "firewall.cpl" , "main.cpl"     , "ncpa.cpl" ,
    "sysdm.cpl"    , "timedate.cpl" , "eventvwr"
)

$Global:myPslibFilePath = @{
    psLibFilePath = 'E:\DataIn\PowershellScriptData\psLib.ps1';
    aliasFilePath = 'E:\DataIn\SettingPowershell\alias.csv';
}

$Global:WebNetUrlUsual = @{
    stackedit    = 'https://stackedit.io/'
    myGithub     = 'https://myfinalday.github.io/'
    freeLicense  = 'http://jetbrains.license.laucyun.com/'
    iconfont     = 'http://www.iconfont.cn/search/index'
    webstormHelp = 'https://www.jetbrains.com/help/webstorm/2017.3/meet-webstorm.html'
}

$Global:documentNetUrl = @{
    vue         = 'https://cn.vuejs.org/v2/api/'
    xiaoChengXu = 'https://developers.weixin.qq.com/miniprogram/dev/api/'
    antMobile   = 'https://antd-mobile.gitee.io/docs/react/introduce-cn'
    antDesign   = 'http://ant-design.gitee.io/docs/react/introduce-cn'
    dva         = 'https://github.com/dvajs/dva/blob/master/README_zh-CN.md'
}

$Global:myWorkPathHash = @{
    appJs               = 'E:\DataIn\NodejsData\testWebpack\testSmall\src\'
    weChatTmpFile       = 'C:\Users\mydell\Documents\WeChat Files\wxid_fodh1nkdqos422\Files'
    emacsRecentFile     = 'E:\UserSoft\Ecmas\emacs-26.1-x86_64\RecentFlie'
    forQuickTest        = 'E:\DataIn\VScodeData\forQuickTest'
    payloadFormat       = 'E:\DataIn\PowershellScriptData\tmpCacheFile\tmpSomePayloadFormat.js'

    tutorPlatform       = 'E:\DataIn\WorkFor\tutorPlatform\client\admin\src\components\backend'
    yjxy_wxapp          = 'E:\DataIn\WorkFor\yjxy-wxapp\admin\src\components'
    treatmentCheck      = 'E:\DataIn\WorkFor\treatmentCheck\client\src\components'
    sp_BusinessCard     = 'E:\DataIn\WorkFor\sp-BusinessCard\mobile\pages'
    officialWebsite2018 = 'E:\DataIn\WorkFor\officialWebsite2018\client'

    bubuweiying         = 'E:\DataIn\WorkFor\bubuweiying\wxapp_bubuweiying'
    bubuweiyingSrc      = 'E:\DataIn\WorkFor\bubuweiying\wxapp_bubuweiying\src'
    bubuweiyingImg      = 'E:\DataIn\WorkFor\bubuweiying\wxapp_bubuweiying\src\images'
    bbwySiteMap         = 'https://bbwy.lwf.gzqichang.com/api/sitemap/'
    bbwyZbeInvite       = 'teamUrl=http://bbwy.lwf.gzqichang.com/api/team/teams/133/&name=python'

    descriptionDoc      = 'E:\DataIn\WorkFor\DescriptionDocument\bubuweiying'
    wepy                = 'E:\DataIn\VScodeData\newTestXiaoChengXu\testWepy'
    wxYuHan             = 'E:\DataIn\VScodeData\newTestXiaoChengXu\wxYuHanStore\src\pages'

    tripShoot           = 'E:\DataIn\WorkFor\tripShoot\mobile'
    weilairensheng      = 'E:\DataIn\WorkFor\weilairensheng'
    tripShootImg        = 'E:\DataIn\WorkFor\DescriptionDocument\lvpai\bf????4-18\sy????'
    tripSGhootAssets    = 'E:\DataIn\WorkFor\tripShoot\mobile\src\assets'

    ngrokUrl            = 'leeboo.ngrok.gznuode.cn'
    ConsoleApplication2 = 'E:\DataIn\VisulStudio2015Data\newTestSmallCode\ConsoleApplication2\ConsoleApplication2'
    rider64Data         = 'E:\DataIn\RiderData\newTestSmallCode\Solution1\ConsoleApplication1\bin\Debug'
    rider64EXEData      = 'E:\DataIn\RiderData\newTestSmallCode\Solution1\ConsoleApplication1\bin\Debug\ConsoleApplication1.exe'
    consultantMobile    = 'E:\DataIn\WorkFor\customerManage\consultantMobile'
    consultantYX        = 'https://free.modao.cc/app/4z8fpIEPJTlYdqm8XcPU9j6vAOVGRP3#screen=sA79478420D1524817302322'
    testLayout          = 'file:///E:/DataIn/vscodedata/newtestlayout/index.html'

    gitTmpCanBeDel      = 'E:\DataIn\GitHub_download_data\tmp_canDelete'
    qichangDomain       = "https://bbwy.lwf.gzqichang.com/"

    tmp_canDelete       = 'E:\DataIn\GitHub_download_data\tmp_canDelete'
    rollupTest          = 'E:\DataIn\VScodeData\quickUtils\rollupTest'
}

$Global:programPathHash = @{
    gvim                    = 'E:\UserSoft\amixVim\vim80\gvim.exe'
    WeChat                  = 'E:\UserSoft\WeChat\WeChat.exe'
    gitBash                 = 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Git\Git Bash.lnk'
    BingDict                = 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\??????\????.lnk'
    ideaLicenseServer       = 'C:\Users\mydell\Desktop\IntelliJIDEALicenseServer_windows_amd64.exe - ????.lnk'
    webstorm64              = 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\JetBrains Toolbox\WebStorm.lnk'
    pycharm64               = "C:\Users\mydell\AppData\Local\JetBrains\Toolbox\apps\PyCharm-C\ch-1\181.4892.64\bin\pycharm64.exe"
    chrome                  = 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe'
    MicrosoftEdge           = 'C:\Windows\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\MicrosoftEdge.exe'
    qq                      = 'C:\Program Files (x86)\Tencent\QQ\Bin\QQ.exe'
    wechatdevtools          = 'E:\UserSoft\??web?????\wechatdevtools.exe'
    powershell              = 'C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe'
    mspaint                 = 'C:\WINDOWS\system32\mspaint.exe'
    ChsIME                  = 'C:\Windows\System32\InputMethod\CHS\ChsIME.exe'
    mip                     = 'C:\Program Files\Common Files\Microsoft Shared\Ink\mip.exe'
    Explorer                = 'C:\WINDOWS\Explorer.EXE'
    'notepad++'             = 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Notepad++\Notepad++.lnk'


    firefox                 = 'E:\UserSoft\Firefox_64\firefox.exe'

    sublime_text            = 'E:\UserSoft\Sublime Text 3x64\sublime_text.exe'
    IDEA                    = 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\JetBrains Toolbox\IntelliJ IDEA Ultimate.lnk'
    rider64                 = 'C:\Users\mydell\AppData\Local\JetBrains\Toolbox\apps\Rider\ch-0\181.4379.1191\bin\rider64.exe'
    Postman                 = 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Postman\Postman.lnk'
    emacs                   = 'E:\UserSoft\Ecmas\emacs-26.1-x86_64\bin\runemacs.exe'
    powershell_ise          = 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Windows PowerShell\Windows PowerShell ISE.lnk'
    Everyting               = 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Everything\Search Everything.lnk'
    baidunetdisk            = 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\????\????.lnk'
    Wox                     = 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Wox\Wox.lnk'
    sndvol                  = 'C:\WINDOWS\system32\SndVol.exe'
    Everything              = 'E:\UserSoft\Everything\Everything.exe'
    kuaibu                  = 'E:\UserSoft\Kuaibu\kuaibu\kuaibu.exe'
    PotPlayerMini64         = 'E:\UserSoft\PotPlayer\PotPlayerMini64.exe'

    ConEmu64                = 'E:\UserSoft\conEmu2\ConEmu64.exe'
    node                    = 'E:\UserSoft\nodeJS\node.exe'
    FSViewer                = 'E:\UserSoft\FastStone Image Viewer\FSViewer.exe'

    'Microsoft.Msn.Weather' = 'C:\Program Files\WindowsApps\Microsoft.BingWeather_4.23.10923.0_x64__8wekyb3d8bbwe\Microsoft.Msn.Weather.exe'
    'Microsoft.Photos'      = 'C:\Program Files\WindowsApps\Microsoft.Windows.Photos_2018.18031.15040.0_x64__8wekyb3d8bbwe\Microsoft.Photos.exe'
    'Microsoft.Msn.News'    = 'C:\Program Files\WindowsApps\Microsoft.BingNews_4.23.10923.0_x64__8wekyb3d8bbwe\Microsoft.Msn.News.exe'


    SumatraPDF              = 'E:\UserSoft\SumatraPDF\SumatraPDF.exe'

    'jetbrains-toolbox'     = 'C:\Users\mydell\AppData\Local\JetBrains\Toolbox\bin\jetbrains-toolbox.exe'
    'PaintStudio.View'      = 'C:\Program Files\WindowsApps\Microsoft.MSPaint_4.1804.13047.0_x64__8wekyb3d8bbwe\PaintStudio.View.exe'
    'KanKan'                = 'E:\UserSoft\Meitu\KanKan\KanKan.exe'
    Thunder                 = 'E:\UserSoft\Thunder9\Program\Thunder.exe'
    QQLive                  = 'E:\UserSoft\QQLive\QQLive.exe'
    cmd                     = 'C:\WINDOWS\SYSTEM32\cmd.exe'
    PxCook                  = 'E:\UserSoft\pxcook2\PxCook\PxCook.exe'
    Bandizip                = 'E:\UserSoft\Bandizip\Bandizip.exe'
    'xampp-control'         = 'E:\UserSoft\Xampp\xampp-control.exe'
    devenv                  = 'E:\UserSoft\VisulStuido\Common7\IDE\devenv.exe'
    python                  = 'C:\Python36\python.exe'
    WXWork                  = 'E:\UserSoft\WXWork\WXWork.exe';
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

$Global:gitApiGitHub = @{
    api                                  = 'https://api.github.com/'
    current_user_url                     = 'https://api.github.com/user'
    current_user_authorizations_html_url = 'https://github.com/settings/connections/applications{/client_id}'
    authorizations_url                   = 'https://api.github.com/authorizations'
    code_search_url                      = 'https://api.github.com/search/code?q={query}{&page,per_page,sort,order}'
    commit_search_url                    = 'https://api.github.com/search/commits?q={query}{&page,per_page,sort,order}'
    emails_url                           = 'https://api.github.com/user/emails'

    emojis_url                           = 'https://api.github.com/emojis'  # emoj
    events_url                           = 'https://api.github.com/events'  # longResponse

    feeds_url                            = 'https://api.github.com/feeds'
    followers_url                        = 'https://api.github.com/user/followers'
    following_url                        = 'https://api.github.com/user/following{/target}'
    gists_url                            = 'https://api.github.com/gists{/gist_id}'
    hub_url                              = 'https://api.github.com/hub'
    issue_search_url                     = 'https://api.github.com/search/issues?q={query}{&page,per_page,sort,order}'  #longResponse

    issues_url                           = 'https://api.github.com/issues'

    keys_url                             = 'https://api.github.com/user/keys'
    notifications_url                    = 'https://api.github.com/notifications'
    public_gists_url                     = 'https://api.github.com/gists/public'  #longResponse
    rate_limit_url                       = 'https://api.github.com/rate_limit'  # shortResponse 
    repository_url                       = 'https://api.github.com/repos/{owner}/{repo}'
    repository_search_url                = 'https://api.github.com/search/repositories?q={query}{&page,per_page,sort,order}'  # longResponse
    
    current_user_repositories_url        = 'https://api.github.com/user/repos{?type,page,per_page,sort}'
    starred_url                          = 'https://api.github.com/user/starred{/owner}{/repo}'
    starred_gists_url                    = 'https://api.github.com/gists/starred'
    team_url                             = 'https://api.github.com/teams'
    user_url                             = 'https://api.github.com/users/{user}'
    user_organizations_url               = 'https://api.github.com/user/orgs'
    user_repositories_url                = 'https://api.github.com/users/{user}/repos{?type,page,per_page,sort}'
    user_search_url                      = 'https://api.github.com/search/users?q={query}{&page,per_page,sort,order}'

    gist_detail_eg1                      = 'https://api.github.com/gists/09591a0e01c7c380afdfedea3e76c501'
    developerV3                          = 'https://developer.github.com/v3/repos/'
}