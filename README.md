# Database Admin Toolkit

A collection of PowerShell scripts and tools to assist with database administration tasks.

## Scripts

### ConnectToDatabase.ps1

This script connects to a SQL Server database and executes a simple query.

#### Parameters
- **$serverInstance:** The SQL Server instance (e.g., `localhost\SQLEXPRESS`).
- **$database:** The name of the database to connect to (e.g., `AdventureWorks`).
- **$username:** The username for the SQL Server authentication (e.g., `sa`).
- **$password:** The password for the SQL Server authentication.

#### Usage
1. Open the script file and replace the placeholder values with your actual database configuration.
2. Save the changes.
3. Run the script in PowerShell:
   ```powershell
   .\scripts\ConnectToDatabase.ps1

# ReleaseSqlLock.ps1

This script identifies and releases blocking sessions in a SQL Server database by killing the blocking session.

## Parameters

- `$serverInstance`: The SQL Server instance (e.g., localhost\SQLEXPRESS).
- `$database`: The name of the database to connect to (e.g., AdventureWorks).
- `$username`: The username for the SQL Server authentication (e.g., sa).
- `$password`: The password for the SQL Server authentication.

## Usage

1. Open the script file and replace the placeholder values with your actual database configuration.
2. Save the changes.
3. Run the script in PowerShell:

```powershell
.\scripts\ReleaseSqlLock.ps1