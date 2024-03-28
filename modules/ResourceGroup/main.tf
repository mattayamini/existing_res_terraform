terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "example" {
  name = "res-test"
}

resource "azurerm_virtual_network" "ex_vnet" {
  name                = var.virnet
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name
  address_space       = [var.addrspace]
}

resource "azurerm_subnet" "s1" {
  name                 = var.snet
  resource_group_name  = data.azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.ex_vnet.name
  address_prefixes     = [var.saddrspace]
}
