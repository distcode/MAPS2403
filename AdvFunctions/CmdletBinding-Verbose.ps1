

Function Do-Foo {

    [cmdletbinding()]
    param (
        [int]$a
    )

    Write-Warning "Die Function Do-Foo wird gestartet ..."
    
    Write-Verbose "Next, the content of `$a is printed ..."

    "This is stored in `$a: $a"

    Write-Verbose "Function End."

    Write-Host "Good bye ..." -ForegroundColor Cyan

    Write-Information "All done well ..."

}

Do-Foo -a 4711

Do-Foo -a 4711 -InformationAction Continue

Do-Foo -a 4711 -Verbose 