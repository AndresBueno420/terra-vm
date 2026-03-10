terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "azure_linux_vm" {
  source = "./tf_modules/azure_linux_vm"

  rg_name                         = var.rg_name
  location                        = var.location
  vnet_name                       = var.vnet_name
  vnet_address_space              = var.vnet_address_space
  subnet_name                     = var.subnet_name
  subnet_prefixes                 = var.subnet_prefixes
  nic_name                        = var.nic_name
  nic_ip_config_name              = var.nic_ip_config_name
  nic_private_ip_allocation       = var.nic_private_ip_allocation
  public_ip_name                  = var.public_ip_name
  public_ip_allocation_method     = var.public_ip_allocation_method
  nsg_name                        = var.nsg_name
  ssh_rule_name                   = var.ssh_rule_name
  ssh_allowed_cidrs               = var.ssh_allowed_cidrs
  vm_name                         = var.vm_name
  vm_size                         = var.vm_size
  vm_admin_username               = var.vm_admin_username
  vm_admin_password               = var.vm_admin_password
  vm_os_disk_caching              = var.vm_os_disk_caching
  vm_os_disk_storage_account_type = var.vm_os_disk_storage_account_type
  vm_image_publisher              = var.vm_image_publisher
  vm_image_offer                  = var.vm_image_offer
  vm_image_sku                    = var.vm_image_sku
  vm_image_version                = var.vm_image_version
  tags                            = var.tags
}