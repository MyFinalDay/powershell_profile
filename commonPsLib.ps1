function logSizeHuman ($i) {
    # beautify  
    if ($i -ne $null) {
        if ($i -gt 0.9Gb) {
            $res = ($i / 1Gb).ToString('f2') + " GB"
        }
        elseif ($i -gt 0.9Mb) {
            $res = ($i / 1Mb).ToString('f0') + " MB"
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

function handleSpeicalSymbol {
    param(
        $pg
    )

    $process = $pg.ToString()
    if ($process.StartsWith('notepad')) {
        $process += '++'
    }
    elseif ($process.StartsWith('Weather')) {
        $process = 'Microsoft.Msn.Weather'
    }

    return $process
}

function getPsSum ($process) {
    $processWs = (Get-Process $process | Measure-Object -Property WS -Sum).Sum
    $processWs = (logSizeHuman($processWs))
    $processWs
}
function mr {
    param(
        [ValidateSet("LengthAll")]
        [string]
        $options
    ) 

    $paramArr = $args[0]

    switch ($options) {
        LengthAll {
            # Get directory size eg. measureLenAll $HOME/Desktop/jsFile -> Get jsFile/ size
            $directoryLength = (Get-ChildItem $paramArr -Recurse | Measure-Object -Property Length -Sum).Sum
            logSizeHuman($directoryLength)
        }
        Default {}
    }
}
function convertToBinary ($i) {
    [System.Convert]::ToString($i, 2) 
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
function recycleBin ($relativePath) {
    # move to recycleBin eg. recyleBin ./file1.js -> delete file1.js move to recyclyeBin
    $shell = New-Object -ComObject 'Shell.Application' 
    $item = $shell.Namespace(0).parseName((Resolve-Path $relativePath).Path)
    $item.InvokeVerb('delete')
}
function saveCurrentPath () {
    # eg. saveCurrentPath 
    $Global:lastAccessPath = (Get-Location).Path
    $Global:lastAccessPath | clip
    $Global:lastAccessPath
}
function defaultLastHistory {
    # if input null choose last history
    param(
        $i
    ) 

    if ($i -ne '') {
        $res = $i
    }
    else {
        $res = Get-History | Select-Object -Last 1
        $res = $res.CommandLine
    }

    return $res
}

function arroundSymbol {
    param(
        [validateset("singleQuotes", "doubleQuotes", "parentheses", "getType", "Length", "ToString", "int32")]
        $symbol,
        [string]
        $word
    )

    $res = defaultLastHistory $word

    switch ($symbol) {
        singleQuotes { "'" + $res + "'" | clip }
        doubleQuotes { '"' + $res + '"' | clip }
        parentheses { "(" + $res + ")" | clip }
        getType { "(" + $res + ").GetType()" | clip }
        Length { "(" + $res + ").Length" | clip }
        ToString { "(" + $res + ").ToString()" | clip }
        int32 { "[int][char]('" + $res + "')" | clip }
    }
}

function changeCRLFToLF {
    # change windows path style to linux path style 
    param(
        [string]$path
    )

    if (Test-Path $path) {
        $path = '/' + $path.Replace('\', '/').replace(':', '') 
        $path | clip
        return $path
    }
    else {
        Write-Host "not a valid path!"
    }
    
}

function genRandomStr {
    param (
        [switch]
        $isPwd,
        [int]
        $PasswordLength = 12,
        [int]
        $SpecialCharCount = 3
    )


    if ($isPwd) {
        Add-Type -AssemblyName System.Web
        $res = [System.Web.Security.Membership]::GeneratePassword($PasswordLength, $SpecialCharCount)
        $res
        '"' + $res + '"'| clip
    }
    else {
        $str = [ char[] ]'_____123456789abcdefghijklmnpqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ'
        $len = Get-Random -Minimum 3 -Maximum 36
        $fileName = sample $str -cnt $len
        $fileName = -join $fileName
        while ( $fileName.StartsWith('_') ) {
            $fileName = sample $str -cnt $len
            $fileName = -join $fileName
        }

        $fileName
    }

}

function quickStartGitBash {
    Start-Process 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Git\Git Bash.lnk' -Verb runAs
    # wait 
    Start-Sleep -Milliseconds 600
    $path = (Get-Location).Path
    $path = changeCRLFToLF $path
    $path = "cd " + $path

    Add-Type @"
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
public class User32Helper
{
[DllImport("User32.dll")]
public static extern int SetForegroundWindow(IntPtr point);
}
"@ -ReferencedAssemblies @("System.Windows.Forms")
    Add-Type -AssemblyName System.Windows.Forms
    $Console = Get-Process "mintty" | Sort-Object StartTime -Descending | Select-Object -First 1
    # 获取窗口句柄，并激活焦点
    $intPtr = $Console.MainWindowHandle
    [User32Helper]::SetForegroundWindow($intPtr)
    # 输入要执行的命令
    [System.Windows.Forms.SendKeys]::SendWait($path)
    # 执行命令
    [System.Windows.Forms.SendKeys]::SendWait("{Enter}")
}

# function dectect {
#     param(
#         [string]        
#         $type
#     )

#     $paramArr = ($args -join '')

#     switch ($type) {
#         assertVariable { 
#             if ($paramArr) {
#                 Write-Host 'yes!'
#                 $true
#             }
#             else {
#                 Write-Host 'no!'
#                 $false
#             }
#         }
#         Default {}
#     }
# }