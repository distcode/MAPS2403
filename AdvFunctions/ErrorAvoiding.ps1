

#Requires -Modules ABJson

Set-StrictMode -Version latest

if ( -not (Test-Path c:\Tmp)) {
    
    md C:\Tmp    
}

$Processes = Get-Process

if ( $Processes.Name -contains 'regedit' ) {

    return -1
}


get-help about_requires -ShowWindow
