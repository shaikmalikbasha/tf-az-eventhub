# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.52.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}

  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = var.resourceGroupName
  location = var.resourceGroupLocation

  tags = {
    "costCenter" = "TerraformPOC"
  }

  lifecycle {
    prevent_destroy = true
  }
}
