
# Connection to Azure SQL Database

$connectionString = 'Server=tcp:mapssqlsrv-dist.database.windows.net,1433;Initial Catalog=db-dist;Persist Security Info=False;User ID=sqladmin-dist;Password=Pa55w.rd;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;'

try {
    $myConn = New-Object -TypeName System.Data.SqlClient.SqlConnection
    $myConn.ConnectionString = $connectionString
    $myConn.Open()

    $myDataAdapter = New-Object -TypeName System.Data.SqlClient.SqlDataAdapter('Select * From SalesLT.Customer', $myConn)
    $myDataTable = New-Object -TypeName System.Data.DataTable

    $RowCount = $myDataAdapter.Fill($myDataTable)

    # $myDataTable

    # $myDataTable | Select-Object -First 10 | Format-Table -Property firstname,lastname,companyname,emailaddress
    # $myDataTable | Sort-Object -Property CompanyName | Select-Object -First 10 | Format-Table -Property firstname,lastname,companyname,emailaddress

    $myDataTable.Rows[4].LastName

    "Rows: $RowCount"

    "*** FINISHED ***"

    
}
catch {
    $error[0]
}

$myConn.Close()