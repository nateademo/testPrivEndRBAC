variable "azurerm_virtual_network_name" {
    description = "VNet name."
}

variable "resource_group_name" {
  description = "The resource group name."
}

variable "location" {
  description = "The region were the resource will be deployed."
}

variable "address_space" {
  type        = string
  description = "The address space that is used the virtual network."
}

variable "dns_servers" {
  description =   "List of IP addresses of DNS servers"
}

variable "tags" {
  description =   "Map of tags"
  type        = map(string)
}