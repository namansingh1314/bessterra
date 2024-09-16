resource "random_string" "unique_suffix" {
  length  = 8
  special = false
  upper   = false
}

resource "azurerm_mssql_server" "funny_sql_server" {
  name                         = "${var.sql_server_name}${random_string.unique_suffix.result}"
  resource_group_name          = var.resource_group_name  # Use the variable instead of undeclared resource
  location                     = var.location             # Use the variable instead of undeclared resource
  version                      = "12.0"
  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password

  tags = {
    environment = "Terraform"
  }
}

resource "azurerm_mssql_database" "funny_sql_db" {
  name                = "${var.sql_database_name}${random_string.unique_suffix.result}"
  server_id           = azurerm_mssql_server.funny_sql_server.id
  sku_name            = "Basic"

  tags = {
    environment = "Terraform"
  }
}