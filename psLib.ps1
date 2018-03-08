# global variable
$Global:myStr1 = @"
 |^&_-+=$,;\)@~%`][<. ;:}{*!T>/o01OIl'
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
    sp_BusinessCard     = 'E:\DataIn\WorkFor\sp-BusinessCard\app\model';
    officialWebsite2018 = 'E:\DataIn\WorkFor\officialWebsite2018\client';
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
# Function
function swap ($a, $b) {
    # swap eg. swap 8 11 -> @(11, 8)
    $b = $b - $a;
    $a = $a + $b; # $a + $b - $a
    $b = $a - $b; # $a + $b - $a - $b + $a
    return @($a, $b)
}
function factorial ([int]$n = $(throw "param is not a integer!")) {
    # factorial 5 -> 120
    $total = 1

    for ($i = 1; $i -le $n; $i++) {
        $total *= $i
    }

    return $total
}

function logArr ([array]$array) {
    for ($i = 0; $i -lt $array.Count; $i++) {
        Write-Host $array[$i]
        if ($i % 3 -eq 0) {
            Write-Host ""
        }
    }
}
# Remove other Spcce ; keep only one Space
function RemoveSpace ([string]$str) {
    # RemoveSapce $myArr1
    $array = $str.Split(" ", [System.StringSplitOptions]::RemoveEmptyEntries)
    return [string]::Join(" ", $array)
}

function bubbleSort ([int[]]$inputArray) {
    $arr = $inputArray.Clone();
    
    for ($i = 0; $i -lt $arr.count; $i++) {
        for ($j = 0; $j -lt $arr.count - 1 - $i; $j++) {
            if ($arr[$j] -gt $arr[$j + 1]) {
                $arr[$j], $arr[$j + 1] = $arr[$j + 1], $arr[$j]
            }
        }
    }

    return $arr -join ", "
}

# function quickSort ([int[]]$inputArray) {
#     if ($inputArray.Count -le 1) {
#         return $inputArray
#     }

#     $pivotIndex = [System.Math]::Floor($inputArray.Count / 2)
#     $pivot = $inputArray[$pivotIndex]

#     $front = $pivotIndex - 1
#     $after = $pivotIndex + 1
#     $last = $inputArray.Count - 1
#     $inputArray = $inputArray[0..$front] + $inputArray[$after..$last]

#     $left = @()
#     $right = @()

#     for ($i = 0; $i -lt $inputArray.Count; $i++) {
#         if ($inputArray[$i] -lt $pivot) {
#             $left += $inputArray[$i]
#         }
#         else {
#             $right += $inputArray[$i]
#         }
#     }

#     $leftResult = quickSort($left)
#     $leftResult += $pivot
#     $rightResult = quickSort($right)

#     return $leftResult += $rightResult
# }

function bdTranslate {
    # tranlate chinese <-> english 
    param(
        $word
    )
    
    $timeStamp = [Long]([Double]::Parse((Get-Date -UFormat %s)) * 1000)
    $appid = "2015063000000001"
    $key = "12345678"

    $tohash = $appid + $word + $timeStamp + $key
    $md5 = new-object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
    $utf8 = new-object -TypeName System.Text.UTF8Encoding
    $sign = [System.BitConverter]::ToString($md5.ComputeHash($utf8.GetBytes($tohash))).Replace("-", "").ToLower()


    $params = @{
        q     = $word;
        appid = $appid;
        salt  = $timeStamp;
        sign  = $sign;
    }
    $lngCheck = [System.Text.RegularExpressions.Regex]::Match($word, "[\u4e00-\u9fa5]").Success
    if ($lngCheck) {
        $params.Add("from", "zh")
        $params.Add("to", "en")
    }
    else {
        $params.Add("from", "en")
        $params.Add("to", "zh")
    }

    $querystring = ""
    $params.GetEnumerator() | ForEach-Object {$querystring += $_.Name + "=" + $_.Value + "&"}
    $url = "http://api.fanyi.baidu.com/api/trans/vip/translate?" + $querystring
    $rsp = Invoke-WebRequest $url | ConvertFrom-Json

    $rsp.trans_result[0].dst
}
function SimpleTranslate ($word) {
    Write-Host " "
    $res = bdTranslate $word
    if ([int[]][char[]]$word -ge 255) {
        $res | clip
    }
    else {
        $word | clip  
    }
    Write-Host "`t $res"
    Write-Host " "
    bdTranslate $res
    Write-Host " "
}
function bdTranslateAntNote {
    # translate, clip, note
    param(
        $word
    )
    Write-Host " "
    $res = bdTranslate $word
    if ([int[]][char[]]$word -ge 255) {
        $res | clip
        if ((Get-ChildItem E:\DataIn\MyNote\tmpEnglish.js | Select-String $res) -eq $null) {
            addEnglishWords $res, $word
        }
    }
    else {
        $word | clip  
        if ((Get-ChildItem E:\DataIn\MyNote\tmpEnglish.js | Select-String $word) -eq $null) {
            addEnglishWords $word, $res
        }
    }
    $res
    Write-Host " "
    bdTranslate $res
    Write-Host " "
}

function helpAndExample () {
    help $args[0] -Examples
}

function getHistoryMatchChinese() {
    Get-History | Where-Object {[int[]][char[]]$_.CommandLine.ToString() -ge 255}
}

function searchDuplicateFile() {
    begin {
        Write-Host "`n Start...`n" -ForegroundColor Yellow
        $fileTable = @{}
        $count = 0
    }

    process {
        if ($fileTable.ContainsKey($_.Name)) {
            Write-Host  "$($_.fullname) has already existed!`n  Location: $($fileTable[$_.Name])`n"
            $count++
        }
        else {
            $fileTable.Add($_.Name, $_.fullname)
        }
    }

    end {
        Write-Host "`n Total: ${count}"
        Write-Host "`n Search finish!`n" -ForegroundColor Green
    }
}

function enumeratorProperty($obj) {
    $obj | Select-Object ($obj | Get-Member -MemberType Property | Select-Object Name).Name
}

function searchVariableAssemblies ($serachText) {
    [System.AppDomain]::CurrentDomain.GetAssemblies() 
}
function hashTableConvertToObject {
    begin {
        $obj = New-Object System.Object
    }

    process {
        $_.GetEnumerator() | ForEach-Object {Add-Member -InputObject $obj -MemberType NoteProperty -Name $_.Name -Value $_.Value}
    }

    end {
        $obj
    }
}
function logSizeHuman ($i) {
    # beautify  
    if ($i -ne $null) {
        if ($i -gt 0.9Gb) {
            $res = ($i / 1Gb).ToString('f2') + " GB"
        }
        elseif ($i -gt 0.9Mb) {
            $res = ($i / 1Mb).ToString('f1') + " MB"
        }
        elseif ($i -gt 1Kb) {
            $res = ($i / 1Kb).ToString('f1') + " KB"
        }
        else {
            $res = ($i).ToString('f0') + " Bytes"
        }

        $res
    }
}
function getPsSum ($process) {
    $processWs = (Get-Process $process | Measure-Object -Property WS -Sum).Sum
    $processWs = (logSizeHuman($processWs))
    $processWs
}
function getWsAll {
    # Get process WorkingSet eg. getWsAll firefox -> 632MB (only some specail process, use [getWsAllNormal ] for another process)
    param(
        [ValidateSet("gvim", "node", "firefox", "chrome", "powershell", "qq*", "Code", "atom", "wechatdevtools", "mongobooster", "emacs", "EgretWing", "Postman", "webstorm64", "powershell_ise")]
        [string]
        $process 
    )
    $processWs = getPsSum($process)
    $processWs
}
function getWsAllNoraml {
    # Get process WorkingSet eg. getWsAllNoraml firefox -> 632MB 5
    param(
        [string]
        $process 
    )
    $processWs = getPsSum($process)
    $processCnt = ( Get-Process $process | Measure-Object ).Count
    $processWs
    $processCnt
}
function getLenAll ($directory) {
    # Get directory size eg. getLenAll $HOME/Desktop/jsFile -> Get jsFile/ size
    $directoryLength = (Get-ChildItem $directory -Recurse | Measure-Object -Property Length -Sum).Sum
    logSizeHuman($directoryLength)
}

function killLastPS($i) {
    # Stop-Process eg. killLastPS powershell -> kill the last start-up powershell 
    $ErrorActionPreference = "SilentlyContinue"
    Get-Process $i | Sort-Object StartTime -Descending | Select-Object -First 1 | Stop-Process 
    $ErrorActionPreference = "Continue"
}

function killLastPS_quick {
    # Stop-Process(only some special process use killLastPS for normal) eg. killPS powershell -> kill the last start-up powershell 
    param(
        [ValidateSet("explorer", "gvim", "node", "firefox", "chrome", "powershell", "qq*", "Code", "atom", "wechatdevtools", "mongobooster", "emacs")]
        [string]
        $process 
    )
    $ErrorActionPreference = "SilentlyContinue"
    Get-Process $process | Sort-Object StartTime -Descending | Select-Object -First 1 | Stop-Process 
    $ErrorActionPreference = "Continue"
}
function lastPS () {
    # Get process last start-up (not conatin Microsoft) eg. lastPS -> return 
    $ErrorActionPreference = "SilentlyContinue"
    Get-Process | Sort-Object StartTime -Descending | Select-Object -First 60 |
        Where-Object {$_.Company -ne $null} | Where-Object {$_.Company.ToString() -notmatch "Micro*"} | Get-Unique | 
        Format-Table Name, Id, @{Label = "  WS (MB)  "; Expression = {[System.Math]::Truncate($_.WS / 1Mb)}; alignment = "center";
    }, @{Name = "  StartTime  "; Expression = {($_.StartTime).ToString().split(' ')[1]}; alignment = "center";
    }, @{Label = "  Total Running time  "; Expression = {((Get-Date) - $_.StartTime).ToString().Split(".")[0]}; alignment = "center"; }, MainWindowTitle
    $ErrorActionPreference = "Continue"
}

function lastPS_containMicrosoft () {
    # Get process last start-up (conatin Microsoft) eg. lastPS -> return 
    $ErrorActionPreference = "SilentlyContinue"
    $resultArr = Get-Process | Sort-Object StartTime -Descending | Select-Object -First 60 |
        Where-Object {$_.Company -ne $null} |  Get-Unique | 
        Format-Table Name, Id, @{n = "  startTime  "; e = {$_.startTime.ToString().Split(" ")[1]}; alignment = "center";
    } , @{Label = "  Total Running time  "; Expression = {((Get-Date) - $_.StartTime).ToString().Split(".")[0]}; alignment = "center"; 
    } , @{n = "  WS (MB)  "; e = {$_.WS / 1Mb -as [int]}; }, MainWindowTitle


    $resultArr
    $ErrorActionPreference = "Continue"
}
function convertToBinary ($i) {
    [System.Convert]::ToString($i, 2) 
}

function cl() {
    # alias cd .. ; ls
    $directoryCount = (Get-ChildItem -Directory .. | Measure-Object).Count
    $fileCount = (Get-ChildItem -File .. | Measure-Object).Count
    $lastAccessTimeFile = (Get-ChildItem -File .. | Sort-Object LastAccessTime -Descending | Select-Object -First 1)
    $lastAccessTimeDirectory = (Get-ChildItem -Directory .. | Sort-Object LastAccessTime -Descending | Select-Object -First 1)
    Set-Location .. ; Get-ChildItem


    $logObj = New-Object object
    Add-Member -InputObject $logObj -Name "Directory count" -Value $directoryCount -MemberType NoteProperty
    Add-Member -InputObject $logObj -Name "File Count" -Value $fileCount  -MemberType NoteProperty
    Add-Member -InputObject $logObj -Name "lastAccessDirectory" -Value $lastAccessTimeDirectory -MemberType NoteProperty
    Add-Member -InputObject $logObj -Name "lastAccessFile" -Value $lastAccessTimeFile -MemberType NoteProperty

    Write-Host ""
    $logObj | Format-Table @{Label = "File count"; Expression = {$_."File Count"}; alignment = "center";
    }, @{Label = "Directory count"; Expression = {$_."Directory count"}; alignment = "center";
    }, @{Label = "lastAccessFile"; Expression = {$_."lastAccessFile"}; alignment = "center";
    }, @{Label = "lastAccessDirectory"; Expression = {$_."lastAccessDirectory"}; alignment = "center"; }
}
function ccl () {
    # alias cd ../.. ; ls
    $directoryCount = (Get-ChildItem -Directory ../.. | Measure-Object).Count
    $fileCount = (Get-ChildItem -File ../.. | Measure-Object).Count
    $lastAccessTimeFile = (Get-ChildItem -File ../.. | Sort-Object LastAccessTime -Descending | Select-Object -First 1)
    $lastAccessTimeDirectory = (Get-ChildItem -Directory ../.. | Sort-Object LastAccessTime -Descending | Select-Object -First 1)
    Set-Location ../.. ; Get-ChildItem


    $logObj = New-Object object
    Add-Member -InputObject $logObj -Name "Directory count" -Value $directoryCount -MemberType NoteProperty
    Add-Member -InputObject $logObj -Name "File Count" -Value $fileCount  -MemberType NoteProperty
    Add-Member -InputObject $logObj -Name "lastAccessDirectory" -Value $lastAccessTimeDirectory -MemberType NoteProperty
    Add-Member -InputObject $logObj -Name "lastAccessFile" -Value $lastAccessTimeFile -MemberType NoteProperty

    Write-Host ""
    $logObj | Format-Table @{Label = "File count"; Expression = {$_."File Count"}; alignment = "center";
    }, @{Label = "Directory count"; Expression = {$_."Directory count"}; alignment = "center";
    }, @{Label = "lastAccessFile"; Expression = {$_."lastAccessFile"}; alignment = "center";
    }, @{Label = "lastAccessDirectory"; Expression = {$_."lastAccessDirectory"}; alignment = "center"; }
    # Write-Host "Directory count:".PadLeft(25) $directoryCount "`tlastAccessDirectory:" $lastAccessTimeDirectory
    # Write-Host  "File Count:".PadLeft(25) $fileCount "`tlastAccessFile:" $lastAccessTimeFile
}

function getRandom {
    param(
        [int]$start = 0, [int]$end = 1000, [int]$count = 1
    )
    # getRandom 80 100 3 -> range(80, 100) 
    $rand = New-Object System.Random
    for ($i = 1; $i -le $count; $i++) {
        $rand.Next($start, $end)
    }
}

# [System.Enum]::GetNames([Microsoft.PowerShell.ExecutionPolicy])

function typeFile () {
    begin {
        Write-Host "begin...".PadLeft(20) -ForegroundColor Magenta
    } 
    process {
        $ele = $_
        if ($ele.Extension -ne "") {
            switch ($ele.Extension.ToLower()) {
                ".ps1" {"脚本 " + $ele.Name}
                ".txt" {"文本 " + $ele.Name}
                ".js" {"js " + $ele.Name}
            }
        }
    }

    end {
        Write-Host "end...".PadLeft(20) -ForegroundColor Green
    }
}
# <- start program.exe
function startGvim () {
    # fullscreen gvim.exe 
    Start-Process E:\UserSoft\amixVim\vim80\gvim.exe -WindowStyle Maximized
}
function startGitBash () {
    # git-bash.exe
    Start-Process 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Git\Git Bash.lnk' -Verb runAs
}
function startEmacs {
    # emacs.exe 
    Start-Process 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Gnu Emacs\Emacs.lnk'
}
function startIntellJIDEALisceseServer {
    $ideaLicenseServer = "start 'C:\Users\mydell\Desktop\IntelliJIDEALicenseServer_windows_amd64.exe - ????.lnk' -WindowStyle Hidden"
    Invoke-Expression $ideaLicenseServer    
}

function startWebstorm () {
    # webstorm.exe
    $ErrorActionPreference = "SilentlyContinue"
    startIntellJIDEALisceseServer
    Start-Sleep -Seconds 1
    Start-Process 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\JetBrains Toolbox\WebStorm.lnk'

    Start-Sleep -Seconds 80
    Stop-Process -Name IntelliJIDEALicenseServer_windows_amd64 
    $ErrorActionPreference = "Continue"
}

function startChrome () {
    # chrome.exe
    Start-Process 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe'
}
function startFirefox () {
    # firefox.exe 
    Start-Process E:\UserSoft\Firefox_64\firefox.exe
}
function startIDEA () {
    # Intellij IDEA.exe
    $ErrorActionPreference = "SilentlyContinue"
    startIntellJIDEALisceseServer
    Start-Process 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\JetBrains Toolbox\IntelliJ IDEA Ultimate.lnk'

    Start-Sleep -Seconds 80
    Stop-Process -Name IntelliJIDEALicenseServer_windows_amd64 
    $ErrorActionPreference = "Continue"
}
function startBaiduDisk {
    Invoke-Expression  "start 'C:\Users\mydell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\????\????.lnk'"
}
function startSublimeText () {
    Start-Process 'E:\UserSoft\Sublime Text 3x64\sublime_text.exe' 
}
function startPostman {
    Start-Process $Global:processPathHash.Postman
}
# program ->
function ss ($i, $contextCnt = 0, $isCaseSensitive = $false) {
    # find string eg. ss isNumeric -> find string 'isNumeric' or ss isNumeric 3 -> find string 'isNumeric' and 3 lines context
    # Get-ChildItem .\*.js -Recurse | Select-String $i -Context $contextCnt
    if ($isCaseSensitive) {
        Get-ChildItem . -Include *.js -Recurse | Select-String $i -CaseSensitive -Context $contextCnt
    }
    else {
        Get-ChildItem . -Include *.js -Recurse | Select-String $i -Context $contextCnt
    }
}

function getLenAll_kb ($directory) {
    # Get directory size eg. getLenAll $HOME/Desktop/jsFile -> Get jsFile/ size
    ((Get-ChildItem $directory -Recurse | Measure-Object -Property Length -Sum).Sum / 1Kb).ToString("f2") + " KB"
}
function findBigFile ($i) {
    # eg. findBigFile ./*.js -> find .js File and sort them 
    Get-ChildItem $i -Recurse | Sort-Object Length -Descending | Select-Object -First 20 |
        Format-Table @{Label = " Name "; Expression = {" " * 5 + $_.Name.ToString() + " " * 1}; alignment = "left";
    }, @{Label = "  Length(Kb)  "; Expression = {$_.Length / 1Kb -as [int]}; alignment = "center";
    } , @{Label = "Directory"; Expression = {$_.directory.ToString().substring((Get-Location).Path.Length)}}
    $totalLength = (getLenAll .)
    Write-Host "Total recurse:" $totalLength
    Write-Host ""
}

function getSortedPS {
    # show process totalRuningTime and startTime
    $result = (Get-Process | Sort-Object WorkingSet -Descending |
            Select-Object -First $args[0] |
            Format-Table @{Label = " Name"; Expression = {" " * 3 + $_.Name + " " * 1};
        }, Id, @{Label = "  WS (MB)  "; Expression = {[System.Math]::Truncate($_.WS / 1mb)}; alignment = "center";
        }, @{Name = "  StartTime  "; Expression = {($_.StartTime).ToString().split(' ')[1]}; alignment = "center";
        }, @{Label = "  Total Running time  "; Expression = {((Get-Date) - $_.StartTime).ToString().Split(".")[0]}; alignment = "center"; } 
    );
    # Write-Host "First " " $args ";
    $result
}

function ed {
    # if current path has only 1 directory, then cd & ls eg. ed
    $FileAndDirectory = Get-ChildItem | Measure-Object
    $directory = Get-ChildItem -Directory | Measure-Object

    $directoryCount = (Get-ChildItem -Directory . | Measure-Object).Count
    $fileCount = (Get-ChildItem -File . | Measure-Object).Count
    $lastAccessTimeFile = (Get-ChildItem -File . | Sort-Object LastAccessTime -Descending | Select-Object -First 1)
    $lastAccessTimeDirectory = (Get-ChildItem -Directory . | Sort-Object LastAccessTime -Descending | Select-Object -First 1)

    if (($FileAndDirectory.Count -eq 1) -and ($directory.Count -eq 1)) {
        Set-Location *
        Get-ChildItem
        Write-Host ""
        Write-Host "Directory count:".PadLeft(25) $directoryCount "   File Count:" $fileCount
        Write-Host "lastAccessFile:".PadLeft(25) $lastAccessTimeFile " lastAccessDirectory:" $lastAccessTimeDirectory
    }
    else {
        Write-Host ""
        Write-Host "Directory count:".PadLeft(25) $directoryCount "   File Count:" $fileCount
        Write-Host "lastAccessFile:".PadLeft(25) $lastAccessTimeFile " lastAccessDirectory:" $lastAccessTimeDirectory
    }
}

function recentlyChangeFile ([int]$weekCnt) {
    # file change in 2 weeks
    if ($weekCnt -ne $null) {
        Get-ChildItem | Where-Object {$_.CreationTime -gt (Get-Date).AddDays(-14)}
    }

    Get-ChildItem | Where-Object {$_.CreationTime -gt (Get-Date).AddDays($weekCnt * (-7))}
}

function logPersonalAlias () {
    # only log can not work
    Set-Alias rcf recentlyChangeFile
}

function eld {
    # enter lastAccessDirectory
    $lastAccessTimeDirectory = (Get-ChildItem -Directory . | Sort-Object LastAccessTime -Descending | Select-Object -First 1)
    if ($lastAccessTimeDirectory -ne $null) {
        Set-Location $lastAccessTimeDirectory
    }
    else {
        Write-Host "`tno directory!" -ForegroundColor Yellow
    }
    Get-ChildItem

    $lastAccessTimeDirectory = (Get-ChildItem -Directory . | Sort-Object LastAccessTime -Descending | Select-Object -First 1)
    $lastAccessTimeFile = (Get-ChildItem -File . | Sort-Object LastAccessTime -Descending | Select-Object -First 1)
    $directoryCount = (Get-ChildItem -Directory . | Measure-Object).Count
    $fileCount = (Get-ChildItem -File . | Measure-Object).Count

    $logObj = New-Object object
    Add-Member -InputObject $logObj -Name "Directory count" -Value $directoryCount -MemberType NoteProperty
    Add-Member -InputObject $logObj -Name "File Count" -Value $fileCount  -MemberType NoteProperty
    Add-Member -InputObject $logObj -Name "lastAccessDirectory" -Value $lastAccessTimeDirectory -MemberType NoteProperty
    Add-Member -InputObject $logObj -Name "lastAccessFile" -Value $lastAccessTimeFile -MemberType NoteProperty

    Write-Host ""
    $logObj | Format-Table @{Label = "File count"; Expression = {$_."File Count"}; alignment = "center";
    }, @{Label = "Directory count"; Expression = {$_."Directory count"}; alignment = "center";
    }, @{Label = "lastAccessFile"; Expression = {$_."lastAccessFile"}; alignment = "center";
    }, @{Label = "lastAccessDirectory"; Expression = {$_."lastAccessDirectory"}; alignment = "center"; }
}

function slf {
    # start-process lastAccessFile
    $lastAccessTimeFile = (Get-ChildItem -File . | Sort-Object LastAccessTime -Descending | Select-Object -First 1)
    Start-Process $lastAccessTimeFile
}

function computerInfo {
    $computerName = (Get-WmiObject -Class Win32_ComputerSystem).Name
    # or use: $env:COMPUTERNAME
    $computerVersion = (Get-WmiObject -Class Win32_OperatingSystem -ComputerName $computerName).Version
    # or use: $computerVersion = (node -p os.release())

    $freeMem = (Get-WmiObject -Class Win32_OperatingSystem).FreePhysicalMemory / 1mb
    # or use: $freeMemo = (node -p "os.freemem()") / 1gb
    $totalMem = (Get-WmiObject -Class Win32_ComputerSystem).TotalPhysicalMemory / 1gb

    $freeMem = ("{0:n2}" -f $freeMem) + " GB"
    # or use $totalMem = "{0:n3}" -f $totalMem
    $totalMem = $totalMem.ToString("f2")

    # Write-Host  "ComputerName: ".PadLeft(25) $computerName -ForegroundColor Green
    # Write-Host " ComputerVersion: ".PadLeft(25) $computerVersion
    # Write-Host "Username: ".PadLeft(25) $env:USERNAME
    # Write-Host "FreeMemory: ".PadLeft(25) $freeMem "GB"
    # Write-Host " TotolMemory: ".PadLeft(25) $totalMem "GB"

    $App = Get-WmiObject -Class Win32_OperatingSystem
    foreach ($item in $App) {  
        # Write-Host "ComputerName" $item.CSName  
        # Write-Host "SystemName" $item.Caption  
        # Write-Host "Version" $item.Version  
        # Write-Host "BuildType" $item.BuildType  
        # Write-Host "SerialNumber" $item.SerialNumber  
        # Write-Host "OSArchitecture" $item.OSArchitecture  
        # Write-Host "VirtualMemroySize" ("{0:N2}" -f ($item.TotalVirtualMemorySize / 1MB))"GB"  
        Write-Host "PhysicalMemory" ("{0:N2}" -f ($item.TotalVisibleMemorySize / 1MB))"GB"  
    } 

    $VirtualMemroySize = ($item.TotalVirtualMemorySize / 1MB).ToString('f2') + " GB"
    $PhysicalMemory = ($item.TotalVisibleMemorySize / 1MB).ToString('f2') + " GB"
    $computerInfoObj = New-Object object
    Add-Member -InputObject $computerInfoObj -Name  "ComputerName" -Value $item.CSName -MemberType NoteProperty
    Add-Member -InputObject $computerInfoObj -Name  "SystemName" -Value $item.Caption -MemberType NoteProperty
    Add-Member -InputObject $computerInfoObj -Name  "Version" -Value $item.Version -MemberType NoteProperty
    Add-Member -InputObject $computerInfoObj -Name  "BuildType" -Value $item.BuildType -MemberType NoteProperty
    Add-Member -InputObject $computerInfoObj -Name  "SerialNumber" -Value $item.SerialNumber -MemberType NoteProperty
    Add-Member -InputObject $computerInfoObj -Name  "OSArchitecture" -Value $item.OSArchitecture -MemberType NoteProperty
    Add-Member -InputObject $computerInfoObj -Name  "VirtualMemroySize" -Value $VirtualMemroySize -MemberType NoteProperty
    Add-Member -InputObject $computerInfoObj -Name  "PhysicalMemory" -Value $PhysicalMemory -MemberType NoteProperty
    Add-Member -InputObject $computerInfoObj -Name  "FreeMemory" -Value $freeMem -MemberType NoteProperty

    $propName = New-Object System.Collections.ArrayList
    $computerInfoMap = @{
        "ComputerName"    = $item.CSName ;
        "SystemName"      = $item.Caption;
        "Version"         = $item.Version;
        BuildType         = $item.BuildType ;
        SerialNumber      = $item.SerialNumber ;
        OSArchitecture    = $item.OSArchitecture ;
        VirtualMemroySize = $VirtualMemroySize ;
        PhysicalMemory    = $PhysicalMemory ;
        FreeMemory        = $freeMem;
    }
    $computerInfoMap
    # $propName.Add("ComputerName")
    # $propName.Add("SystemName")
    # $propName.Add("Version")

    # $obj = new-object object
    # Add-Member -InputObject $obj -Name  "ComputerName" -Value $item.CSName -MemberType NoteProperty
    # $propName.Add($obj)

    # $obj2 = new-object object
    # Add-Member -InputObject $obj2 -Name  "SystemName" -Value $item.Caption -MemberType NoteProperty
    # $propName.Add($obj2)
    
    # $propName
    $computerInfoObj
}

function Convert-Size {            
    # eg. Convert-Size -From GB -To KB 1024 -> 1073741824
    [cmdletbinding()]            
    param(            
        [validateset("Bytes", "KB", "MB", "GB", "TB")]            
        [string]$From,            
        [validateset("Bytes", "KB", "MB", "GB", "TB")]            
        [string]$To,            
        [Parameter(Mandatory = $true)]            
        [double]$Value,            
        [int]$Precision = 4            
    )            
    switch ($From) {            
        "Bytes" {$value = $Value }            
        "KB" {$value = $Value * 1024 }            
        "MB" {$value = $Value * 1024 * 1024}            
        "GB" {$value = $Value * 1024 * 1024 * 1024}            
        "TB" {$value = $Value * 1024 * 1024 * 1024 * 1024}            
    }            
            
    switch ($To) {            
        "Bytes" {return $value}            
        "KB" {$Value = $Value / 1KB}            
        "MB" {$Value = $Value / 1MB}            
        "GB" {$Value = $Value / 1GB}            
        "TB" {$Value = $Value / 1TB}            
            
    }            
            
    return [Math]::Round($value, $Precision, [MidPointRounding]::AwayFromZero)            
}
function getParentsPs ($i) {
    # eg. getParentsPs gvim -> found gvim.exe parents powershell
    $ErrorActionPreference = "SilentlyContinue"
    $process = Get-Process -Name $i
    $id = $process.Id  
    $instance = Get-CimInstance Win32_Process -Filter "ProcessId = '$id'"  
    $instance.ParentProcessId  
    $parentProcess = Get-Process -Id $instance.ParentProcessId  
    if ($parentProcess) {
        $parentProcess  
    }
    else {
        Write-Host "no exist!"
    }
    $ErrorActionPreference = "Continue"
}

function recycleBin ($relativePath) {
    # move to recycleBin eg. recyleBin ./file1.js -> delete file1.js move to recyclyeBin
    $shell = New-Object -ComObject 'Shell.Application' 
    $item = $shell.Namespace(0).parseName((Resolve-Path $relativePath).Path)
    $item.InvokeVerb('delete')
}

function identity ($i) {
    # return itself
    $i 
}
function clearFullScreen {
    # Clear-Host
    $RawUI = $Host.UI.RawUI
    $RawUI.CursorPosition = @{X = 0; Y = 0}
    $RawUI.SetBufferContents(
        @{Top = -1; Bottom = -1; Right = -1; Left = -1},
        @{Character = ' '; ForegroundColor = $rawui.ForegroundColor; BackgroundColor = $rawui.BackgroundColor})
}
function enumeratorColor {
    # 
    for ($i = 0; $i -lt 16; $i++) {
        $color = [ConsoleColor]$i
        Write-Host -Object $color -BackgroundColor $i
    }
}
function changeScreen {
    # 
    $RawUI = $Host.UI.RawUI
    $RawUI.CursorPosition = @{X = 0; Y = 0}
    $consoleColorArr = [System.Enum]::GetNames([System.ConsoleColor])
    $RawUI.SetBufferContents(
        @{Top = -1; Bottom = -1; Right = -1; Left = -1},
        @{Character = ' '; ForegroundColor = $consoleColorArr | Get-Random ; BackgroundColor = $consoleColorArr | Get-Random})
}
function sample ([array]$arr, [int]$cnt) {
    if ($cnt) {
        $arr | Get-Random -Count $cnt
    }
    else {
        $arr | Get-Random -Count $arr.Count 
    }
}
function coverScreen {
    # cover screen with random string
    $start = getRandom 120 200
    $end = $start + 20
    $printStr = -join ($Global:myStr1.GetEnumerator() | Get-Random -Count 5)
    $randomArr = sample( $start..$end )

    (Get-Date).ToString()
    $randomArr | ForEach-Object {$printStr * $_}
}
function addSimpleNote {
    param(
        [ValidateCount(0, 2)]
        $noteArr
    )
    Add-Content -Path E:\DataIn\MyNote\tmpNote.js -Value ('"' + $noteArr[0] + '"' + ':' + '"' + $noteArr[1] + '",') -Encoding UTF8
}

function addEnglishWords {
    # eg. addEnglishWords 'staff','工作人员'
    param(
        [ValidateCount(0, 2)]
        $noteArr
    )
    Add-Content -Path E:\DataIn\MyNote\tmpEnglish.js -Value ('"' + $noteArr[0] + '"' + ': ' + '"' + $noteArr[1] + '",') -Encoding UTF8
    Get-Content -Path E:\DataIn\MyNote\tmpEnglish.js | more
}

function bd {
    # eg. bd powershellAPI -> baidu.com search powershellAPI
    param(
        $keyWord
    )
    if ($keyWord -ne $null) {
        Start-Process https://www.baidu.com/s?wd=$keyWord
    }
    else {
        Start-Process https://www.baidu.com/
    }
}
function bk {
    # eg. bk powershell -> baidubaike search powershell
    param(
        $keyWord
    )
    if ($keyWord -ne $null) {
        start-process https://baike.baidu.com/item/$keyWord
    }
    else {
        Start-Process https://baike.baidu.com/
    }
}
function g2 {
    # eg. g2 powershellAPI -> google.com search powershellAPI
    param(
        $keyWord
    )
    if ($keyWord -ne $null) {
        Start-Process https://www.google.com/search?q=$keyWord
    }
    else {
        Start-Process https://www.google.com/
    }
}
function testBound {
    param(
        $firstA,
        $secondA
    ) 

    $PSBoundParameters
}
function saveCurrentPath () {
    # eg. saveCurrentPath 
    $Global:lastAccessPath = (Get-Location).Path
    $Global:lastAccessPath | clip
    $Global:lastAccessPath
}
function isVariableNull ($i) {
    # eg. isVariableNull $testVariable -> True
    $i -eq $null 
}
function someConstantVariable {
    $variable1 = [System.Globalization.DateTimeFormatInfo]::CurrentInfo 
}
function bookmarksOfChrome {
    $bookmarks_path = 'C:\Users\mydell\AppData\Local\Google\Chrome\User Data\Default\Bookmarks'
    $bookmarks_json = ConvertFrom-Json ((Get-Content $bookmarks_path -Encoding UTF8 ) | Out-String)
    $bookmarks_longArr = $bookmarks_json.roots.bookmark_bar.children

    $bookmarks_titleArr = $bookmarks_longArr | ForEach-Object {$_.children} | ForEach-Object {$_.Name}
    $bookmarks_titleAndUrlArrTmp = $bookmarks_longArr | ForEach-Object {$_.children} |  Select-Object Name, url 

    $bookmarksFirstLevelDirectory = $bookmarks_longArr | Select-Object Name

    $bookmarks_titleAndUrlArr1 = $bookmarks_longArr | ForEach-Object {$_.children} | Where-Object {$_.children -eq $null} | Select-Object Name, url 
    $bookmarks_titleAndUrlArr2 = $bookmarks_longArr | ForEach-Object {$_.children} | Where-Object {$_.children -ne $null} | ForEach-Object {$_.children} | Where-Object {$_.children -eq $null} | Select-Object Name, url 

    $bookmarks_titleAndUrlArr = $bookmarks_titleAndUrlArr1 + $bookmarks_titleAndUrlArr2


    @($bookmarks_titleArr, $bookmarks_titleAndUrlArr, $bookmarks_longArr)
}
function searchBookmarksOfChrome {
    param(
        [string]
        $keyWord
    ) 

    $bookmarks = bookmarksOfChrome | Select-Object -Index 1
    $result = $bookmarks | Where-Object {$_.Name -like "*$keyWord*"}

    ($result | Select-Object -First 1 | Select-Object url).url | clip.exe
    $result 
}
function deepMap {
    # Error!
    param(
        [array]
        $objectArray
    ) 

    $res = New-Object System.Collections.ArrayList
    $deepArr = New-Object System.Collections.ArrayList

    foreach ($i in $objectArray) {
        if ($i.url -ne $null) {
            # Write-Host 'no children'
            $res.Add(($i | Select-Object Name, url))
            # $res | Select-Object -Last 1
        }
        else {
            # "i: "
            # $i
            # Write-Host 'has children'
            $deepArr.Add($i.children)
            # "deepArr: "
            # $deepArr | Select-Object -Last 1
        }
    }

    if ($deepArr.Count -gt 0) {
        deepMap($deepArr)
    }

    $res;
}
function uploadComputerTime2 {
    # from computer start to current
    New-TimeSpan -End ([datetime]::Now) -Start (Get-Content E:\DataIn\SettingPowershell\tmpStartInfo.txt) -ErrorAction SilentlyContinue | Format-Table 
}
function addFavoritePath {
    # eg. addFavouritePath powershell, E:\DataIn\PowershellData
    param(
        [ValidateCount(0, 2)]
        $pathArr
    )
    Add-Content -Path E:\DataIn\SettingPowershell\tmpFavouritePath.txt  -Value ('"' + $pathArr[0] + '"' + ': ' + '"' + $pathArr[1] + '",') -Encoding UTF8
    Get-Content -Path E:\DataIn\SettingPowershell\tmpFavouritePath.txt | more
}
# function getFavouritePath {
#     Get-Content -Path E:\DataIn\SettingPowershell\tmpFavouritePath.txt -Encoding UTF8 
# }
function addBrackets {
    param(
        [string]
        $word
    ) 

    "(" + $word + ")" | clip
    "(" + $word + ")" 
}
function getType2 {
    param(
        [string]
        $word
    ) 
    $res = addBrackets $word
    $res = $res + ".GetType()"
    $res | clip
    $res
}
function riRecent {
    # move recnetly $cnt file to reclycleBin eg. riRecnet 3 -> recycleBin 3 files recently
    param(
        [int]
        $cnt
    )

    $willBeRomoveFile = Get-ChildItem | Sort-Object LastAccessTime -Descending | Select-Object -First $cnt
    $willBeRomoveFile 
    Write-Host " "
    Write-Host " "
    Write-Host "Do you want to delete this $cnt files ? "
    Pause
    Write-Host " "
    Write-Host " "
    $willBeRomoveFilePath = $willBeRomoveFile.fullname
    $willBeRomoveFile | Remove-Item -WhatIf -Verbose
    $willBeRomoveFilePath | ForEach-Object {recycleBin $_}
    Write-Host " "
    Write-Host " "
    Get-ChildItem | Sort-Object LastAccessTime -Descending | Select-Object -First 3 
}