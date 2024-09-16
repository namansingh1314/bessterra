# Outputs
output "vm1_id" {
  value = module.vm1.vm1_id
}

output "vm2_id" {
  value = module.vm2.vm2_id
}

output "storage_account_name" {
  value = module.log_storage.storage_account_name
}
/*
output "log_storagcontainer_name" {
  value = module.storage.log_container_name
}
*/
output "storage_account_primary_connection_string" {
  value     = module.log_storage.storage_account_primary_connection_string
  sensitive = true
}

output "key_vault_id" {
  value = azurerm_key_vault.nrg.id
}

output "key_vault_name" {
  value = azurerm_key_vault.nrg.name
}

data "azurerm_key_vault_secret" "nrg" {
  name         = "example-secret"
  key_vault_id = azurerm_key_vault.nrg.id
  depends_on   = [azurerm_key_vault_secret.example_secret]  # Ensure the secret is created first
}

output "nrg_secret_value" {
  value     = data.azurerm_key_vault_secret.nrg.value
  sensitive = true
}

output "funny_sql_server_name" {
  value = module.sql.funny_sql_server_name
}

output "funny_sql_database_name" {
  value = module.sql.funny_sql_database_name
}

output "cosmosdb_account_name" {
  value = module.cosmosdb.cosmosdb_account_name
}

output "sql_database_name" {
  value = module.cosmosdb.sql_database_name
}

output "vm1_principal_id" {
  value = module.vm1.principal_id
}

output "vm2_principal_id" {
  value = module.vm2.principal_id
}

