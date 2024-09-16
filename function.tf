
# Define the Storage Account for the Function App
resource "azurerm_storage_account" "funct" {
  name                     = "functionnn"  # Name of the storage account
  resource_group_name      = azurerm_resource_group.nrg.name  # Name of the resource group where the storage account will be created
  location                 = azurerm_resource_group.nrg.location  # Location of the storage account, same as the resource group
  account_tier             = "Standard"  # Tier of the storage account
  account_replication_type = "LRS"  # Replication type of the storage account (Locally Redundant Storage)
}

# Define the App Service Plan for the Function App
resource "azurerm_app_service_plan" "app_service_plan" {
  name                = "app-service-plan"  # Name of the app service plan
  resource_group_name = azurerm_resource_group.nrg.name  # Name of the resource group where the app service plan will be created
  location            = azurerm_resource_group.nrg.location  # Location of the app service plan, same as the resource group

  # SKU block to define the pricing tier and size of the app service plan
  sku {
    tier = "Standard"  # Pricing tier
    size = "S1"  # Size of the app service plan
  }
}

# Define the Function App
resource "azurerm_function_app" "function_app" {
  name                       = "functionappna-unique-12345"  # Name of the function app (must be globally unique)
  resource_group_name        = azurerm_resource_group.nrg.name  # Name of the resource group where the function app will be created
  location                   = azurerm_resource_group.nrg.location  # Location of the function app, same as the resource group
  app_service_plan_id        = azurerm_app_service_plan.app_service_plan.id  # ID of the app service plan to associate with the function app
  storage_account_name       = azurerm_storage_account.funct.name  # Name of the storage account to associate with the function app
  storage_account_access_key = azurerm_storage_account.funct.primary_access_key  # Access key for the storage account

  https_only = true  # Enforce HTTPS-only access

  # Application settings for the function app
  app_settings = {
    "AzureWebJobsStorage"        = "DefaultEndpointsProtocol=https;AccountName=${azurerm_storage_account.funct.name};AccountKey=${azurerm_storage_account.funct.primary_access_key};EndpointSuffix=core.windows.net"
    "FUNCTIONS_EXTENSION_VERSION" = "~3"  # Version of the Azure Functions runtime
  }

  # Site configuration for the function app
  site_config {
    always_on = true  # Keep the function app always on
  }
}