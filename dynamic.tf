data "azurerm_resource_group" "tom-azr-lab" {
}

locals {
 inbound_ports  = [80, 443]
 outbound_ports = [443, 1433]
}

resource "aws_security_group" "list_example" {
 name        = "list-example"

 dynamic "ingress" {
   for_each = local.inbound_ports
   content {
     from_port   = ingress.value
     to_port     = ingress.value
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
   }
 }

 dynamic "egress" {
   for_each = local.outbound_ports
   content {
     from_port   = egress.value
     to_port     = egress.value
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
   }
 }
}

locals {
 nets  = [80, 443]
 outbound_ports = [443, 1433]
}

# Azure Subnet with CORRECT configuration (NSG assignment)
resource "azurerm_virtual_network" "dynamic_vnet" {
  name                = "dynamic_vnet"
  address_space       = ["10.2.0.0/16"]
  location            = azurerm_resource_group.infra_026.location
  resource_group_name = azurerm_resource_group.infra_026.name
  for_each = local.nets
  subnet {
    name           = "infra026pass02subnet1"
    address_prefix = "10.2.1.0/24"
    security_group = azurerm_network_security_group.infra_026.id
  }
  subnet {
    name           = "infra026pass02subnet2"
    address_prefix = "10.2.2.0/24"
    security_group = azurerm_network_security_group.infra_026.id
  }
}


# # NSG with CORRECT configuration
# resource "azurerm_network_security_group" "dynamic_nsg" {
#   name                = "dynamic_nsg"
#   location            = azurerm_resource_group.tom-azr-lab.location
#   resource_group_name = azurerm_resource_group.tom-azr-lab.name
#   security_rule {
#     name                       = "AllowIcmpIn"
#     priority                   = 100
#     direction                  = "Inbound"
#     access                     = "Deny"
#     protocol                   = "Icmp"
#     source_port_range          = "*"
#     destination_port_range     = "*"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }
#   security_rule {
#     name                       = "AllowIcmpOut"
#     priority                   = 100
#     direction                  = "Outbound"
#     access                     = "Allow"
#     protocol                   = "Icmp"
#     source_port_range          = "*"
#     destination_port_range     = "*"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }
# }