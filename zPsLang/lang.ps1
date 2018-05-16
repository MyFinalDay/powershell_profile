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

function insertSort {
    param(
        [array]
        $arr
    )

    $len = $arr.Length

    for ($i = 1; $i -lt $len; $i++) {
        $preIndx = $i - 1;
        $current = $arr[$i]
        
        while ( $preIndx -ge 0 -and $arr[$preIndx] -gt $current ) {
            $arr[$preIndx + 1] = $arr[$preIndx]
            $preIndx--
        }

        $arr[$preIndx + 1] = $current
    }

    $arr
}

function enumeratorProperty($obj) {
    $obj | Select-Object ($obj | Get-Member -MemberType Property | Select-Object Name).Name
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

function gcd {
    # The greatest common
    param(
        [int]
        $x,
        [int]
        $y
    )
    
    if (!$y) {
        $x
    }
    else {
        gcd $y ($x % $y)
    }
}

function tail_factorial {
    # n max 27
    param(
        [decimal]
        $n,
        [decimal]
        $total = 1
    )
    
    if ($n -le 1) {
        $total
    }
    else {
        tail_factorial ($n - 1) ($n * $total)
    }
}

function factorial2 {
    param(
        [decimal]
        $n
    ) 

    tail_factorial $n 1
}

function Fibonacci {
    param(
        [decimal]
        $n
    ) 
    if ($n -le 0) {
        0
    }
    elseif ($n -gt 0 -and $n -le 2) {
        1 
    }
    else {
        (Fibonacci($n - 1)) + (Fibonacci($n - 2))
    }
}

function combination {
    # 0 <= m <= n
    param(
        [int]
        $n,
        [int]
        $m
    )

    if ($m -eq 0) {
        1
    }
    else {
        (factorial2 $n) / ( (factorial2 $m) * (factorial2($n - $m)) )
    }
}

function arrangeement {
    # 0 <= m <= n
    param(
        [int]
        $n,
        [int]
        $m
    )

    ( (factorial2 $n) * (factorial2($n - $m)) )
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
function sample ([array]$arr, [int]$cnt) {
    if ($cnt) {
        $arr | Get-Random -Count $cnt
    }
    else {
        $arr | Get-Random -Count $arr.Count 
    }
}
function identity ($i) {
    # return itself
    $i 
}
function isVariableNull ($i) {
    # eg. isVariableNull $testVariable -> True
    $i -eq $null 
}


function StringCase {
    param(
        [ValidateSet("camcelize", "pascalCase", "snakeCase", "doubleUndersocreCase",
            "constCase" )]
        [string]
        $case
    )

    $res = @()

    switch ($case) {
        camcelize {
            foreach ($word in $args) {
                $res += ( $word.Substring(0, 1).ToUpper() + $word.Substring(1, $word.Length - 1) )
            }
            $res = $res -join ''
            $res.Substring(0, 1).ToLower() + $res.Substring(1, $res.Length - 1)
        }
        pascalCase {
            foreach ($word in $args) {
                $res += ( $word.Substring(0, 1).ToUpper() + $word.Substring(1, $word.Length - 1) )
            }
            $res = $res -join ''
            $res
        }       

        constCase {
            foreach ($word in $args) {
                $res += $word.ToUpper()
            }
            $res = $res -join '_'
            $res
        }

        snakeCase {
            if ($args.Length -eq 1) {

            }
            else {
                $res = $args -join '_'
                $res = $res.ToLower()
                $res
            }
        }

        doubleUndersocreCase {
            if ($args.Length -eq 1) {

            }
            else {
                $res = $args -join '__'
                $res = $res.ToLower()
                $res
            }
        }
    }
}

function flatten {
    param(
        [array]
        $arr
    )

    # $res = New-Object System.Collections.ArrayList
    $res = @()

    foreach ($v in $arr) {
        if ($v -is [array]) {
            $v = flatten($v);
            foreach ($item in $v) {
                $res += $item
            }
        }
        else {
            $res += $v
        }
    }

    $res = [array]$res
    $res
}


function logType {
    param(
        $i
    )

    Write-Host '' 
    $i 
    Write-Host '' 
}