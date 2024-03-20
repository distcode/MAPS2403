

# New-ItemProperty -Path HKCU:\MAPS2403 -Name Level -Value 'Advanced' -PropertyType String

$htParameters = @{
    Path = 'HKCU:\MAPS2403'
    Name = 'Level'
    Value = 'Advanced'
    PropertyType = 'String'
}

$htParameters

New-ItemProperty @htParameters

