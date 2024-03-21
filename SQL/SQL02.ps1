
# Connection to Azure SQL Database

$connectionString = 'Server=tcp:mapssqlsrv-dist.database.windows.net,1433;Initial Catalog=db-dist;Persist Security Info=False;User ID=sqladmin-dist;Password=Pa55w.rd;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;'

try {
    $myConn = New-Object -TypeName System.Data.SqlClient.SqlConnection
    $myConn.ConnectionString = $connectionString
    $myConn.Open()

    $myComm = New-Object -TypeName System.Data.SqlClient.SqlCommand
    $myComm.CommandText = 'Select * From SalesLT.Customer'
    $myComm.Connection = $myConn

    $myDataReader = $myComm.ExecuteReader()

    $RowCount = 0
    while ($myDataReader.Read()) {
        
        $RowCount++
        "$($myDataReader.item('FirstName')) $($myDataReader.Item('LastName'))"
    }

    "Rows: $RowCount"

    "*** FINISHED ***"

    
}
catch {
    $error[0]
}

$myConn.Close()