
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
    }
}