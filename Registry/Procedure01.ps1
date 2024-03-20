

regedit.exe

Get-PSProvider
Get-PSDrive

# Keys
Get-ChildItem -Path hkcu:\

New-Item -Path HKCU:\ -Name MAPS -ItemType Key

Rename-Item -Path HKCU:\MAPS -NewName MAPS2403
# Remove-Item -Path HKCU:\MAPS2403 -Recurse -Force

# Values
Get-Command -noun Itemproperty

New-ItemProperty -Path HKCU:\MAPS2403 -Name Location -Value 'Wien' -PropertyType String
New-ItemProperty -Path HKCU:\MAPS2403 -Name Count -Value 5 -PropertyType DWORD

Set-ItemProperty -Path HKCU:\MAPS2403 -Name Location -Value 'Wien + Remote' 

Remove-ItemProperty -Path HKCU:\MAPS2403 -Name Location

# Read (Get) Values
# 1.
Get-Item -Path HKCU:\MAPS2403
(Get-Item -Path HKCU:\MAPS2403).GetValue('Location')
(Get-Item -Path HKCU:\MAPS2403).GetValueNames()
(Get-Item -Path HKCU:\MAPS2403).GetValueKind('Count')

# 2.
Get-ItemProperty -Path HKCU:\MAPS2403 -Name Location
Get-ItemProperty -Path HKCU:\MAPS2403 -Name Location | Get-Member
(Get-ItemProperty -Path HKCU:\MAPS2403 -Name Location).Location
(Get-ItemProperty -Path HKCU:\MAPS2403).Location

# 3.
# PowerShell 5.1 required
Get-ItemPropertyValue -Path HKCU:\MAPS2403 -Name Count
