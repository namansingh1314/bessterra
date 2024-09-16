output "vnet_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.main.id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = azurerm_subnet.main.id
}
/*output "ddos_protection_plan_id" {
  value = azurerm_ddos_protection_plan.nrg.id
}
*/