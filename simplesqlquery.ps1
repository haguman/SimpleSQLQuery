    $dataSource = datasource.fqdn.com
    $user = sqluser
    $pwd = password
    $database = databasename
    $connectionString = Server=$dataSource;uid=$user; pwd='$pwd';Database=$database;Integrated Security=False;
    $connection = New-Object System.Data.SqlClient.SqlConnection
    $connection.ConnectionString = $connectionString
    $connection.Open()
    $query = SELECT DISTINCT vCenter FROM input_virtualservers WHERE Status='Productie'
    $command = $connection.CreateCommand()
    $command.CommandText = $query
    $result = $command.ExecuteReader()
    $table = new-object System.Data.DataTable
    $table.Load($result)
    $connection.Close()
    return $table.vcenter | sort
