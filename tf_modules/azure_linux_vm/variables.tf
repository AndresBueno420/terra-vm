variable "rg_name" {
  description = "Name of the Azure resource group."
  type        = string
}

variable "location" {
  description = "Azure region where resources will be deployed."
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network."
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the virtual network."
  type        = list(string)
}

variable "subnet_name" {
  description = "Name of the subnet."
  type        = string
}

variable "subnet_prefixes" {
  description = "Address prefixes for the subnet."
  type        = list(string)
}

variable "nic_name" {
  description = "Name of the network interface."
  type        = string
}

variable "nic_ip_config_name" {
  description = "Name of the network interface IP configuration."
  type        = string
}

variable "nic_private_ip_allocation" {
  description = "Private IP allocation method for the NIC."
  type        = string
}

variable "public_ip_name" {
  description = "Name of the public IP address resource."
  type        = string
}

variable "public_ip_allocation_method" {
  description = "Allocation method for the public IP address."
  type        = string
}

variable "nsg_name" {
  description = "Name of the network security group."
  type        = string
}

variable "ssh_rule_name" {
  description = "Name of the NSG rule allowing SSH access."
  type        = string
}

variable "ssh_allowed_cidrs" {
  description = "CIDR ranges allowed to SSH to the VM."
  type        = list(string)
}

variable "vm_name" {
  description = "Name of the Linux virtual machine."
  type        = string
}

variable "vm_size" {
  description = "Size/SKU of the Linux virtual machine."
  type        = string
}

variable "vm_admin_username" {
  description = "Admin username for the Linux virtual machine."
  type        = string
}

variable "vm_admin_password" {
  description = "Admin password for the Linux virtual machine."
  type        = string
  sensitive   = true
}

variable "vm_os_disk_caching" {
  description = "Caching mode for the OS disk."
  type        = string
}

variable "vm_os_disk_storage_account_type" {
  description = "Storage account type for the OS disk."
  type        = string
}

variable "vm_image_publisher" {
  description = "Publisher of the VM image."
  type        = string
}

variable "vm_image_offer" {
  description = "Offer of the VM image."
  type        = string
}

variable "vm_image_sku" {
  description = "SKU of the VM image."
  type        = string
}

variable "vm_image_version" {
  description = "Version of the VM image."
  type        = string
}

variable "tags" {
  description = "Tags to apply to all supported resources."
  type        = map(string)
}
