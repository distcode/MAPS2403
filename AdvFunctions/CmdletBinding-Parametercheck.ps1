

Function Do-Foo {

    [cmdletbinding()]
    param (
        [int]$a
    )

    "This is stored in `$a: $a"

    "`$args[0] $($args[0])."
    "`$args[1] $($args[1])."

}


Do-Foo -a 123 'Red'

Get-Help about_Functions_CmdletbindingAttribute -ShowWindow
