

$computers = @('Srv1','Srv2','Obelix','Asterix','Idefix')

$AllComputers = @()

foreach ( $tempcomputer in $computers ) {

    $myObject = New-Object -TypeName psobject

    $myObject | Add-Member -MemberType NoteProperty -Name 'ComputerName' -Value $tempcomputer
    $myObject | Add-Member -MemberType NoteProperty -Name OS -Value ( @('Windows Server 2022', 'Linux') | Get-Random -Count 1)
    $myObject | Add-Member -MemberType NoteProperty -Name RAM -Value ( @(12,18,24) | Get-Random -Count 1)
    $myObject | Add-Member -MemberType NoteProperty -Name CPU -Value ( @(4,8,12) | Get-Random -Count 1)
    
    $myObject | Add-Member -MemberType ScriptMethod -Name Restart -Value { Write-Host "Rechner $($this.ComputerName) wird neu gestartet ..." -ForegroundColor Cyan }
    $myObject | Add-Member -MemberType ScriptMethod -Name Shutdown -Value { Write-Host "Rechner $($this.ComputerName) wird herunter gefahren ..." -ForegroundColor Yellow }
    
    $AllComputers += $myObject
}

$AllComputers

# It is an Array 
$AllComputers.GetType()

# Use *-object cmdlets
$AllComputers | Sort-Object -Property Computername
$AllComputers | Where-Object { $_.OS -eq 'Linux' }
$AllComputers | Group-Object -Property OS
$AllComputers | Format-List 
# ... and many more