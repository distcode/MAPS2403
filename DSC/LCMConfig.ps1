
[DSCLocalconfigurationManager()]
Configuration LCMConfig {

    param (
        [string[]]$Computername
    )

    Node $Computername {

        Settings {
            ConfigurationModeFrequencyMins = 60
            ConfigurationMode = 'ApplyAndAutoCorrect'
            RebootNodeIfNeeded = $true
        }

    }

}