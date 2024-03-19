
param (

    [parameter(ValueFromPipeline=$true)]
    [String[]]$Colors
)


BEGIN {
    "Guten Tag!"
    $i = 0
}

PROCESS {

    foreach ( $tempColor in $Colors) {

        Write-Host 'Rainbow' -ForegroundColor $tempColor
        $i++
    }
    
}

END {
    "Auf Wiedersehen!"
    "Es wurden $i Werte übergeben."
}




