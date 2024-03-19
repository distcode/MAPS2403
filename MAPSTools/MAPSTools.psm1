
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

function Write-Hello {
    
    param (
        [String]$Name = 'Fellow'
    )

    Write-Host "Hello $Name!" -ForegroundColor Green
}

function Write-Goodbye {

    Write-Host "Thank you and Good bye ..." -ForegroundColor Cyan
}

function New-HostInfoList {

    param (
        [String[]]$Hosts
    )

    $AllComputers = @()

    foreach ( $tempcomputer in $Hosts ) {

        $myObject = [HostInfo]::new()

        $myObject.ComputerName = $tempcomputer
        $myObject.OS = ( @('Windows Server 2022', 'Linux') | Get-Random -Count 1)
        $myObject.RAM = ( @(12,18,24) | Get-Random -Count 1)
        $myObject.CPU = ( @(4,8,12) | Get-Random -Count 1)
        
        $AllComputers += $myObject
    }

    return $AllComputers
}

. .\ExternalFunction01.ps1

# Export-ModuleMember -Function @('Write-Hello','Write-ExternalData')