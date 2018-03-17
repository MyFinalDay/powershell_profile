function bd {
    # eg. bd powershellAPI -> baidu.com search powershellAPI
    $keyWord = ($args -join " ")

    if ($keyWord -ne '') {
        Start-Process https://www.baidu.com/s?wd=$keyWord
    }
    else {
        Start-Process https://www.baidu.com/
    }
}
function bk {
    # eg. bk powershell -> baidubaike search powershell
    $keyWord = ($args -join " ")
    if ($keyWord -ne '') {
        start-process https://baike.baidu.com/item/$keyWord
    }
    else {
        Start-Process https://baike.baidu.com/
    }
}
function g2 {
    # eg. g2 powershellAPI -> google.com search powershellAPI
    $keyWord = ($args -join " ")
    if ($keyWord -ne '') {
        Start-Process https://www.google.com/search?q=$keyWord
    }
    else {
        Start-Process https://www.google.com/
    }
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
function searchVariableAssemblies ($serachText) {
    [System.AppDomain]::CurrentDomain.GetAssemblies() 
}
function ss  {
    # find string eg. ss isNumeric -> find string 'isNumeric' or ss isNumeric 3 -> find string 'isNumeric' and 3 lines context
    # eg. ss height 1 $false wxml -> find string 'height' from wxml
    # Get-ChildItem .\*.js -Recurse | Select-String $i -Context $contextCnt
    param(
        $searchPattern,
        $contextCnt = 0,
        $isCaseSensitive = $false,
        $fileExtension = "js"
    )
    if ($isCaseSensitive) {
        Get-ChildItem . -Include "*.$fileExtension" -Recurse | Select-String $searchPattern -CaseSensitive -Context $contextCnt
    }
    else {
        Get-ChildItem . -Include "*.$fileExtension"-Recurse | Select-String $searchPattern -Context $contextCnt
    }
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
function ss_wpy ($i, $contextCnt = 0, $isCaseSensitive = $false) {
    # find string eg. ss isNumeric -> find string 'isNumeric' or ss isNumeric 3 -> find string 'isNumeric' and 3 lines context
    # Get-ChildItem .\*.wpy -Recurse | Select-String $i -Context $contextCnt
    if ($isCaseSensitive) {
        Get-ChildItem . -Include *.wpy -Recurse | Select-String $i -CaseSensitive -Context $contextCnt
    }
    else {
        Get-ChildItem . -Include *.wpy -Recurse | Select-String $i -Context $contextCnt
    }
}