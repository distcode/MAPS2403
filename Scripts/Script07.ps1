

param (

    [parameter(Mandatory=$true,HelpMessage='Bitte einen Vornamen eingeben.',ParameterSetName='Age')]
    [parameter(Mandatory=$true,HelpMessage='Bitte einen Vornamen eingeben.',ParameterSetName='Year')]
    [ValidateLength(4,18)]
    [String]$Firstname,

    [parameter(ParameterSetName='Age')]
    [int]$Age = 29,

    [parameter(ParameterSetName='Year')]
    [Alias('Jahr')]
    [ValidateRange(1965,2002)]
    [int]$YearOfBirth = 1999,

    [parameter(ParameterSetName='Age')]
    [parameter(ParameterSetName='Year')]
    [ValidateSet('IT','Sales','Marketing','Board')]
    [String]$Department,

    [Switch]$mySwitch


)

if ( $PSCmdlet.ParameterSetName -eq 'Age' ) { 

    "Servus $Firstname, Du bist also $Age Jahre alt."
}
else {
    
    $Age = (get-date).Year - $YearOfBirth
    "Servus $Firstname, Du bist also $Age Jahre alt."
}

$mySwitch

# $PSBoundParameters.Keys