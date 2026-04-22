terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.69.0"
    }
  }
}

provider "azurerm" {
  features {}

  use_cli = true
}

resource "azurerm_resource_group" "rg_block" {
  name = "terraformrg"
  location = "westus"
  tags ={

    "env" = "DEV"
  }
}

resource "azurerm_virtual_network" "vnet_block" {
  name = "tf_vnet"
  location = azurerm_resource_group.rg_block.location
  resource_group_name = azurerm_resource_group.rg_block.name
  address_space = ["10.0.0.0/16"]
  subnet  {
    name = "subnet1"
    address_prefixes = ["10.0.1.0/24"]
  }
  subnet  {
    name = "subnet2"
    address_prefixes = ["10.0.2.0/24"]
  }
  tags = {
    "env" = "DEV"
  }
}
