# These Resource Groups are located in an approved location
resource "azurerm_resource_group" "infra2_011_pass_01" {
  name     = "infra011pass01"
  location = "Canada Central"
  tags = {
    owner     = "tplisson"
    yor_trace = "ecb8d261-62a4-4df6-a1a0-9f89343ef14e"
  }
}
resource "azurerm_resource_group" "infra2_011_pass_02" {
  name     = "infra011pass02"
  location = "East US 2"
  tags = {
    owner     = "tplisson"
    yor_trace = "378e46fe-0643-4172-947f-7636206afd0e"
  }
}
resource "azurerm_resource_group" "infra2_011_pass_03" {
  name     = "infra011pass03"
  location = "Japan West"
  tags = {
    owner     = "tplisson"
    yor_trace = "67cfeab5-8812-42f3-b25f-bcc214f32262"
  }
}

resource "azurerm_resource_group" "infra2_011_pass_04" {
  name     = "infra011pass04"
  location = "canadacentral"
  tags = {
    owner     = "tplisson"
    yor_trace = "6b5fd414-8ad7-42ac-b1f2-52bba97080fd"
  }
}

resource "azurerm_resource_group" "infra2_011_pass_" {
  name     = "infra011pass01"
  location = "Canada Central"
  tags = {
    owner     = "tplisson"
    yor_trace = "d1a1dca0-bcee-47b1-8e73-53a1d70e5543"
  }
}

# These Resource Groups are not located in an approved location
resource "azurerm_resource_group" "infra2_011_fail_01" {
  name     = "infra011fail01"
  location = "West Europe"
  tags = {
    owner     = "tplisson"
    yor_trace = "08fc2e24-c5d6-41a0-abbd-ae87ed3dd5a4"
  }
}
resource "azurerm_resource_group" "infra2_011_fail_02" {
  name     = "infra011fail02"
  location = "East US"
  tags = {
    owner     = "tplisson"
    yor_trace = "366f9006-173d-4a0e-b14c-7bd652132613"
  }
}
resource "azurerm_resource_group" "infra2_011_fail_03" {
  name     = "infra011fail03"
  location = "South Central US"
  tags = {
    owner     = "tplisson"
    yor_trace = "8bee3eb7-2098-4da7-9b1f-054f8322be3a"
  }
}

resource "azurerm_resource_group" "infra2_011_fail_04" {
  name     = "infra011fail04"
  location = var.location
  tags = {
    owner     = "tplisson"
    yor_trace = "b424bd4c-e86c-4498-8e0c-640be082c6be"
  }
}

resource "azurerm_virtual_network" "infra2_011_fail_05" {
  name                = "infra011fail05"
  location            = "West Europe"
  resource_group_name = azurerm_resource_group.infra2_011_pass_01.name
  address_space       = ["10.2.0.0/16"]
  dns_servers         = ["10.2.0.4", "10.2.0.5"]
  tags = {
    environment = "PSO_LAB"
    owner       = "tplisson"
    yor_trace   = "d7816833-79c5-4ca6-a441-90177ceedb53"
  }
}
