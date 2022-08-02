module "KeyVault" {
  source                 = "../../Modules/KeyVault/"
  azurerm_key_vault_name = "natekv1test1"
  resource_group_name    = "P1"
  location               = "eastus2"
  secret_permissions     = ["get", "list", "set", "delete", "backup", "restore", "recover", "purge",]
}