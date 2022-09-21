resource "azurerm_virtual_network" "vn1" {
  name                = "example-network-1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.1.0.0/16"]
  dns_servers         = ["10.1.0.4", "10.1.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.1.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.1.2.0/24"
    security_group = azurerm_network_security_group.nsg1.id
  }

  tags = {
    environment = "Production"
    yor_trace   = "a781ed50-b7e8-4e9f-a8b9-a09688169988"
  }
}

resource "azurerm_virtual_network" "vn2" {
  name                = "example-network-2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.2.0.0/16"]
  dns_servers         = ["10.2.0.4", "10.2.0.5"]

  tags = {
    environment = "Production"
    yor_trace   = "5334d91f-e3ba-4342-82c2-6a2a5b811927"
  }
}


resource "azurerm_virtual_network" "vn3" {
  name                = "example-network-3"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.3.0.0/16"]
  dns_servers         = ["10.3.0.4", "10.3.0.5"]

  subnet {
    name           = "subnet3"
    address_prefix = "10.3.3.0/24"
    security_group = azurerm_network_security_group.nsg1.id
  }

  tags = {
    environment = "Production"
    yor_trace   = "96cb860d-b513-4ba0-b576-608452cd635a"
  }
}

resource "azurerm_network_security_rule" "rule1" {
  name                        = "rule11"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "https"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg1.name
}

resource "azurerm_network_security_rule" "rule2" {
  name                        = "rule12"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Deny"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "https"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg1.name
}

resource "azurerm_network_security_rule" "rule3" {
  name                        = "rule13"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "https"
  source_address_prefix       = "1.1.1.1/32"
  destination_address_prefix  = "2.2.2.2/32"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg1.name
}
