
$htParameters = @{
    Subject = 'CN=PS Signing'
    Type = 'CodeSigning'
    CertStoreLocation = 'Cert:\CurrentUser\My'
    HashAlgorithm = 'sha256'
}

New-SelfSignedCertificate @htParameters

$cert = get-ChildItem Cert:\CurrentUser\My\D1E9EFAF402A1D8A102763A0A424732B50311686

# Export public key / root certificate
Export-Certificate -Type CERT -FilePath C:\Temp\rootSSC-01.cer -Cert $cert
Import-Certificate -FilePath C:\Temp\rootSSC-01.cer -CertStoreLocation Cert:\CurrentUser\Root

# Signing
Set-AuthenticodeSignature -FilePath C:\MAPS2403\AdvFunctions\Signing-Script.ps1 -Certificate $cert
