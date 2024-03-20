

#
Get-Command -noun Content

# create File
$anyLineOfText = '20-03-2024   SUCCESS   Update applied.'

Set-Content -Path C:\MAPS2403\Logfiles\Log01.log -Value $anyLineOfText


# read file

Get-Content -Path C:\MAPS2403\Logfiles\Log01.log 


# add content to file
$anyLineOfTextNext = '20-03-2024   ERROR   Failed to start  service XYZ.'

Add-Content -Path C:\MAPS2403\Logfiles\Log01.log -Value $anyLineOfTextNext

# search in file

Get-Content -Path C:\MAPS2403\Logfiles\Log01.log | Get-Member
(Get-Content -Path C:\MAPS2403\Logfiles\Log01.log).GetType()

$FileContent = Get-Content -Path C:\MAPS2403\Logfiles\Log01.log
$FileContent[1]

$FileContent | Where-Object { $_ -like '*ERROR*' }
$FileContent | Where-Object { $_ -like '*8*' -or $_ -like '*9*' }