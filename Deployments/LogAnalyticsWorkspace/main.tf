module "resourcegroup-0000" {
  source              = "../../Modules/ResourceGroup/"
  resource_group_name = "P1"
  location            = local.region
  tags                = local.required_tags
}

module "loganalyticsworkspace-0000" {
  source                        = "../../Modules/LogAnalyticsWorkspace/"
  azurerm_log_analytics_workspace_name  = "NateLogWS1"
  location            = local.region
  resource_group_name = module.resourcegroup-0000.name
  retention_in_days   = "30"
}