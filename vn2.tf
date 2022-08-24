resource "azurerm_virtual_network" "fail" {
  name                = "fail"
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = {
    yor_trace = "694e41f9-24db-4458-8589-1c79cca86e48"
  }
}
