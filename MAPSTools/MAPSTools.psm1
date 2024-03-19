
function Write-Hello {
    
    param (
        [String]$Name = 'Fellow'
    )

    Write-Host "Hello $Name!" -ForegroundColor Green
}

function Write-Goodbye {

    Write-Host "Thank you and Good bye ..." -ForegroundColor Cyan
}

. .\ExternalFunction01.ps1

# Export-ModuleMember -Function @('Write-Hello','Write-ExternalData')