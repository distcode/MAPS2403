
Register-PSRepository -Name 'LocalSMBRepo' -SourceLocation \\dc1\PSLocalRepo -ScriptSourceLocation \\dc1\PSLocalRepo -InstallationPolicy Trusted

# List current Package Sources
Get-PackageSource


# Publish / Upload module to LocalSBMRepo
Publish-Module -Path C:\MAPS2403\MAPSTools -Repository LocalSMBRepo -NuGetApiKey 'AnyPossibleKey'