# Defines a variable named 'storage_account_name'
variable "storage_account_name" {
  description = "The name of the storage account"  # Description for the variable
  type        = string                          # Data type for the variable (string)
}

# Defines a variable named 'resource_group_name'
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

# Defines a variable named 'location'
variable "location" {
  description = "The location of the resource group"
  type        = string
}

# Defines a variable named 'subnet_id'
variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
}

# Defines a variable named 'log_analytics_workspace_id'
variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace"
  type        = string
}

# Defines a variable named 'environment'
variable "environment" {
  description = "The environment for the resources"
  type        = string
}