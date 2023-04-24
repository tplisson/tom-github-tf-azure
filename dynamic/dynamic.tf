data "azurerm_resource_group" "tom-azr-lab" {
  name = "tom-azr-lab"
}

resource "azurerm_network_security_group" "dynamic_nsg_fail" {
  name                = var.nsg_name_fail
  location            = data.azurerm_resource_group.tom-azr-lab.location
  resource_group_name = data.azurerm_resource_group.tom-azr-lab.name

  dynamic "security_rule" {
    for_each = var.fail_nsg_rules
    content {
      name                       = security_rule.value["name"]
      priority                   = security_rule.value["priority"]
      direction                  = security_rule.value["direction"]
      access                     = security_rule.value["access"]
      protocol                   = security_rule.value["protocol"]
      source_port_range          = security_rule.value["source_port_range"]
      destination_port_range     = security_rule.value["destination_port_range"]
      source_address_prefix      = security_rule.value["source_address_prefix"]
      destination_address_prefix = security_rule.value["destination_address_prefix"]
    }
  }
  tags = {
    yor_trace = "1d99c401-9a86-42cc-a833-127fc368e3d9"
  }
}

resource "azurerm_network_security_group" "dynamic_nsg_pass" {
  name                = var.nsg_name_pass
  location            = data.azurerm_resource_group.tom-azr-lab.location
  resource_group_name = data.azurerm_resource_group.tom-azr-lab.name

  dynamic "security_rule" {
    for_each = var.pass_nsg_rules
    content {
      name                       = security_rule.value["name"]
      priority                   = security_rule.value["priority"]
      direction                  = security_rule.value["direction"]
      access                     = security_rule.value["access"]
      protocol                   = security_rule.value["protocol"]
      source_port_range          = security_rule.value["source_port_range"]
      destination_port_range     = security_rule.value["destination_port_range"]
      source_address_prefix      = security_rule.value["source_address_prefix"]
      destination_address_prefix = security_rule.value["destination_address_prefix"]
    }
  }
  tags = {
    yor_trace = "2ddee7a4-9df3-496a-9d43-0c9127863aeb"
  }
}




# resource "azurerm_virtual_network" "dynamic_vnet" {
#   name                = var.vnet_name
#   address_space       = var.address_space
#   location            = data.azurerm_resource_group.tom-azr-lab.location
#   resource_group_name = data.azurerm_resource_group.tom-azr-lab.name

#   dynamic "subnet" {
#     for_each = var.subnet_list
#     content {
#       name           = subnet.value["name"]
#       address_prefix = subnet.value["address_prefix"]
#       security_group = subnet.value["security_group"]
#     }
#   }
# }

# resource "azurerm_virtual_network" "example" {
#   name                = "example-network"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
#   address_space       = ["10.0.0.0/16"]
#   dns_servers         = ["10.0.0.4", "10.0.0.5"]
#   subnet {
#     name           = "subnet1"
#     address_prefix = "10.0.1.0/24"
#   }
#   subnet {
#     name           = "subnet2"
#     address_prefix = "10.0.2.0/24"
#     security_group = azurerm_network_security_group.example.id
#   }
# }

# locals {
#  inbound_ports  = [80, 443]
#  outbound_ports = [443, 1433]
# }

# resource "aws_security_group" "list_example" {
#  name        = "list-example"

#  dynamic "ingress" {
#    for_each = local.inbound_ports
#    content {
#      from_port   = ingress.value
#      to_port     = ingress.value
#      protocol    = "tcp"
#      cidr_blocks = ["0.0.0.0/0"]
#    }
#  }

#  dynamic "egress" {
#    for_each = local.outbound_ports
#    content {
#      from_port   = egress.value
#      to_port     = egress.value
#      protocol    = "tcp"
#      cidr_blocks = ["0.0.0.0/0"]
#    }
#  }
# }
