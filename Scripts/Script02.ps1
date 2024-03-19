
$a = Get-Random -Minimum 1 -Maximum 100

if ( $a -gt 50 ) {

    "Die Zahl ist größer als 50, nämlich $a"
}
<# else {

    "Die Zahl ist nicht größer als 50, nämlich $a"

}#>

# Get-ChildItem C:\PSScript | Where-Object { $_.IsReadOnly }