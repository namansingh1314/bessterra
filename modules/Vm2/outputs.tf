output "vm2_id" {
  value = azurerm_virtual_machine.main.id
}

output "vm2_public_ip" {
  value = azurerm_public_ip.main.ip_address
}

output "vm2_nic_id" {
  value = azurerm_network_interface.main.id
}
output "principal_id" {
  value = azurerm_virtual_machine.main.identity[0].principal_id
}