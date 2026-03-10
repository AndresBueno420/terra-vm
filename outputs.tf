output "vm_public_ip" {
  description = "Public IP address assigned to the VM."
  value       = module.azure_linux_vm.vm_public_ip
}

output "vm_ssh_connection" {
  description = "SSH command for connecting to the VM over port 22."
  value       = module.azure_linux_vm.vm_ssh_connection
}
