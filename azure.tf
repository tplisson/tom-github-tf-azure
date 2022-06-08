terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "<= 3.4.0"
    }
    azuread = {
      source = "hashicorp/azuread"
    version = "~> 2.22.0" }
  }
}

provider "azurerm" {
  features {}
}

