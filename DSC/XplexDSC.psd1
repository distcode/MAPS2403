
@{
    AllNodes = @(
        @{
            NodeName                    = 'DC1'
            PSDscAllowPlainTextPassword = $true
        },
        @{
            NodeName                    = 'DC2'
            PSDscAllowPlainTextPassword = $true
        }
    )
}