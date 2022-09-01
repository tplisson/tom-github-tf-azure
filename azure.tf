terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "<= 3.17.0"
    }
    azuread = {
      source = "hashicorp/azuread"
    version = "~> 2.22.0" }
  }
}

provider "azurerm" {
  features {}
}

