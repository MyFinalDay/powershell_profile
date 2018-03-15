function addSimpleNote {
    param(
        [ValidateCount(0, 2)]
        $noteArr
    )
    Add-Content -Path E:\DataIn\MyNote\tmpNote.js -Value ('"' + $noteArr[0] + '"' + ':' + '"' + $noteArr[1] + '",') -Encoding UTF8
}

function addEnglishWords {
    # eg. addEnglishWords 'staff','å·¥ä½äººå'
    param(
        [ValidateCount(0, 2)]
        $noteArr
    )
    Add-Content -Path E:\DataIn\MyNote\tmpEnglish.js -Value ('"' + $noteArr[0] + '"' + ': ' + '"' + $noteArr[1] + '",') -Encoding UTF8
    Get-Content -Path E:\DataIn\MyNote\tmpEnglish.js | more
}