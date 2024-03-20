
$htParameters = @{
    Subject = 'CN=PS Signing'
    Type = 'CodeSigning'
    CertStoreLocation = 'Cert:\CurrentUser\My'
    HashAlgorithm = 'sha256'
}

New-SelfSignedCertificate @htParameters

$cert = get-ChildItem Cert:\CurrentUser\My\D1E9EFAF402A1D8A102763A0A424732B50311686



