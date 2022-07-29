module "DNS-RG" {
  source              = "../../Modules/ResourceGroup/"
  resource_group_name = "DNS-RG"
  location            = local.region
  tags                = local.required_tags
}