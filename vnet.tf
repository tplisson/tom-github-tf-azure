resource "azurerm_resource_group" "rg" {
 name = "rg-resources"
 location = "Canada Central"
}

resource "azurerm_virtual_network" "fail" {
  name                = "fail"
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
