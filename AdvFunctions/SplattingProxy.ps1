
function Do-Foo {

    param (
        
        $Name,
        $Status,
        $Value
    )

    Write-Host "Servus $Name !"
    
    $PSBoundParameters | out-host
    $PSBoundParameters.Remove('Name')
    $PSBoundParameters.Add('Count',9)
    $PSBoundParameters | Out-Host

    $result = Do-Helper @PSBoundParameters

    Write-Host "Das Ergebnis ist: $result"

}

function Do-Helper {

    param (

        $Status,
        $Value,
        $count
    )

    $calcresult = ($value * (Get-Random -Minimum 10 -Maximum 100)) - 12

    return $calcresult
}

Do-Foo -Name 'Trainer' -Status 'OK' -Value 4711