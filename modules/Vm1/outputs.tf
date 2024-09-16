output "vm1_id" {
  value = azurerm_virtual_machine.main.id
}

output "vm1_public_ip" {
  value = azurerm_public_ip.main.ip_address
}

output "vm1_nic_id" {
  value = azurerm_network_interface.main.id
}
output "principal_id" {
  value = azurerm_virtual_machine.main.identity[0].principal_id
}