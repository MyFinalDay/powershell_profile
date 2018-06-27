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
function testaa{
echo 'a'}
