
Configuration SimpleDSC {

    param (
        [string[]]$Computername
    )

    Node $Computername {

        WindowsFeature SimpleTCPIP {
            Name = 'Simple-TCPIP'
            Ensure = 'Present'
        }

        WindowsFeature WINS {
            Name = 'WINS'
            Ensure = 'Absent'
        }

        Registry mapsINFO {
            Key = 'HKEY_LOCAL_MACHINE\Software\MAPS'
            ValueName = 'TeilnehmerAnzahl'
            ValueData = 6
            ValueType = 'Dword'
        }

        Environment mapsEnvVar {
            Name = 'MAPS'
            Ensure = 'Present'
            Value = 'SR05'
        }


    }
}

# Videos
# https://www.youtube.com/playlist?list=PLDveEyEaCGzxFRigX_uak9VEx6XVooUP-