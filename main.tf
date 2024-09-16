# Resource Group
/*resource "azurerm_resource_group" "nrg" {
  name     = var.resource_group_name
  location = var.location
}*/




# VPC Module
module "vpc" {
  source              = "../modules/vpc"
  resource_group_name = azurerm_resource_group.nrg.name
  vnet_name           = var.vnet_name
  location            = azurerm_resource_group.nrg.location
  address_space       = var.address_space
  subnet_name         = var.subnet_name
  subnet_prefix       = var.subnet_prefix
}

# VM1 Module
module "vm1" {
  source              = "../modules/vm1"
  resource_group_name = azurerm_resource_group.nrg.name
  vm_name             = "my-vm1"
  vm_size             = "Standard_DS1_v2"
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  subnet_id           = module.vpc.subnet_id
  image_publisher     = "Canonical"
  image_offer         = "UbuntuServer"
  image_sku           = "18.04-LTS"
  image_version       = "latest"
  location            = azurerm_resource_group.nrg.location
}

# VM2 Module
module "vm2" {
  source              = "../modules/vm2"
  resource_group_name = azurerm_resource_group.nrg.name
  vm_name             = "my-vm2"
  vm_size             = "Standard_DS1_v2"
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  subnet_id           = module.vpc.subnet_id
  image_publisher     = "Canonical"
  image_offer         = "UbuntuServer"
  image_sku           = "18.04-LTS"
  image_version       = "latest"
  location            = azurerm_resource_group.nrg.location
}

# Storage Account Module
module "log_storage" {
  source                     = "../modules/log_storage"
  resource_group_name        = azurerm_resource_group.nrg.name
  location                   = var.location
  storage_account_name       = var.storage_account_name
  log_analytics_workspace_id = var.log_analytics_workspace_id
  environment                = var.environment
  subnet_id                  = var.subnet_id

}

# SQL Module
module "sql" {
  source              = "../modules/SQL"
  resource_group_name = azurerm_resource_group.nrg.name
  location            = var.location
  sql_server_name     = var.sql_server_name
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  sql_database_name   = var.sql_database_name
}

/*
# Create the Managed Grafana instance
resource "azurerm_managed_grafana" "grafana" {
  name                = var.grafana_name
  resource_group_name = azurerm_resource_group.nrg.name
  location            = azurerm_resource_group.nrg.location
  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "Terraform"
  }
}
*/
module "cosmosdb" {
  source              = "../modules/Cosmosdb"
  cosmosdb_account_name = var.cosmosdb_account_name
  location            = var.location
  resource_group_name = azurerm_resource_group.nrg.name
  sql_database_name   = var.sql_database_name
}

# Role Assignment for VM1
resource "azurerm_role_assignment" "cosmosdb_role_assignment_vm1" {
  principal_id         = module.vm1.principal_id
  role_definition_name = "Cosmos DB Account Reader Role"
  scope                = module.cosmosdb.cosmosdb_account_id
}

# Role Assignment for VM2
resource "azurerm_role_assignment" "cosmosdb_role_assignment_vm2" {
  principal_id         = module.vm2.principal_id
  role_definition_name = "Cosmos DB Account Reader Role"
  scope                = module.cosmosdb.cosmosdb_account_id
}
