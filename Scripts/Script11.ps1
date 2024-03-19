


$myObject = New-Object -TypeName psobject

Add-Member -InputObject $myObject -MemberType NoteProperty -Name 'ComputerName' -Value 'Srv1'

$myObject | Add-Member -MemberType AliasProperty -Name Hostname -Value ComputerName

$myObject | Add-Member -MemberType ScriptMethod -Name Restart -Value { Write-Host "Rechner $($this.ComputerName) wird neu gestartet ..." -ForegroundColor Cyan }
$myObject | Add-Member -MemberType ScriptMethod -Name Shutdown -Value { Write-Host "Rechner $($this.ComputerName) wird herunter gefahren ..." -ForegroundColor Yellow }

$myObject | Add-Member -MemberType NoteProperty -Name OS -Value 'Windows Server 2022'
$myObject | Add-Member -MemberType NoteProperty -Name RAM -Value 12
$myObject | Add-Member -MemberType NoteProperty -Name CPU -Value 8


$myObject | Get-Member

$myObject

$myObject.Restart()
$myObject.Shutdown()

