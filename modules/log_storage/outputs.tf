# Output the name of the Storage Account
output "storage_account_name" {
  value = azurerm_storage_account.example.name
  # Description: This output exposes the name of the Azure Storage Account created by the 'azurerm_storage_account.example' resource.
}

# Output the name of the log container
output "log_container_name" {
  value = azurerm_storage_container.log_container.name
  # Description: This output exposes the name of the 'logs' container created within the Storage Account.
}

# Output the Storage Account's primary connection string (potentially sensitive)
output "storage_account_primary_connection_string" {
  value = azurerm_storage_account.example.primary_connection_string
  sensitive = true  # Mark this output as containing sensitive information
  # Description: This output exposes the primary connection string for the Storage Account. 
  # Be cautious when using this output as it contains credentials and should be handled securely in your application.
}