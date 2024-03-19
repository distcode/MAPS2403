
class HostInfo {

    [String]$ComputerName
    [String]$OS
    [int]$RAM
    
    [ValidateSet(4,8,12)][int]$CPU

    [DateTime]$Created

    HostInfo () {
        $this.Created = (Get-Date).Date
    }

    HostInfo ([string]$hostname,[string]$os,[int]$ram,[int]$cpu) {
        $this.ComputerName = $hostname
        $this.OS = $os
        $this.RAM = $ram
        $this.CPU = $cpu

        $this.Created = (Get-Date).Date
    }

    Restart () {
        Write-Host "Der Computer $($this.ComputerName) wird neu gestartet ..." -ForegroundColor Cyan
    }

    Restart ([int]$Seconds) {
        Write-Host "Der Computer $($this.ComputerName) wird in $Seconds Sekunden neu gestartet ..." -ForegroundColor Cyan
    }

    [int] Shutdown () {
        Write-Host "Der Computer $($this.ComputerName) wird herunter gefahren ..." -ForegroundColor Yellow
        return 0
    }

}


# $myComputer = [HostInfo]::new('Asterix','Windows Server 2022', 16, 12)
# $myComputer
# return

$myComputer = [HostInfo]::new()

# $myComputer | Get-Member

$myComputer.ComputerName = 'Srv1'
$myComputer.OS = 'Linux'
$myComputer.RAM = 4
$myComputer.CPU = 8

# $myComputer.Restart()
# $myComputer.Restart(600)
$myComputer.Shutdown()