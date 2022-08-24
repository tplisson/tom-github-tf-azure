resource "azurerm_route_table" "rt" {
  name                = "acceptanceTestRouteTable1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = {
    yor_trace = "d18336fa-691a-43d4-8864-e6352ab3fab2"
  }
}

resource "azurerm_route" "route1" {
  name                = "route1"
  resource_group_name = azurerm_resource_group.rg.name
  route_table_name    = azurerm_route_table.rt.name
  address_prefix      = "0.0.0.0/0"
  next_hop_type       = "vnetlocal"
}

resource "azurerm_route" "route2" {
  name                = "route2"
  resource_group_name = azurerm_resource_group.rg.name
  route_table_name    = azurerm_route_table.rt.name
  address_prefix      = "10.1.0.0/16"
  next_hop_type       = "Internet"
}

resource "azurerm_route" "route3" {
  name                = "route3"
  resource_group_name = azurerm_resource_group.rg.name
  route_table_name    = azurerm_route_table.rt.name
  address_prefix      = "0.0.0.0/0"
  next_hop_type       = "Internet"
}
