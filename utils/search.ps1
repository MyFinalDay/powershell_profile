function ns {
    # net search
    param(
        [ValidateSet("", "bd", "g2", "bk", "segmentfault", "stackoverflow", "bd_FileType",
            "searchBookmarksOfChrome", "github", "googleTranslate", "baiduTranslate",
            "bingTranslate", "codepen", "wiki", "youdaoTranslate", "quora", "serverfault",
            "zstackexchange", "iconfont" )]
        [string]
        $net
    ) 

    $keyWord = $args -join " "
    if (![string]::IsNullOrEmpty($keyWord)) {
        # $keyWord = [System.Web.HttpUtility]::UrlEncode($keyWord) ( is Error !)
        $keyWord = [uri]::EscapeDataString($keyWord)
    }

    switch ($net) {
        g2 { Start-Process https://www.google.com/search?q=$keyWord }
        bk {
            if ($keyWord -ne '') {
                start-process https://baike.baidu.com/item/$keyWord
            }
            else {
                Start-Process https://baike.baidu.com/
            }
        }
        segmentfault { Start-Process https://segmentfault.com/search?q=$keyWord }
        stackoverflow {
            if ($keyWord -ne '') {
                Start-Process https://stackoverflow.com/search?q=$keyWord
            }
            else {
                Start-Process https://stackoverflow.com/
            }
        }
        bd { Start-Process https://www.baidu.com/s?wd=$keyWord }
        github { Start-Process https://github.com/search?q=$keyWord }
        searchBookmarksOfChrome {
            $keyWord = $keyWord.ToLower()
            $bookmarks = bookmarksOfChrome | Select-Object -Index 1
            $result = $bookmarks | Where-Object {$_.Name.ToLower() -like "*$keyWord*"}

            ($result | Select-Object -First 1 | Select-Object url).url | clip.exe
            $result 
        }
        googleTranslate {
            if ([int][char]$keyWord[0] -le 255) {
                Start-Process "https://translate.google.cn/#en/zh-CN/$keyWord"
            }
            else {
                Start-Process "https://translate.google.cn/#zh-CN/en/$keyWord"
            }
        }
        baiduTranslate {
            if ([int][char]$keyWord[0] -le 255) {
                Start-Process "http://fanyi.baidu.com/#en/zh/$keyword"
            }
            else {
                Start-Process "http://fanyi.baidu.com/#zh/en/$keyword"
            }
        }
        codepen {
            Start-Process https://codepen.io/search/pens?q=$keyWord
        }
        bingTranslate {
            Start-Process https://cn.bing.com/translator/
        }
        wiki {
            Start-Process https://en.wikipedia.org/wiki/$keyWord
        }
        youdaoTranslate {
            Start-Process http://dict.youdao.com/search?q=$keyWord
        }
        quora {
            Start-Process https://www.quora.com/search?q=$keyword
        }
        serverfault {
            Start-Process https://serverfault.com/search?q=$keyWord
        }
        zstackexchange {
            Start-Process https://stackexchange.com/search?q=$keyWord
        }
        iconfont {
            Start-Process http://www.iconfont.cn/search/index?q=$keyword
        }

        Default { ns bd  }
    }
}
function bd {
    # eg. bd powershellAPI -> baidu.com search powershellAPI
    $keyWord = ($args -join " ")
    if (![string]::IsNullOrEmpty($keyWord)) {
        # $keyWord = [System.Web.HttpUtility]::UrlEncode($keyWord) ( is Error !)
        $keyWord = [uri]::EscapeDataString($keyWord)
    }


    if ($keyWord -ne '') {
        Start-Process https://www.baidu.com/s?wd=$keyWord
    }
    else {
        Start-Process https://www.baidu.com/
    }
}
function searchBookmarksOfChrome {
    param(
        [string]
        $keyWord,
        [int]
        $Index = 1
    ) 

    $keyWord = $keyWord.ToLower()
    $bookmarks = bookmarksOfChrome | Select-Object -Index 1
    $result = $bookmarks | Where-Object {$_.Name.ToLower() -like "*$keyWord*"}

    ($result | Select-Object -First 1 | Select-Object url).url | clip.exe
    $result 

    if ($Index -ne 1) {
        $Index -= 1
        ($result | Select-Object -Index $Index | Select-Object url).url | clip.exe
    }
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

# [System.AppDomain]::CurrentDomain.GetAssemblies() 
function ss {
    # find string eg. ss isNumeric -> find string 'isNumeric' or ss isNumeric 3 -> find string 'isNumeric' and 3 lines context
    # eg. ss height wxml 1 $false -> find string 'height' from wxml
    # Get-ChildItem .\*.js -Recurse | Select-String $i -Context $contextCnt
    param(
        $searchPattern,
        $fileExtension = "js",
        $contextCnt = 0,
        $isCaseSensitive = $false
    )

    function logResultAndClip {
        param(
            $res,
            [string]
            $fileExtension
        )

        if ($res -ne $null) {
            # $resFormatArr = $res | ForEach-Object { -join @($_.ToString().Split(".")[0] + ".$fileExtension" , ' ' , $_.ToString().Split(".")[1]) }
            $resFormatArr = $res | ForEach-Object { -join @($_.Path, ' (', $_.LineNumber, ') ', $_.Line) }

            Set-Content -Path E:\DataIn\PowershellScriptData\tmpCacheFile\tmpSearchResultPath.js -Value $resFormatArr -Encoding UTF8

            $resFileArr = $res.Path
            $resFile = $resFileArr | Select-Object -First 1 
            if ($resFile.EndsWith('.js')) {
                "pg gvim $resFile" | clip
            }
            else {
                $resFile | clip
            }

            if ($res -is [array]) {
                for ($i = 0; $i -lt $res.Count; $i++) {
                    -join @(" $i ".PadLeft(4), " ", $res[$i])
                }
            }
            else {
                $res
            }

        }
    }

    if ($isCaseSensitive) {
        $res = Get-ChildItem . -Include "*.$fileExtension" -Recurse | Select-String $searchPattern -CaseSensitive -Context $contextCnt

        logResultAndClip $res $fileExtension
    }
    else {
        $res = Get-ChildItem . -Include "*.$fileExtension"-Recurse | Select-String $searchPattern -Context $contextCnt

        logResultAndClip $res $fileExtension 
    }
}

function findBigFile ($i) {
    # eg. findBigFile ./*.js -> find .js File and sort them 
    Get-ChildItem $i -Recurse | Sort-Object Length -Descending | Select-Object -First 20 |
        Format-Table @{Label = " Name "; Expression = {" " * 5 + $_.Name.ToString() + " " * 1}; alignment = "left";
    }, @{Label = "  Length(Kb)  "; Expression = {$_.Length / 1Kb -as [int]}; alignment = "center";
    } , @{Label = "Directory"; Expression = {$_.directory.ToString().substring((Get-Location).Path.Length)}}
    $totalLength = (mr LengthAll .)
    Write-Host "Total recurse:" $totalLength
    Write-Host ""
}
function bd_FileType {
    # eg. bd_FileType powershell doc -> baidu.com search powershell .doc
    param(
        [Parameter(Mandatory = $true)]            
        [string]
        $keyWord,
        [Parameter(Mandatory = $true)]            
        [string]
        $fileType
    )

    $keyWord = $keyWord + " fileType:" + $fileType

    bd $keyWord
}

function ns_site_search {
    param(
        [ValidateSet("segmentfault")]
        [string]
        $type
    )    

    $keyWord = $args -join " "

    switch ($type) {
        segmentfault { ns bd 'site:segmentfault.com ' $keyWord }
        Default {}
    }
}

function fs {
    # function search
    param(
        [ValidateSet("", "fn", "variable", "env")]
        [string]
        $type
    )

    $keyWord = $args -join " "

    switch ($type) {
        fn {
            $res = ( Get-ChildItem function: | Where-Object {$_.Name -like "*$keyWord*"}  )
            $resCnt = ( $res | Measure-Object ).Count
            $res | Format-List | more
            $resCnt
        }
        variable {
            $allHashTableVariable = (Get-ChildItem variable: | Where-Object {$_.value -ne $null} | Group-Object {$_.value.gettype()} | Where-Object {$_.name -like "*Hash*"} ).Group
            $matchRes = ($allHashTableVariable | ForEach-Object {$_.value}) | ForEach-Object {$_.keys} | Where-Object {$_ -like "*$keyWord*"}
            $allHashTableName = $allHashTableVariable | ForEach-Object {$_.Name}

            $res = ( Get-ChildItem variable: | Where-Object {$_.Name -like "*$keyWord*"}  )
            $resCnt = ( $res | Measure-Object ).Count
            $res | Format-List | more

            if ( ( $matchRes | Measure-Object ).Count -ne 0 ) {
                foreach ($v in $allHashTableName) {
                    if ( (Invoke-Expression ("$" + $v)).ContainsKey($matchRes) ) {
                        # HashTableVariable Name $v 
                        # HashTableVarible Key Name $matchRes
                        [string]::Concat("$", $v, ".", $matchRes) | clip.exe
                    }
                }
            }

            $resCnt
        }
        env {
            $res = ( Get-ChildItem env: | Where-Object {$_.Name -like "*$keyWord*"}  )
            $resCnt = ( $res | Measure-Object ).Count
            $res | Format-List | more
            $resCnt
        }
        Default { '*\(*^_^*)/*' + '    ' + ( [datetime]::Now.ToString('yyyy-MM-dd HH:mm:ss ddd') ) }
    }

}