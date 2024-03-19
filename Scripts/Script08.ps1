

foreach ( $tempColor in $input ) {

    Write-Host 'Rainbow' -ForegroundColor $tempColor
}

$input.reset()

foreach ( $tempColor in $input ) {

    Write-Host 'Rainbow' -BackgroundColor $tempColor
}
