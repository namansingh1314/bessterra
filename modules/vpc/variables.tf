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
}

# Variable for the location of the resources
variable "location" {
  description = "The location of the resources"
  type        = string
}

# Variable for the name of the resource group
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

# Variable for the name of the subnet
variable "subnet_name" { 
  description = "The name of the subnet"
  type        =  string
}

# Variable for the address prefix of the subnet
variable "subnet_prefix" {
  description = "The address prefix of the subnet"
  type        = string
}

