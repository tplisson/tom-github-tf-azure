resource "azurerm_resource_group" "example" {
  name     = "example5"
  location = "West Europe"
}

resource "azurerm_resource_group" "example" {
  name     = "example5"
  location = var.location
}
