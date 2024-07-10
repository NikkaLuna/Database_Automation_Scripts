
# Define the parameters
$serverInstance = "YourServerInstance"  # e.g., "localhost\SQLEXPRESS"
$database = "YourDatabaseName"          # e.g., "AdventureWorks"
$username = "YourUsername"              # e.g., "samantha"
$password = "YourPassword"              # Replace with your actual password

# Create a SQL connection string
$connectionString = "Server=$serverInstance;Database=$database;User Id=$username;Password=$password;"

# Define the SQL query to be executed
$sqlQuery = "SELECT TOP 10 * FROM YourTableName"  

# Load the SQL Server module if it's not already loaded
if (-not (Get-Module -ListAvailable -Name SqlServer)) {
    Install-Module -Name SqlServer -Force -AllowClobber
}

# Execute the SQL query and store the result
$result = Invoke-Sqlcmd -ConnectionString $connectionString -Query $sqlQuery

# Display the result
Write-Output $result
