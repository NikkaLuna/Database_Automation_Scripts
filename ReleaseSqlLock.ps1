# Define the parameters
$serverInstance = "YourServerInstance"  # e.g., "localhost\SQLEXPRESS"
$database = "YourDatabaseName"          # e.g., "AdventureWorks"
$username = "YourUsername"              # e.g., "sa"
$password = "YourPassword"              # Replace with your actual password

# Create a SQL connection string
$connectionString = "Server=$serverInstance;Database=$database;User Id=$username;Password=$password;"

# Load the SQL Server module if it's not already loaded
if (-not (Get-Module -ListAvailable -Name SqlServer)) {
    Install-Module -Name SqlServer -Force -AllowClobber
}

# Define the SQL query to identify blocking sessions
$blockingQuery = @"
SELECT blocking_session_id AS BlockingSessionID
FROM sys.dm_exec_requests
WHERE blocking_session_id <> 0;
"@

# Execute the query to get the blocking session ID
$blockingSessions = Invoke-Sqlcmd -ConnectionString $connectionString -Query $blockingQuery

# Check if there are any blocking sessions
if ($blockingSessions) {
    foreach ($session in $blockingSessions) {
        $blockingSessionID = $session.BlockingSessionID
        
        # Define the SQL query to kill the blocking session
        $killQuery = "KILL $blockingSessionID;"

        # Execute the kill query
        Invoke-Sqlcmd -ConnectionString $connectionString -Query $killQuery
        Write-Output "Killed blocking session with ID: $blockingSessionID"
    }
} else {
    Write-Output "No blocking sessions found."
}
