output "vm_public_ip" {
  description = "Public IP address assigned to the VM."
  value       = azurerm_public_ip.pip.ip_address
}

output "vm_ssh_connection" {
  description = "SSH command for connecting to the VM over port 22."
  value       = "ssh ${var.vm_admin_username}@${azurerm_public_ip.pip.ip_address} -p 22"
}
