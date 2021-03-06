<#

dir .
ps powershell
h | measure


"test`n"

switch ($args) {
    { $args[0] -gt 10 } {"$_  小于10"}
    {$args[0] -gt 20} {"$_  大于20"}
    Default {"No Match!"}
}

$MyInvocation.MyCommand.Name
# E:\DataIn\PowershellScriptData\infoWS.ps1

function concatStr ($str1 = "flyarg", $str2) {
    return $str1 + $str2
}

concatStr name space
concatStr -str1 onE -str2 Two
concatStr -str2 second -str1 fist
concatStr 
concatStr -str2 oneargument

function concatStr2 ([int]$num, [string]$str) {
    return @{One = $num + 1; Two = $str.GetType()}
}

concatStr2 8 str3
concatStr2 8 8

function testWriteHost {
    Write-Host "fist lien" 
    2157
    Write-Host "`nlast ln"
}

testWriteHost 8

New-Object string("*", 100)
$result = testWriteHost

New-Object string("*", 100)
$result 

function testError ($OptionalParameters) {
    $ErrorActionPreference = "sil entlyContinue"
    start asdfasdf
    "yes"
}


function makeJS ($OptionalParameters) {
    $oldColor = $Host.UI.RawUI.ForegroundColor

    foreach ($ele in $input) {
        if ($ele.name.toLower().endsWith(".js")) {
            $Host.UI.RawUI.ForegroundColor = "green"
        }
        else {
            $Host.UI.RawUI.ForegroundColor = $oldColor
        }

        $ele
    }

    $Host.UI.RawUI.ForegroundColor = $oldColor
}

Write-Host "`n" 
Get-ChildItem C:\Users\mydell\Desktop | makeJS | Out-Host

filter makeJS2 {
    $oldColor = $Host.UI.RawUI.ForegroundColor

    if ($_.name.toLower().endsWith(".js")) {
        $Host.UI.RawUI.ForegroundColor = "green"
    }
    else {
        $Host.UI.RawUI.ForegroundColor = $oldColor
    }

    $_

    $Host.UI.RawUI.ForegroundColor = $oldColor
}

Get-ChildItem C:\Users\mydell\Desktop | makeJS2 | Out-Host

function makeJS3 {
    begin {
        $oldColor = $Host.UI.RawUI.ForegroundColor
    }
    process {
        if ($_.name.toLower().endsWith(".js")) {
            $Host.UI.RawUI.ForegroundColor = "green"
        }
        else {
            $Host.UI.RawUI.ForegroundColor = $oldColor
        }

        $_
    }
    end {
        $Host.UI.RawUI.ForegroundColor = $oldColor
    }
}

Get-ChildItem C:\Users\mydell\Desktop | makeJS3 | Out-Host

#>

<# 

param([int]$n = $(throw "Please Enter a integer!"))

. E:\DataIn\PowershellScriptData\psLib.ps1   

factorial $n

begin {
    Write-Host "begin"
}
process {
    $ele = $_
    if ($ele.extension -ne "") {
        switch ($ele.extension.toLower()) {
            ".js" {" File JS: " + $ele.name  }
            ".txt" {" File txt: " + $ele.name  }
            Default {""}
        }
    }
}
end {
    Write-Host "end!"
}



#>

param([string]$text)

. E:\DataIn\PowershellScriptData\psLib.ps1

RemoveSpace($text)

Compare-Object $([System.Diagnostics.Process]::GetCurrentProcess()) $(Get-Process -Id $PID)

$myArr1 = @(80, 2, 16, -3, 3, 2, 81, 17, 19, -4, -3, 10, 7, 8, 2);

bubbleSort $myArr1

$myArr2 = @(80, 2, 16, -3, 3, 2, 81, 17, 19, -4, -3, 10, 7, 8, 2);

quickSort $myArr2
$result2 = $myArr2 | Sort-Object 
$result2 -join ", " 

SimpleTranslate "space"

get-date

$hash = @{level = 1; scope = "root"; skill = @('js', 'css'); isFlag = $false}
$hash.Remove('scope')


