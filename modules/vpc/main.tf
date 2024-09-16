
# Define the virtual network
resource "azurerm_virtual_network" "main" {
  name                = var.vnet_name            # Name of the virtual network from variable
  address_space       = var.address_space        # Address space of the virtual network from variable
  location            = var.location             # Location of the virtual network from variable
  resource_group_name = var.resource_group_name  # Reference to the resource group created above

  tags = {
    environment = "Terraform"  # Tag to identify the environment
  }
}

# Define the subnet with Service Endpoints
resource "azurerm_subnet" "main" {
  name                 = var.subnet_name                # Name of the subnet from variable
  resource_group_name  = var.resource_group_name        # Name of the resource group from variable
  virtual_network_name = azurerm_virtual_network.main.name  # Reference to the virtual network created above
  address_prefixes     = [var.subnet_prefix]            # Address prefix of the subnet from variable

  service_endpoints = ["Microsoft.Storage", "Microsoft.Sql"]  # Service endpoints for the subnet
}

# Associate the NSG with the subnet
resource "azurerm_subnet_network_security_group_association" "main" {
  subnet_id                 = azurerm_subnet.main.id  # Reference to the subnet created above
  network_security_group_id =  azurerm_network_security_group.ssh_nsg.id             # ID of the network security group from variable
}
# NSG for SSH
resource "azurerm_network_security_group" "ssh_nsg" {
  name                = "ssh-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "DenyAllInbound"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}