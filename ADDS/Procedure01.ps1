

# RSAT Installation Windows 11
Get-WindowsCapability -Online
Add-WindowsCapability -Online -Name 'Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0'

# OU Mgmt
Get-ADOrganizationalUnit -Filter *
Get-ADOrganizationalUnit -Identity 'OU=domain Controllers,dc=maps,dc=local'

New-ADOrganizationalUnit -Path 'dc=maps,dc=local' -Name Detectives -Description 'Famous TV Detectives ...'

Get-ADOrganizationalUnit -Identity 'OU=detectives,dc=maps,dc=local' -Properties Description | Format-List DistinguishedName,Description

Set-ADOrganizationalUnit -Identity 'OU=detectives,dc=maps,dc=local' -City London

Set-ADOrganizationalUnit -Identity 'OU=detectives,dc=maps,dc=local' -ProtectedFromAccidentalDeletion  $false
Remove-ADOrganizationalUnit -Identity 'OU=detectives,dc=maps,dc=local'

# User Mgmt
Get-ADUser -Filter *          # Get ALL users from AD
Get-ADUser -Identity Admin    # Get only 1 user

New-ADUser -Path 'OU=detectives,dc=maps,dc=local' -Name 'Sherlock Holmes' `
                                                  -GivenName Sherlock `
                                                  -Surname Holmes `
                                                  -UserPrincipalName 'sherlock@maps.local' `
                                                  -SamAccountName Sherlock `
                                                  -City London `
                                                  -StreetAddress 'Bakerstreet 221b'
Get-ADUser -Identity Sherlock

Enable-ADAccount -Identity Sherlock # not possible without a password

$pwd = ConvertTo-SecureString -String 'Pa55w.rd' -AsPlainText -Force
Set-ADAccountPassword -Identity Sherlock -NewPassword $pwd 
Enable-ADAccount -Identity Sherlock
Set-ADUser -Identity Sherlock -ChangePasswordAtLogon $true

New-ADUser -Path 'OU=detectives,dc=maps,dc=local' -Name 'Jane Marple' `
                                                  -GivenName Jane `
                                                  -Surname Marple `
                                                  -City London `
                                                  -Enabled $true `
                                                  -AccountPassword $pwd `
                                                  -UserPrincipalName 'jane@maps.local' `
                                                  -SamAccountName Jane `
                                                  -ChangePasswordAtLogon $true
Get-ADUser -Identity Jane -Properties City

Get-ADUser -Filter * | Format-Table
Get-ADUser -Filter * -SearchBase 'OU=Detectives,dc=maps,dc=local' | Format-Table

Get-ADRootDSE | Select-Object -Property DefaultNamingContext

Get-ADUser -Filter * -SearchBase 'OU=Detectives,dc=maps,dc=local' -SearchScope OneLevel | Format-Table  # SearchScope OneLevel = non-recurive query.


# Group Mgmt
Get-ADGroup -Filter *
Get-ADGroup -Identity 'Domain Admins'

New-ADGroup -Path 'OU=Detectives,dc=maps,dc=local' -Name 'Detectives' `
                                                   -GroupCategory Security `
                                                   -GroupScope Universal `
                                                   -SamAccountName Detectives

Add-ADGroupMember -Identity Detectives -Members Sherlock,Jane

Get-ADGroupMember -Identity Detectives

Remove-ADGroupMember -Identity Detectives -Members Sherlock

# multiple users
$users = Get-ADUser -Filter * -SearchBase 'OU=detectives,dc=maps,dc=local'
# Get-ADUser -Filter * -Server 'dc1.maps.local' -SearchBase 'OU=detectives,dc=maps,dc=local'
$users
Add-ADGroupMember -Identity detectives -Members $users

Get-ADUser -Filter * -SearchBase 'OU=detectives,dc=maps,dc=local' | Add-ADGroupMember -Identity Detectives   # NOT WORKING !!!
Get-Help Add-ADGroupMember -ShowWindow


# Optimization
Get-ADUser -Filter * -Properties City | Where-Object { $_.City -eq 'London' } 

Get-ADUser -Filter { City -eq 'London' } -Properties City

# smart cmdlets
Get-ADGroupMember -Identity Detectives
Get-ADUser -Identity Sherlock -Properties MemberOf
Get-ADPrincipalGroupMembership -Identity Sherlock

Search-ADAccount -LockedOut
Search-ADAccount -AccountInactive

# Mgmt of attributes

Set-ADUser -Identity Sherlock -EmployeeID 'D0301' -EmployeeNumber 1 -EmployeeType 'Elementary'

$htAttributes = @{
    EmployeeID='D0301'
    EmployeeNumber = 1
    EmployeeType = 'Elementary'
    # ProxyAddresses = @(...,...,...)
}
Set-ADUser -Identity Sherlock -Add $htAttributes
Get-ADUser -Identity Sherlock -Properties EmployeeID,EmployeeNumber,EmployeeType

$htAttributes = @{
    EmployeeID='D0302'
    EmployeeNumber = 2
    EmployeeType = 'eine Frage habe ich noch ...'
    # ProxyAddresses = @(...,...,...)
}
New-ADUser -Path 'OU=Detectives,dc=maps,dc=local' -Name 'Inspector Columbo' `
                                                  -Surname 'Columbo' `
                                                  -GivenName 'Inspector' `
                                                  -SamAccountName 'Inspector' `
                                                  -UserPrincipalName 'inspector@maps.local' `
                                                  -OtherAttributes $htAttributes
Get-ADUser -Identity Inspector -Properties EmployeeID,EmployeeNumber,EmployeeType