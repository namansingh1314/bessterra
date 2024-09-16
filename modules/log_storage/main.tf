# This resource defines an Azure Storage Account named based on the value stored in the variable 'var.storage_account_name'
resource "azurerm_storage_account" "example" {
  name                 = var.storage_account_name  # Name of the Storage Account
  resource_group_name  = var.resource_group_name  # Resource group where the Storage Account resides
  location             = var.location              # Region where the Storage Account is located
  account_tier         = "Standard"                # Performance tier for the Storage Account (e.g., Standard, Premium)
  account_replication_type = "LRS"                  # Replication type for the Storage Account (e.g., LRS, GRS)

  # Define tags associated with the Storage Account for organizational purposes
  tags = {
    environment = var.environment  # Tag to identify the environment (e.g., dev, prod)
  }
}

# This resource creates a storage container named 'container01' within the Storage Account defined above
resource "azurerm_storage_container" "container1" {
  name                   = "container01"
  storage_account_name  = azurerm_storage_account.example.name  # Reference the Storage Account resource
  container_access_type = "private"                              # Access control for the container (e.g., private, public_read)
}

# Similar to container1, create another private container named 'container02'
resource "azurerm_storage_container" "container2" {
  name                   = "container02"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}

# Create a container named 'logs' for storing logs within the same Storage Account
resource "azurerm_storage_container" "log_container" {
  name                   = "logs"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}

# This resource configures a diagnostic setting to send logs from the Storage Account to a Log Analytics workspace
resource "azurerm_monitor_diagnostic_setting" "storage_account_logging" {
  name                   = "storage-account-logging"  # Name for the diagnostic setting
  target_resource_id     = azurerm_storage_account.example.id  # Reference the Storage Account resource
  log_analytics_workspace_id = var.log_analytics_workspace_id  # ID of the Log Analytics workspace

  # Commented out section: StorageWrite category is currently not supported
  # log {
  #   category = "StorageWrite"
  #   enabled  = true
  #
  #   retention_policy {
  #     enabled = true
  #     days    = 7
  #   }
  # }

  # Configure sending diagnostic metrics for the 'Transaction' category
  metric {
    category = "Transaction"
    enabled  = true

    # Commented out section: Retention policy is not currently defined for metrics
    # retention_policy {
    #   enabled = true
    #   days    = 7
    # }
  }
}