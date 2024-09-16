# Create a Network Interface (NIC) named after the VM
resource "azurerm_network_interface" "main" {
  name                 = "${var.vm_name}-nic"
  location             = var.location
  resource_group_name  = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.main.id
  }
}

# Create a Public IP with static allocation
resource "azurerm_public_ip" "main" {
  name                 = "${var.vm_name}-public-ip"
  location             = var.location
  resource_group_name  = var.resource_group_name
  allocation_method    = "Static"
  sku                  = "Standard"
}

# Create the Virtual Machine (VM)
resource "azurerm_virtual_machine" "main" {
  name                 = var.vm_name
  location             = var.location
  resource_group_name  = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size              = var.vm_size

  identity {
    type = "SystemAssigned"
  }

  storage_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  storage_os_disk {
    name            = "${var.vm_name}-os-disk"
    caching         = "ReadWrite"
    create_option   = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = var.vm_name
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    environment = "Terraform"
  }
}