variable "resource_group_name" {
  description = "The resource group name."
}
variable "location" {
  description = "The region were the resource will be deployed."
}

variable "azurerm_storage_account_name" {
  description = "The storage account name."
}

variable "account_tier" {
  description = " The access tier for the storage account."
  default     = "Standard"
}

variable "account_replication_type" {
  default = "LRS"
}
variable "min_tls_version" {
  default = "TLS1_2"
}

variable "diagnostic_setting_log_analytics_workspace_id" {
  description = "The log analytics resource id"
}