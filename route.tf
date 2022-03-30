resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_route_table" "example" {
  name                = "acceptanceTestRouteTable1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_route" "route1" {
  name                = "route11"
  resource_group_name = azurerm_resource_group.example.name
  route_table_name    = azurerm_route_table.example.name
  address_prefix      = "0.0.0.0/0"
  next_hop_type       = "vnetlocal"
}

resource "azurerm_route" "route2" {
  name                = "route12"
  resource_group_name = azurerm_resource_group.example.name
  route_table_name    = azurerm_route_table.example.name
  address_prefix      = "10.1.0.0/16"
  next_hop_type       = "Internet"
}

resource "azurerm_route" "route3" {
  name                = "route13"
  resource_group_name = azurerm_resource_group.example.name
  route_table_name    = azurerm_route_table.example.name
  address_prefix      = "0.0.0.0/0"
  next_hop_type       = "Internet"
}
