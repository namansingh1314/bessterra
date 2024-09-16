output "funny_sql_server_name" {
  description = "The name of the funny SQL server"
  value       = azurerm_mssql_server.funny_sql_server.name
}

output "funny_sql_database_name" {
  description = "The name of the funny SQL database"
  value       = azurerm_mssql_database.funny_sql_db.name
}