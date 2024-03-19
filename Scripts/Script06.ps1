

for ($i = 1; $i -le 5; $i++) {
    "Das ist der $i. Durchlauf."
}


for ($i = 20; $i -gt 0; $i -= 2) {
    "Das ist der $i. Durchlauf."
}  


$colors = @("Yellow","Darkyellow","Magenta","Red","Darkred","Cyan")

foreach ( $tempColor in $colors ) {

    if ( $tempColor -eq "Darkred" ) {

        continue
        # break
    }
    Write-Host "Rainbow" -ForegroundColor $tempColor
}


$Zinssatz = 0.01
$Kapital = 1000
$Endwert = 1500
$Jahre = 0

while ( $Kapital -lt $Endwert ) {

    $Kapital = $Kapital * $Zinssatz + $Kapital
    $Jahre++
}
"Das Kapital muss $Jahre Jahre angelegt werden."




do {
    "Anfangskapital: $Kapital"
    $Kapital = $Kapital * $Zinssatz + $Kapital
    $Jahre++
    "Endkapital: $Kapital"
    "Jahr:  $jahre"
} while ( $Kapital -lt $Endwert )

"Das Kapital muss $Jahre Jahre angelegt werden. Endwert: $Kapital"