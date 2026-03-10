variable "rg_name" {
	description = "Name of the Azure resource group."
	type        = string
	default     = "rg-andres-terra-vm-weu-01"
}

variable "location" {
	description = "Azure region where resources will be deployed."
	type        = string
	default     = "West Europe"
}

variable "vnet_name" {
	description = "Name of the virtual network."
	type        = string
	default     = "vnet-andres-terra-vm-weu-01"
}

variable "vnet_address_space" {
	description = "Address space for the virtual network."
	type        = list(string)
	default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
	description = "Name of the subnet."
	type        = string
	default     = "snet-andres-internal-weu-01"
}

variable "subnet_prefixes" {
	description = "Address prefixes for the subnet."
	type        = list(string)
	default     = ["10.0.2.0/24"]
}

variable "nic_name" {
	description = "Name of the network interface."
	type        = string
	default     = "nic-andres-vm-weu-01"
}

variable "nic_ip_config_name" {
	description = "Name of the network interface IP configuration."
	type        = string
	default     = "ipconfig1"
}

variable "nic_private_ip_allocation" {
	description = "Private IP allocation method for the NIC."
	type        = string
	default     = "Dynamic"
}

variable "public_ip_name" {
	description = "Name of the public IP address resource."
	type        = string
	default     = "pip-andres-vm-weu-01"
}

variable "public_ip_allocation_method" {
	description = "Allocation method for the public IP address."
	type        = string
	default     = "Static"
}

variable "nsg_name" {
	description = "Name of the network security group."
	type        = string
	default     = "nsg-andres-vm-weu-01"
}

variable "ssh_rule_name" {
	description = "Name of the NSG rule allowing SSH access."
	type        = string
	default     = "Allow-SSH-22"
}

variable "ssh_allowed_cidrs" {
	description = "CIDR ranges allowed to SSH to the VM. Restrict this in production."
	type        = list(string)
	default     = ["0.0.0.0/0"]
}

variable "vm_name" {
	description = "Name of the Linux virtual machine."
	type        = string
	default     = "vm-andres-linux-weu-01"
}

variable "vm_size" {
	description = "Size/SKU of the Linux virtual machine."
	type        = string
	default     = "Standard_F2"
}

variable "vm_admin_username" {
	description = "Admin username for the Linux virtual machine."
	type        = string
	default     = "andres"
}

variable "vm_admin_password" {
	description = "Admin password for the Linux virtual machine."
	type        = string
	sensitive   = true
	nullable    = false

	validation {
		condition     = length(var.vm_admin_password) >= 12
		error_message = "vm_admin_password must be at least 12 characters."
	}

	validation {
		condition     = can(regex("[A-Z]", var.vm_admin_password)) && can(regex("[a-z]", var.vm_admin_password)) && can(regex("[0-9]", var.vm_admin_password)) && can(regex("[^A-Za-z0-9]", var.vm_admin_password))
		error_message = "vm_admin_password must include uppercase, lowercase, number, and special character."
	}
}

variable "vm_os_disk_caching" {
	description = "Caching mode for the OS disk."
	type        = string
	default     = "ReadWrite"
}

variable "vm_os_disk_storage_account_type" {
	description = "Storage account type for the OS disk."
	type        = string
	default     = "Standard_LRS"
}

variable "vm_image_publisher" {
	description = "Publisher of the VM image."
	type        = string
	default     = "Canonical"
}

variable "vm_image_offer" {
	description = "Offer of the VM image."
	type        = string
	default     = "0001-com-ubuntu-server-jammy"
}

variable "vm_image_sku" {
	description = "SKU of the VM image."
	type        = string
	default     = "22_04-lts"
}

variable "vm_image_version" {
	description = "Version of the VM image."
	type        = string
	default     = "latest"
}

variable "tags" {
	description = "Tags to apply to all supported resources."
	type        = map(string)
	default = {
		environment = "lab"
		managed_by  = "terraform"
		owner       = "andres"
	}
}
