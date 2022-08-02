variable "azurerm_virtual_network_name" {
  description = "VNet name."
}

variable "resource_group_name" {
  description = "The resource group name."
}

variable "location" {
  description = "The region were the resource will be deployed."
}

variable "address_prefixes" {
  type        = string
  description = "The address prefixes for the subnet."
}

variable "azurerm_subnet_name" {
  description = "The subnet name."
}
variable "enforce_private_link_endpoint_network_policies" {
  type        = bool
  description = "Enforce private link endpoint network policies."
}
