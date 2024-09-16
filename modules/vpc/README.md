This file will provide documentation for your VPC module.

# VPC Module

This module creates a Virtual Network and a Subnet in Azure.

## Inputs

- `resource_group_name`: The name of the resource group.
- `vnet_name`: The name of the virtual network.
- `address_space`: The address space for the virtual network.
- `subnet_name`: The name of the subnet.
- `subnet_prefix`: The address prefix for the subnet.

## Outputs

- `vnet_id`: The ID of the virtual network.
- `subnet_id`: The ID of the subnet.
