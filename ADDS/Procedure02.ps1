$OrganizationalUnit = "OU=Detectives,DC=maps,DC=local"
$GroupName = "Detectives"

# Set-Location AD:
$Group = Get-ADGroup -Identity $GroupName
$GroupSID = [System.Security.Principal.SecurityIdentifier]$Group.SID
$ACL = Get-Acl -Path "AD:\$OrganizationalUnit"

$Identity = [System.Security.Principal.IdentityReference]$GroupSID
$ADRight = [System.DirectoryServices.ActiveDirectoryRights]::GenericAll
$Type = [System.Security.AccessControl.AccessControlType]::Allow
$InheritanceType = [System.DirectoryServices.ActiveDirectorySecurityInheritance]::All
$Rule = New-Object System.DirectoryServices.ActiveDirectoryAccessRule($Identity, $ADRight, $Type,  $InheritanceType)

$ACL.AddAccessRule($Rule)
Set-Acl -Path "ad:\$OrganizationalUnit" -AclObject $ACL


# Docu Link(s)
# https://learn.microsoft.com/en-us/dotnet/api/system.directoryservices.activedirectoryrights?view=dotnet-plat-ext-8.0
# https://learn.microsoft.com/en-us/dotnet/api/system.security.accesscontrol.accesscontroltype?view=net-8.0
# https://learn.microsoft.com/en-us/dotnet/api/system.directoryservices.activedirectoryaccessrule?view=dotnet-plat-ext-8.0
#
# https://learn.microsoft.com/en-us/answers/questions/364180/powershell-script-delegate-ou-permissions