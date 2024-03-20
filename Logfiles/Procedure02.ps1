

# Working with csv

class LogInformation  {

    [datetime]$LogDate
    [string]$Result
    [string]$Note

    LogInformation ([datetime]$dt, [string]$result, [string]$note) {
        $this.LogDate = $dt
        $this.Result = $result
        $this.Note = $note
    }
}


$loginfos = @()

$loginfos += [LogInformation]::new((Get-date),'SUCCESS','any note')
$loginfos += [LogInformation]::new(((Get-date).AddMinutes((Get-Random -Minimum 1 -Maximum 3))),'ERROR','any other note')
$loginfos += [LogInformation]::new(((Get-date).AddMinutes((Get-Random -Minimum 1 -Maximum 3))),'WAITING','poor network performance ...')
$loginfos += [LogInformation]::new(((Get-date).AddMinutes((Get-Random -Minimum 1 -Maximum 3))),'ERROR','no network connection ...')

$loginfos

# Create Logfile

$loginfos | Export-Csv -Path C:\MAPS2403\Logfiles\Log02.log

# Get CSV

$loginfosImported = Import-Csv -Path C:\MAPS2403\Logfiles\Log02.log
$loginfosImported | Get-Member
$loginfosImported  
$loginfosImported | Sort-Object Result
$loginfosImported | Where-Object { $_.result -eq 'ERROR' }

# new Log entries

$loginfosNext = @()
$loginfosNext += [LogInformation]::new((Get-date),'WAITING','for lunch')
$loginfosNext += [LogInformation]::new((Get-date),'SUCCESS','Server shut down')
$loginfosNext += [LogInformation]::new((Get-date),'SUCCESS','Temp cleared')

$loginfosNext

$loginfosNext | Export-Csv -Path C:\MAPS2403\Logfiles\Log02.log -Append
