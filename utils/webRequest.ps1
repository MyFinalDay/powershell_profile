function webRequest {
    param(
        [string]
        $url = 'https://api.github.com/'
    )
    # "http://lvpai.gznuode.cn/api/v1/user/list"
    # https://api.github.com/
    # https://api.github.com/emojis

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
