module "resourcegroup-0000" {
  source              = "../../Modules/ResourceGroup/"
  resource_group_name = "P1"
  location            = local.region
  tags                = local.required_tags
}