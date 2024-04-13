terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.98.0"
    }
  }
}

provider "azurerm" {
 features {}
}
/*
resource "azurerm_resource_group" "myrg" {
  name = var.resource_group_name
  location = var.location
  tags = var.common-tags
}
*/

data "azurerm_resource_group" "myrg" {
  name = "Data-source-rg01"
}

output "id" {
  value = data.azurerm_resource_group.myrg.id
}


resource "azurerm_storage_account" "storage01" {
  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.myrg.name
  location                 = data.azurerm_resource_group.myrg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = var.common-tags
}
