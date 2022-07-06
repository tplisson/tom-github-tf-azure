resource "azurerm_virtual_network" "vn" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "good1" {
  name                 = "good subnet1"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vn.name
  address_prefixes     = ["10.0.1.0/24"]
}

<<<<<<< HEAD
resource "azurerm_network_security_group" "nsg1" {
  name                = "example-nsg"
=======
resource "azurerm_network_security_group" "good" {
  name                = "good nsg"
>>>>>>> 4f2dfdffcd6384a68b98bb85f98c739696f71caf
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "rule100"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

<<<<<<< HEAD
resource "azurerm_subnet_network_security_group_association" "assoc1" {
  subnet_id                 = azurerm_subnet.good1.id
  network_security_group_id = azurerm_network_security_group.nsg1.id
=======
resource "azurerm_subnet_network_security_group_association" "assoc" {
  subnet_id                 = azurerm_subnet.good.id
  network_security_group_id = azurerm_network_security_group.good.id
>>>>>>> 4f2dfdffcd6384a68b98bb85f98c739696f71caf
}

resource "azurerm_subnet" "bad" {
  name                 = "bad subnet1"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vn.name
  address_prefixes     = ["10.0.2.0/24"]
}

# resource "azurerm_subnet" "notsobad" {
#   name                 = "frontend"
#   resource_group_name  = azurerm_resource_group.rg.name
#   virtual_network_name = azurerm_virtual_network.vn.name
#   address_prefixes     = ["10.0.3.0/24"]
# }  

# resource "azurerm_subnet_network_security_group_association" "assoc2" {
#   subnet_id                 = azurerm_subnet.notsobad.id
#   network_security_group_id = azurerm_network_security_group.nsg.id
# }
