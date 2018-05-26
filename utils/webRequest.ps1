function webRequest {
    param(
        [string]
        $url
    )
    # "http://lvpai.gznuode.cn/api/v1/user/list"

    # $resData = (ConvertFrom-Json ( Invoke-WebRequest -Uri $url ).content).data
    $resRawData = Invoke-WebRequest -Uri $url
    $resData = $resRawData.content

    # Trap {
    #     'Trap exception!';
    #     break;
    # }

    try {
        $resData = ConvertFrom-Json $resData 
        $resData = $resData.data
    }
    catch {
        
    }

    if ($resData -ne $null) {
        if ( $resData.GetType().Name -eq "String" ) {
            $resData = $resData.SubString(0, 30)
        }
    }

    $resData
}

function webRequestDetail {
    param(
        [string]
        $url
    )

    $resData = webRequest $url
    if ($resData.list) {
        $resData = $resData.list
    }

    $resData | more
}
