function addSimpleNote {
    param(
        [ValidateCount(0, 2)]
        $noteArr
    )
    Add-Content -Path E:\DataIn\MyNote\tmpNote.js -Value ('"' + $noteArr[0] + '"' + ':' + '"' + $noteArr[1] + '",') -Encoding UTF8
}

function addEnglishWords {
    # eg. addEnglishWords "staff": "工作人员",
    param(
        [ValidateCount(0, 2)]
        $noteArr,
        [string]
        $fileFullPath = 'E:\DataIn\MyNote\tmpEnglish.js'
    )
    Add-Content -Path $fileFullPath -Value ('"' + $noteArr[0] + '"' + ': ' + '"' + $noteArr[1] + '",') -Encoding UTF8
    Get-Content -Path $fileFullPath | more
}

function updateFileContent {
    # 
    param(
        [string]
        $FileFullPath,
        [int]
        $MaxLineCnt = 20
    )

    New-Item tmpForCurrent.js | Out-Null
    Get-Content $FileFullPath | Select-Object -Index (0..20) | Out-File tmpForCurrent.js
    Get-Content tmpForCurrent.js | Out-File $FileFullPath
    Remove-Item tmpForCurrent.js
}