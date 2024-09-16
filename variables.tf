# Variable for the name of the virtual network
variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "my-vnet"
}

# Variable for the address space of the virtual network
variable "address_space" {
  description = "The address space of the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

# Variable for the name of the subnet
variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "subnetformmpls"
}

# Variable for the address prefix of the subnet
variable "subnet_prefix" {
  description = "The address prefix of the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

# Variable for the name of the resource group
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "POC-demo"
}

# Variable for the location of the resource group
variable "location" {
  description = "The location of the resource group"
  type        = string
  default     = "eastus"
}

# Variable for the ID of the Log Analytics Workspace
variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace"
  type        = string
  default     = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-resource-group/providers/Microsoft.OperationalInsights/workspaces/workspaceValue"
}

# Variable for the environment for the resources
variable "environment" {
  description = "The environment for the resources"
  type        = string
  default     = "dev"
}

# Variable for the name of the storage account
variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
  default     = "firsenayastorageaccount"
}

# Variable for the admin password for the VM
variable "admin_password" {
  description = "The admin password for the VM"
  type        = string
  default     = "ComplexP@ssw0rd!"  # Example of a compliant password
}

variable "sql_server_name" {
  description = "The name of the SQL server"
  type        = string
  default     = "funny-sql-server"
}

variable "admin_username" {
  description = "The administrator username for the SQL server"
  type        = string
  default     = "sqladminuser"  # Changed from "admin" to "sqladminuser"
}

variable "sql_database_name" {
  description = "The name of the SQL database"
  type        = string
  default     = "funny-sql-db"
}

# Variable for the managed disk ID for VM1
variable "managed_disk_id_vm1" {
  description = "The ID of the managed disk to attach to VM1"
  type        = string
  default     = "scooby"
}

# Variable for the managed disk ID for VM2
variable "managed_disk_id_vm2" {
  description = "The ID of the managed disk to attach to VM2"
  type        = string
  default     = "dooby"
}

# Variable for the name of the Cosmos DB account
variable "cosmosdb_account_name" {
  description = "The name of the Cosmos DB account"
  type        = string
  default     = "cosmosdb-ac"
}

variable "department" {
  description = "The department name."
  type        = string
  default     = "finance"
}

variable "application" {
  description = "The application name."
  type        = string
  default     = "emap"
}

# Variable for the ID of the subnet
variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
  default     = "Arandomsubnet"
}

variable "server_id" {
  description = "The ID of the server"
  type        = string
  default     = "my_server_id"
}