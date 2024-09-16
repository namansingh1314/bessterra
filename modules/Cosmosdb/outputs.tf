output "cosmosdb_account_name" {
  description = "The name of the Cosmos DB account"
  value       = azurerm_cosmosdb_account.cosmosdb.name
}

output "sql_database_name" {
  description = "The name of the SQL database"
  value       = azurerm_cosmosdb_sql_database.example_database.name
}

output "cosmosdb_account_id" {
  description = "The ID of the Cosmos DB account"
  value       = azurerm_cosmosdb_account.cosmosdb.id
}