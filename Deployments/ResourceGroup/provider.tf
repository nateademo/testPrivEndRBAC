terraform {
  required_version = ">=1.2.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.16.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~>1.4.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
}

terraform {
  backend "azurerm" {
    resource_group_name  = "tf-state-rg"
    storage_account_name = "terraformsarnold"
    container_name       = "sandbox"
    key                  = "resourcegroup0.tfstate"
  }
}