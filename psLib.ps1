. E:\DataIn\PowershellScriptData\globalVariable.ps1
. E:\DataIn\PowershellScriptData\zPsLang\lang.ps1
. E:\DataIn\PowershellScriptData\commonPsLib.ps1
# utils
. E:\DataIn\PowershellScriptData\utils\search.ps1
. E:\DataIn\PowershellScriptData\utils\translate.ps1
. E:\DataIn\PowershellScriptData\utils\quickSend163Email.ps1
. E:\DataIn\PowershellScriptData\utils\note.ps1
. E:\DataIn\PowershellScriptData\utils\webRequest.ps1

# clip
'ipal $myPslibFilePath.aliasFilePath -Force' | clip

# setting
$Host.UI.RawUI.WindowTitle = '*\(*^_^*)/*' + '    ' + (date)

enum ProgramEnum {
    gvim
    firefox
    chrome
    powershell
    qq
    Code
    gitBash
    wechatdevtools
    mongobooster

    emacs
    EgretWing
    Postman
    webstorm64
    IDEA
    powershell_ise
    Everything
    WeChat
    baidunetdisk            
    sublime_text

    notepad
    Wox
    BingDict
    kuaibu
    PotPlayerMini64   
    ConEmu64          
    node
    FSViewer          
    Weather
    Photos
    News

    SumatraPDF              
    toolbox
    PaintStudio
    KanKan
    mspaint                 
    Explorer                
    Thunder                 
    QQLive                  
    cmd
    PxCook                  
    Bandizip                
    Xampp                   
    ChsIME                  

    devenv                  
    python                  
    rider64
    pycharm64           
    MicrosoftEdge           
    mip                     
    WXWork                  
}

# Function

function he {
    help $args[0] -Examples
    $ErrorActionPreference = "SilentlyContinue"
    if ($args[0] -match "-") {
        Get-Alias -Definition $args[0]
    }
    $ErrorActionPreference = "Continue"
}

function getHistoryMatchChinese() {
    Get-History | Where-Object {[int[]][char[]]$_.CommandLine.ToString() -ge 255}
}

function wsAll {
    # Get process WorkingSet eg. wsAll firefox -> 632MB (only some specail process, use [getWsAllNormal ] for another process)
    param(
        [ProgramEnum]
        $pg
    )

    function isProcessRunning {
        param(
            [string]
            $process
        )
        
        if ( ( Get-Process | Where-Object {$_.Name -eq $process} ) -ne $null ) {
            $true
        }
        else {
            $false
        }
    }

    $process = handleSpeicalSymbol $pg
    if ( isProcessRunning $process ) {
        $processWs = getPsSum($process)
        $processWs
    }
    else {
        $maybeRes = [enum]::GetNames([ProgramEnum]) |
            Where-Object {$_.toLower().StartsWith($process.Substring(0, 1).toLower())} |
            Where-Object {isProcessRunning $_}
        if ( $maybeRes -ne $null ) {
            Write-Host "`nDo you mean?`n"
            $maybeRes
            Write-Host ""
        }
        else {
            Write-Host "`nNo such process!`n"
        }
    }
}
function wsAllNoraml {
    # Get process WorkingSet eg. wsAllNoraml firefox -> 632MB 5
    param(
        [string]
        $process 
    )
    $processWs = getPsSum($process)
    $processCnt = ( Get-Process $process | Measure-Object ).Count
    $processWs
    $processCnt
}

function lastPS {
    # Get process last start-up ( has MainWindowTitle) eg. lastPS -> return 
    $ErrorActionPreference = "SilentlyContinue"
    Get-Process | Where-Object {$_.MainWindowTitle.ToString().Length -ne 0} | Sort-Object StartTime -Descending |
        Format-Table Name, Id, @{Label = "  WS (MB)  "; Expression = {logSizeHuman $_.WS}; alignment = "center";
    }, @{Name = "  StartTime  "; Expression = {($_.StartTime).ToString().split(' ')[1]}; alignment = "center";
    }, @{Label = "  Total Running time  "; Expression = {((Get-Date) - $_.StartTime).ToString().Split(".")[0]}; alignment = "center"; }, MainWindowTitle
    $ErrorActionPreference = "Continue"
}
function killLastPS_quick {
    # Stop-Process(only some special process use killLastPS for normal) eg. killPS powershell -> kill the last start-up powershell 
    param(
        [ProgramEnum]
        $pg
    )
    $process = handleSpeicalSymbol $pg

    $ErrorActionPreference = "SilentlyContinue"
    if ($process.ToLower() -eq 'explorer') {
        Get-Process $process | Where-Object {$_.MainWindowTitle -ne ''} | Sort-Object StartTime -Descending | Select-Object -First 1 | Stop-Process
    }
    else {
        Get-Process $process | Sort-Object StartTime -Descending | Select-Object -First 1 | Stop-Process 
    }
    $ErrorActionPreference = "Continue"
}
function lastPS_notContainMs () {
    # Get process last start-up (not conatin Microsoft) eg. lastPS_notContainMs  -> return 
    $ErrorActionPreference = "SilentlyContinue"
    Get-Process | Sort-Object StartTime -Descending | Select-Object -First 60 |
        Where-Object {$_.Company -ne "Microsoft Corporation" } | Get-Unique | 
        Format-Table Name, Id, @{Label = "  WS (MB)  "; Expression = {  }; alignment = "center";
    }, @{Name = "  StartTime  "; Expression = {($_.StartTime).ToString().split(' ')[1]}; alignment = "center";
    }, @{Label = "  Total Running time  "; Expression = {((Get-Date) - $_.StartTime).ToString().Split(".")[0]}; alignment = "center"; }, MainWindowTitle
    $ErrorActionPreference = "Continue"
}

function lastPS_containMicrosoft () {
    # Get process last start-up (conatin Microsoft) eg. lastPS_containMicrosoft -> return 
    $ErrorActionPreference = "SilentlyContinue"
    $resultArr = Get-Process | Sort-Object StartTime -Descending | Select-Object -First 60 | Get-Unique | 
        Format-Table Name, Id, @{n = "  startTime  "; e = {$_.startTime.ToString().Split(" ")[1]}; alignment = "center";
    } , @{Label = "  Total Running time  "; Expression = {((Get-Date) - $_.StartTime).ToString().Split(".")[0]}; alignment = "center"; 
    } , @{n = "  WS (MB)  "; e = {$_.WS / 1Mb -as [int]}; }, MainWindowTitle


    $resultArr
    $ErrorActionPreference = "Continue"
}

function cl() {
    # alias cd .. ; ls
    $directoryCount = (Get-ChildItem -Directory .. | Measure-Object).Count
    $fileCount = (Get-ChildItem -File .. | Measure-Object).Count
    $lastAccessTimeFile = (Get-ChildItem -File .. | Sort-Object LastAccessTime -Descending | Select-Object -First 1)
    $lastAccessTimeDirectory = (Get-ChildItem -Directory .. | Sort-Object LastAccessTime -Descending | Select-Object -First 1)

    Set-Location ..
    if ($fileCount -gt 53 -or $directoryCount -gt 53) {
        Get-ChildItemColor | Sort-Object LastAccessTime -Descending | more
    }
    else {
        Get-ChildItemColor
    }


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

    Set-Location ../.. 
    if ($fileCount -gt 53 -or $directoryCount -gt 53) {
        Get-ChildItemColor | Sort-Object LastAccessTime -Descending | more
    }
    else {
        Get-ChildItemColor
    }


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


# [System.Enum]::GetNames([Microsoft.PowerShell.ExecutionPolicy])

function typeFile () {
    begin {
        Write-Host "begin...".PadLeft(20) -ForegroundColor Magenta
    } 
    process {
        $ele = $_
        if ($ele.Extension -ne "") {
            switch ($ele.Extension.ToLower()) {
                ".ps1" {"èæ¬ " + $ele.Name}
                ".txt" {"ææ¬ " + $ele.Name}
                ".js" {"js " + $ele.Name}
            }
        }
    }

    end {
        Write-Host "end...".PadLeft(20) -ForegroundColor Green
    }
}
# <- start program.exe
function pg {
    # pg gvim
    param(
        [ProgramEnum]
        $pg,
        [string]
        $filename
    )

    $process = handleSpeicalSymbol $pg

    if ($filename) {
        if (Test-Path $filename) {
            $filename = (Get-Item $filename).FullName
        }
        elseif ($filename -eq '1') {
            $filename = ( Get-ChildItem -File . | Sort-Object LastAccessTime -Descending | Select-Object -First 1 ).FullName
        }
    }

    switch ($process) {
        gvim { 
            if ($filename) {
                Start-Process $Global:programPathHash[$process] $filename -WindowStyle Maximized 
            }
            else {
                Start-Process $Global:programPathHash[$process] -WindowStyle Maximized 
            }
        }
        gitBash { 
            Start-Process $Global:programPathHash[$process] -Verb runAs
            $path = (Get-Location).Path
            $path = changeCRLFToLF $path
            $path = "cd " + $path
            $path | clip.exe
        }
        powershell { Start-Process $Global:programPathHash[$process] -Verb runAs }
        powershell_ise { Start-Process $Global:programPathHash[$process] -Verb runAs }
        firefox {
            if ($filename) {
                Start-Process $Global:programPathHash[$process] $filename 
            }
            else {
                Start-Process $Global:programPathHash[$process] 
            }
        }
        Default { Start-Process $Global:programPathHash[$process] }
    }
}
# program ->
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
    $consoleColorArr = [System.Enum]::GetNames([System.ConsoleColor])
    $RawUI.CursorPosition = @{X = 0; Y = 0}
    $RawUI.SetBufferContents(
        @{Top = -1; Bottom = -1; Right = -1; Left = -1},
        @{Character = ' '; ForegroundColor = $consoleColorArr | Get-Random ; BackgroundColor = $consoleColorArr | Get-Random})
}
function loopChangeScreen {
    '$Host.UI.RawUI.ForegroundColor = "Gray"' | clip
    $RawUI = $Host.UI.RawUI
    $consoleColorArr = [System.Enum]::GetNames( [System.ConsoleColor] )
    $interval = getRandom -start 1 -end 30 -count 60000
    $interval | ForEach-Object { $RawUI.ForegroundColor = $consoleColorArr | Get-Random ; coverScreen; Start-Sleep -Milliseconds $_ ; changeScreen }
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

function testBound {
    param(
        $firstA,
        $secondA
    ) 

    $PSBoundParameters
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
    $bookmarks_titleAndUrlArr2 = $bookmarks_longArr | ForEach-Object {$_.children} |
        Where-Object {$_.children -ne $null} | ForEach-Object {$_.children} | Where-Object {$_.children -eq $null} | Select-Object Name, url 

    $bookmarks_titleAndUrlArr = $bookmarks_titleAndUrlArr1 + $bookmarks_titleAndUrlArr2


    @($bookmarks_titleArr, $bookmarks_titleAndUrlArr, $bookmarks_longArr)
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
function riRecent {
    # move recnetly $cnt file to reclycleBin eg. riRecnet 3 -> recycleBin 3 files recently
    param(
        [int]
        $cnt
    )
   
    begin {
        $willBeRomoveFile = Get-ChildItem | Sort-Object LastAccessTime -Descending | Select-Object -First $cnt
        $willBeRomoveFile 
        $currentFileCnt = (Get-ChildItem | Measure-Object).Count
    }

    process {
        if ($willBeRomoveFile -eq $null) {
            Write-Host " None!"
            return
        }
        elseif ($currentFileCnt -lt $cnt) {
            Write-Host " Fail... File count only $currentFileCnt"
            return
        }
        Write-Host " "
        Write-Host " "
        Write-Host "Do you want to delete this $cnt files ? "
        Pause
        Write-Host " "
        Write-Host " "
        $willBeRomoveFilePath = $willBeRomoveFile.fullname
        $willBeRomoveFile | Remove-Item -WhatIf -Verbose
        Start-Sleep -Seconds 1
        $willBeRomoveFilePath | ForEach-Object {recycleBin $_}
    }
   
    end {
        Write-Host " "
        Write-Host " "
        Get-ChildItem | Sort-Object LastAccessTime -Descending | Select-Object -First 3 
    }
    
}
function reCallHistory {
    param(
        [int]
        $cnt
    ) 

    $historyCnt = (Get-History | Measure-Object).Count
    if ($historyCnt -lt $cnt) {
        Write-Host " None!"
        Write-Host " History count only $historyCnt !"
        return
    }
    Get-History | Select-Object -Last $cnt | ForEach-Object {Invoke-History $_}
    
    '. $myPslibFilePath.psLibFilePath' | clip
}
function script:Append-Path( [string]$path ) {
    if (-not [string]::isNullOrEmpty($path)) {
        if ( (Test-Path) -and (-not $env:PATH.contains($Path)) ) {
            $env:PATH += ";" + $path
        }
    }
}
function local:Get-ShortenedPath {
    param(
        [string]
        $path
    )
    $loc = $path.Replace($HOME, '~')
    # remove prefix for UNC paths
    $loc = $loc -replace '^[^:]+::', ''
    # make path shorter like tabs in Vim,
    # handle paths starting with \\ and . correctly
    return ($loc -replace '\\(\.?)([^\\])[^\\]*(?=\\)', '\$1$2')
}
function IsAdminUser {
    if ( [Environment]::OSVersion.Platform -eq 'Win32NT' ) {
        $id = [Security.Principal.WindowsIdentity]::GetCurrent()
        $p = New-Object Security.Principal.WindowsPrincipal($id)
        return $p.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
    }
    return $false
}

# function ctc([double]$num) {  
#     $s = $num.ToString("#L#E#D#C#K#E#D#C#J#E#D#C#I#E#D#C#H#E#D#C#G#E#D#C#F#E#D#C#.0B0A")  
#     $d = [Regex]::Replace($s, '((?<=-|^)[^1-9]*)|((?''z''0)[0A-E]*((?=[1-9])|(?''-z''(?=[F-L\.]|$))))|((?''b''[F-L])(?''z''0)[0A-L]*((?=[1-9])|(?''-z''(?=[\.]|$))))', '${b}${z}')  
#     [Regex]::Replace($d, ".", {param($str)"负元空零壹贰叁肆伍陆柒捌玖空空空空空空空分角拾佰仟萬億兆京垓秭穰"[[int][char]$str.Value - [int][char]'-'].ToString()})  
# } 
function rmExculeConfig {
    # move dist/ to reclyeBin exclude *config*
    # Set-Location 'E:\DataIn\WorkFor\bubuweiying\wxapp_bubuweiying\dist'
    # Set-Location 'E:\DataIn\VScodeData\newTestXiaoChengXu\testWepy\project2\dist'
    $ErrorActionPreference = "SilentlyContinue"
    # Remove-Item * -Recurse -Exclude *config*
    'rm -r `ls | grep -v *config*`' | clip
    $ErrorActionPreference = "Continue"
}
function rmDistByShell {
    'rm -r `ls | grep -v *config*`' | clip
}

filter Get-ProcessOwner {
    $id = $_.ID
    $info = (Get-WmiObject -Class Win32_Process -Filter "Handle=$id").GetOwner()
    if ($info.ReturnValue -eq 2) {
        $owner = '[Access Denied]'
    }
    else {
        $owner = '{0}\{1}' -f $info.Domain, $info.User
    }
    $_ | Add-Member -MemberType NoteProperty -Name Owner -Value $owner -PassThru
}

function  getProcessOwner {
    param(
        $process
    ) 
    Get-Process $process | Get-ProcessOwner | Select-Object -Property Name, ID, Owner
}
function sll {
    param(
        [string]
        $location,
        [ValidateSet("e", "g", "b", "s", "md", "ni",
            "np", "st", "slf", "groupExtension", "path",
            "saveCurrentPath")]
        [string]
        $openType
    ) 

    Set-Location $location
    $cnt = (Get-ChildItem | Measure-Object).Count
    $fileCnt = (Get-ChildItem -File | Measure-Object).Count
    $directoryCnt = (Get-ChildItem -Directory | Measure-Object).Count
    if ($cnt -gt 53) {
        Get-ChildItemColor | Sort-Object LastAccessTime -Descending | more
        Write-Host ''
        @($fileCnt, $directoryCnt, $cnt) -join '/'
    }
    else {
        Get-ChildItem | Sort-Object LastAccessTime -Descending | Get-ChildItemColor
        Write-Host ''
        @($fileCnt, $directoryCnt, $cnt) -join '/'
    }


    $fileName = ( Get-ChildItem -File . | Sort-Object Length | Select-Object -First 1 ).fullname

    function openFile {
        param(
            [ProgramEnum]
            $pg
        )

        $process = handleSpeicalSymbol $pg
        Start-Process $Global:programPathHash[$process] $fileName
    }

    switch ($openType) {
        'e' { explorer.exe . }
        'g' { pg gvim }

        'b' { quickStartGitBash }
        's' { Get-ChildItemColor | Sort-Object LastAccessTime -Descending | Select-Object -First 3 }

        'md' { New-Item -ItemType Directory -Name (genRandomStr) }
        'ni' { New-Item -ItemType File -Name (genRandomStr) }


        'np' { openFile([ProgramEnum]"notepad") }
        'st' { openFile([ProgramEnum]"sublime_text") }

        'slf' { slf }
        'groupExtension' {
            Get-ChildItem | Group-Object Extension | Sort-Object Count -Descending | Format-Table -Wrap
        }
        'path' {
            zs path
        }
        'saveCurrentPath' {
            saveCurrentPath
        }
        Default {}
    }
}

function reNameWithPinying {
    # rename  eg. reNameWithPinyin 文档2 -> w文档2
    param(
        [System.IO.FileSystemInfo]
        $item,
        [string]
        $firstAlpha
    ) 

    $oldName = $item.Name
    $oldFullname = $item.FullName
    if ([int][char]$oldName[0] -le 255) {
        return
    }
    else {
        $newName = $firstAlpha + $oldName
        Rename-Item $oldFullname $newName
    }
}


function chineseToPinyin {
    # change Chinese characters to pinyin eg. chineseToPinyin '汉字' -> h
    param(
        [string]
        $word
    )

    $res = ( node F:\Material\Github_down\javascript\webUtils\test\pinying.js $word )

    if ($res.Length -gt 1) {
        $res.toLower().Substring(0, 2)
    }
}

function xm () {
    # 项目 xiang mu
    param(
        [ValidateSet("yx")]
        [string]
        $i
    )

    switch ($i) {
        AppId { "wx2ab56f448b56ce6a" | clip}
        yx { $Global:myMsg.yx | clip }
    }
}

function zs {
    param(
        [ValidateSet("path", "reNamePinyin_quick", "reNamePinyin_recuresDeepPath2",
            "gTools", "eazydict", "testJs", "reStart", "searchResultPath", "phone",
            "tapd")]
        [string]
        $type
    )

    $paramStr = ($args -join '')
    $paramStrWithBlank = ($args -join ' ')
    $paramArr = $args

    switch ($type) {
        path { 
            # window path to git-bash path
            saveCurrentPath            
            $res = changeCRLFToLF  $Global:lastAccessPath
            $res = 'cd ' + $res | clip
        }

        reNamePinyin_quick {
            $item = ( Get-ChildItem $paramStr )
            $item | ForEach-Object { reNameWithPinying -item $_ -firstAlpha ( chineseToPinyin $_.ToString().Substring(0, 2) ) }
        }

        reNamePinyin_recuresDeepPath2 {
            $item = (Get-ChildItem -Recurse $paramStr)
            $item | ForEach-Object { reNameWithPinying -item $_ -firstAlpha ( chineseToPinyin $_.ToString().Substring(0, 2) ) }
        }

        gTools {
            pg gvim E:\UserSoft\Ecmas\emacs-26.1-x86_64\RecentFlie\noteFile\tool_key.js
        }

        testJs {
            pg gvim E:\DataIn\VScodeData\quickUtils\js\all_test_all.js
        }
        eazydict {
            SimpleTranslate $paramStrWithBlank
            eazydict.cmd $paramArr
        }

        reStart {
            Stop-Process -Name $paramStr
            pg $paramStr
        }

        searchResultPath {
            pg gvim E:\DataIn\PowershellScriptData\tmpCacheFile\tmpSearchResultPath.js
        }

        phone {
            $Global:MyMsg.phone | clip
        }

        tapd {
            Start-Process https://www.tapd.cn/my_worktable?left_tree=1
            $url = "https://www.tapd.cn/worktable_ajax/get_top_nav_worktable_data?t=0.3755283616519416"
            Start-Sleep -Seconds 1 
            Start-Process $url
        }
        Default {}
    }
}

function timeReminding {
    # 
    param(
        [double]
        $cnt = 10,
        [string]
        [ValidateSet("", "seconds", "minute", "hour")]
        $timeType = 'seconds'
    )

    function startSleepByType {
        param(
            [double]
            $cnt = 10,
            [string]
            $timeType = 'seconds'
        )
        switch ($timeType) {
            seconds { Start-Sleep -Seconds $cnt; }
            minute { Start-Sleep -Seconds  ($cnt * 60) }
            hour { Start-Sleep -Seconds ( $cnt * 3600 ) }
            Default {}
        }
    }

    function countDown {
        foreach ($i in 10..1) {
            Start-Sleep -Seconds 1
            Write-Host $i
        }
    }

    Get-Date
    $start = (Get-Date)
    startSleepByType $cnt $timeType
    Start-Process F:\Material\myPhoto\jpg\time_out.jpg
    # Taskmgr.exe
    $end = (Get-Date)
    New-TimeSpan -End $end -Start $start | Format-Table
    Get-Date
}


function activeAdministator {
    'net user administrator /active:yes' | clip
}

function repeatCall {
    param(
        [string]
        $str,
        [int]
        $cnt = 3
    )

    1..$cnt | ForEach-Object { Invoke-Expression $str }
}

function zCleanCachedAndKillNode {
    Stop-Process -Name node 
    $cachedFilePath = 'E:\DataIn\GitHub_download_data\tmp_canDelete\customerManage\customerManage\consultantMobile\node_modules\.cache\hard-source\c2bbfd8a6837afce70dca80816cdacbb484165dd4ed0cb6e8a1d6536afa51cc9'

    Remove-Item -Recurse $cachedFilePath
}

function zWorkCleanCachedAndKillNode {
    # danger
    $ErrorActionPreference = "SilentlyContinue"
        
    $ProgramNodeCnt = (Get-Process | Measure-Object).Count
    if ($ProgramNodeCnt -ne 0) {
        Stop-Process -Name node 
        $buildCachedFilePath = 
        'E:\DataIn\WorkFor\customerManage\consultantMobile\node_modules\.cache\hard-source\2b791c7d198d01d5770db24bfafbe2a1024c3a82b3f51646b1049599eae25281'

        $cachedFilePath = 'E:\DataIn\WorkFor\customerManage\consultantMobile\node_modules\.cache\hard-source\a46b2c3f7582d91717f14d4898282db2a8c6f33499ff80145e10b7a50c53e255'

        if (Test-Path $buildCachedFilePath) {
            Remove-Item -Recurse $buildCachedFilePath
        }
        elseif (Test-Path $cachedFilePath) {
            Remove-Item -Recurse $cachedFilePath
        }
    }
    else {
        Write-Host "\nno process node"
    }

    $ErrorActionPreference = "Continue"
}

function ToNegitiveNum ($param1 = $(Throw "param 1 must be specified!")) {
    0 - [System.Convert]::ToInt32($param1)
}

function replaceBackslashToSlash {
    # replace \ to /
    param(
        [string]$i
    )

    $i.ToString().Replace("\", "/")
}

function shellTscFile {
    $tsFilePath = 'E:\UserSoft\Ecmas\emacs-26.1-x86_64\RecentFlie\tsFile\type.ts'
    $jsFilePath = 'E:\UserSoft\Ecmas\emacs-26.1-x86_64\RecentFlie\tsFile\type.js'
    
    $tscRes = tsc.cmd $tsFilePath
    if ($tscRes -ne $null) {
        $tscRes
    }
    else {
        node $jsFilePath
    }
}