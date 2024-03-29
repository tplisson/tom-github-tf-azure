resource "azurerm_route_table" "rt" {
  name                = "acceptanceTestRouteTable1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = {
    owner     = "tplisson"
    yor_trace = "7b2a47cb-a085-46ee-839f-0a023e2fdfc3"
  }
}

resource "azurerm_route" "route1" {
  name                = "route1"
  resource_group_name = azurerm_resource_group.rg.name
  route_table_name    = azurerm_route_table.rt.name
  address_prefix      = "0.0.0.0/0"
  next_hop_type       = "VnetLocal"
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
