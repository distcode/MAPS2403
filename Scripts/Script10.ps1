
function ConvertByteTo-Unit {

    param (
        
        [parameter(Mandatory=$true)]
        [long]$Byte,

        [ValidateSet('kb','mb','gb','tb')]
        [String]$Unit = 'kb'
    )

    $result = 0
    switch ($Unit) {
    
        'kb' {
            $result = $Byte / 1024
            break
        }
        'mb' {
            $result = $Byte / 1024 / 1024
            break
        }
        'gb' {
            $result = $Byte / 1024 / 1024 / 1024
            break
        }
        'tb' {
            $result = $Byte / 1024 / 1024 / 1024 / 1024
            break
        }
    }

    return $result
}

<#
[long]$Byte = Read-Host 'Bitte eine Zahl eingeben ...'

$Calculation = ConvertByteTo-Unit -Byte $Byte -Unit mb

Write-Host "Das Ergebnis ist: $Calculation."
#>