variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
  default     = "my-vm2"
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
  default     = "Standard_DS1_v2"
}

variable "admin_username" {
  description = "The admin username for the virtual machine"
  type        = string
  default     = "adminuser"
}

variable "admin_password" {
  description = "The admin password for the virtual machine"
  type        = string
  default     = "ComplexP@ssw0rd!"
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
}

variable "image_publisher" {
  description = "The publisher of the image"
  type        = string
  default     = "Canonical"
}

variable "image_offer" {
  description = "The offer of the image"
  type        = string
  default     = "UbuntuServer"
}

variable "image_sku" {
  description = "The SKU of the image"
  type        = string
  default     = "18.04-LTS"
}

variable "image_version" {
  description = "The version of the image"
  type        = string
  default     = "latest"
}

variable "location" {
  description = "The location of the resources"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}
