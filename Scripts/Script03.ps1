
$a = Get-Random -Minimum 1 -Maximum 100

if ( $a -gt 75 ) {

    "Die Zahl ist größer als 75, nämlich $a"
}
elseif ( $a -gt 50 ) {
     "Die Zahl ist größer als 50, nämlich $a"
}
elseif ( $a -gt 25 ) {
     "Die Zahl ist größer als 25, nämlich $a"
}
else {
    "Die Zahl ist NICHT größer als 25, nämlich $a"
} 