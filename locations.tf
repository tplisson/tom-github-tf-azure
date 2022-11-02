# These Resource Groups are located in an approved location
resource "azurerm_resource_group" "infra2_011_pass_01" {
  name     = "infra011pass01"
  location = "Canada Central"
}
resource "azurerm_resource_group" "infra2_011_pass_02" {
  name     = "infra011pass02"
  location = "East US 2"
}
resource "azurerm_resource_group" "infra2_011_pass_03" {
  name     = "infra011pass03"
  location = "Japan West"
}

resource "azurerm_resource_group" "infra2_011_pass_04" {
  name     = "infra011pass04"
  location = "canadacentral"
}

resource "azurerm_resource_group" "infra2_011_pass_" {
  name     = "infra011pass01"
  location = "Canada Central"
}

# These Resource Groups are not located in an approved location
resource "azurerm_resource_group" "infra2_011_fail_01" {
  name     = "infra011fail01"
  location = "West Europe"
}
resource "azurerm_resource_group" "infra2_011_fail_02" {
  name     = "infra011fail02"
  location = "East US"
}
resource "azurerm_resource_group" "infra2_011_fail_03" {
  name     = "infra011fail03"
  location = "South Central US"
}

resource "azurerm_resource_group" "infra2_011_fail_04" {
  name     = "infra011fail04"
  location = var.location
}

resource "azurerm_virtual_network" "infra2_011_fail_05" {
  name                = "infra011fail05"
  location            = "West Europe"
  resource_group_name = azurerm_resource_group.infra2_011_pass_01.name
  address_space       = ["10.2.0.0/16"]
  dns_servers         = ["10.2.0.4", "10.2.0.5"]
  tags = {
    environment = "PSO_LAB"
  }
}
