
function Do-FooSimple {

    [cmdletbinding(SupportsShouldProcess=$true)]
    param ()

    if ( $PSCmdlet.ShouldProcess('Writing xxx') ) {
        
        # code will be executed without -WhatIf
        ' xxx '

        #    with -WhatIf --> ShouldProcess() = $False
        # without -WhatIf --> ShoudlProcess() = $true
    }
}

function Do-FooAdv {

    [cmdletbinding(SupportsShouldProcess=$true)]
    param ()

    if ( $PSCmdlet.ShouldProcess('Host','Writing xxx') ) {
        
        # code will be executed without -WhatIf
        ' xxx '

        #    with -WhatIf --> ShouldProcess() = $False
        # without -WhatIf --> ShoudlProcess() = $true
    }
}

function Do-FooFull {

    [cmdletbinding(SupportsShouldProcess=$true)]
    param ()

    if ( $PSCmdlet.ShouldProcess('Das Skript wird nun einen Text ausgeben.','Soll das Skript einen Text ausgeben?','Do-FooFull Function') ) {
        
        # code will be executed without -WhatIf
        ' xxx '

        #    with -WhatIf --> ShouldProcess() = $False
        # without -WhatIf --> ShoudlProcess() = $true
    }
}

# Do-FooSimple -WhatIf
# Do-FooAdv -WhatIf

# Do-FooSimple -Confirm
# Do-FooAdv -Confirm

# Do-FooFull -WhatIf
# Do-FooFull -Confirm

Do-FooFull -Verbose