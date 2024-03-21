
configuration XplexDSC {

    param (
        [string[]]
        $Computername
    )
        
    Import-DSCResource -ModuleName ComputerManagementDSC
    Import-DSCResource -ModuleName xPSDesiredStateConfiguration
    Import-DscResource -ModuleName PSDesiredStateConfiguration
        
    $credPWD = New-Object -TypeName pscredential -ArgumentList 'anyUserName',(ConvertTo-SecureString -String 'Pa$$w0rd' -AsPlainText -Force)

    node $Computername {

        User AutomationUser {
            UserName               = 'Automator'
            Ensure                 = 'Present'
            FullName               = 'Automation User'
            PasswordChangeRequired = $false
            Password               = $credPWD
        }
        
        File dscFolder {
            DestinationPath = 'c:\MAPSDSC'
            Type            = 'Directory'
            Ensure          = 'Present'
        }

        SmbShare dscShare {
            DependsOn = '[File]dscFolder'
            Name      = 'dscShare'
            Path      = 'C:\MAPSDSC'
            Ensure    = 'Present'
        }
        
        xEnvironment dscVariable {
            Name   = 'DSC'
            Target = 'Machine'
            Value  = 'created by DSC'
        }
    }
}
