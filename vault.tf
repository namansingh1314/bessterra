# Data source to get the current client configuration
data "azurerm_client_config" "nrg" {}

# Resource group definition (ensure this exists in your configuration)
resource "azurerm_resource_group" "nrg" {
  name     = ""
  location = "eastus"
}

# Key Vault resource definition
resource "azurerm_key_vault" "nrg" {
  name                        = "uneekkeevault"
  location                    = azurerm_resource_group.nrg.location
  resource_group_name         = azurerm_resource_group.nrg.name
  tenant_id                   = data.azurerm_client_config.nrg.tenant_id
  sku_name                    = "standard"

  # Enable soft delete and purge protection
  purge_protection_enabled    = true

  # Access policy for the current client
  access_policy {
    tenant_id = data.azurerm_client_config.nrg.tenant_id
    object_id = data.azurerm_client_config.nrg.object_id

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
    ]

    key_permissions = [
      "Get",
      "List",
      "Create",
      "Update",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Decrypt",
      "Encrypt",
      "Sign",
      "Verify",
      "WrapKey",
      "UnwrapKey",
    ]

    certificate_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "ManageContacts",
      "ManageIssuers",
      "GetIssuers",
      "ListIssuers",
      "SetIssuers",
      "DeleteIssuers",
    ]
  }
}

# Key Vault secret resource definition
resource "azurerm_key_vault_secret" "example_secret" {
  name         = "example-secret"
  value        = "your-secret-value"  # Replace with your actual secret value
  key_vault_id = azurerm_key_vault.nrg.id
}