

Set-StrictMode -Version latest
$ErrorActionPreference = 'Stop'

try {
    $a = 100
    # $b = 25 # Read-Host 'Bitte einen Wert eingeben'

    $b = -1
    do {
        $b = Read-Host "Bitte einen Wert eingeben"
    } while ( $b -eq 0 )
    
    $result = $a / $b
    
    Get-ChildItem hklm:\ 

    Write-Host "Ergebnis: $result" -BackgroundColor DarkGreen
}
catch [System.DivideByZeroException] {
       "Bitte nicht 0 eingeben ..."
       # $_.InvocationInfo
       return 'Ich breche ab ...'
}
catch {
    "Irgendein Fehler ist aufgetreten ..."

    $Error[0] | Format-List -Property * -Force
    $Error[0].InvocationInfo
}


"*** FINISHED ***"
