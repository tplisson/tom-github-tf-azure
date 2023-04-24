# These Resource Groups are located in an approved location
resource "azurerm_resource_group" "infra2_011_pass_01" {
  name     = "infra011pass01"
  location = "Canada Central"
  tags = {
    yor_trace = "7e55cc17-198b-4213-84da-ca31b0f88f0c"
  }
}
resource "azurerm_resource_group" "infra2_011_pass_02" {
  name     = "infra011pass02"
  location = "East US 2"
  tags = {
    yor_trace = "81ca4c36-4fb4-4718-92f8-5eac59c4c14f"
  }
}
resource "azurerm_resource_group" "infra2_011_pass_03" {
  name     = "infra011pass03"
  location = "Japan West"
  tags = {
    yor_trace = "5c43e305-5bcc-4067-9a02-118bf7d6da24"
  }
}

resource "azurerm_resource_group" "infra2_011_pass_04" {
  name     = "infra011pass04"
  location = "canadacentral"
  tags = {
    yor_trace = "171e7f9f-e539-4fee-82a6-89b6f51722f6"
  }
}

resource "azurerm_resource_group" "infra2_011_pass_" {
  name     = "infra011pass01"
  location = "Canada Central"
  tags = {
    yor_trace = "8f5f894b-a5c9-4c8b-9e8f-8c560b206f45"
  }
}

# These Resource Groups are not located in an approved location
resource "azurerm_resource_group" "infra2_011_fail_01" {
  name     = "infra011fail01"
  location = "West Europe"
  tags = {
    yor_trace = "730bd142-0639-43ae-986a-ceb23e98c7a3"
  }
}
resource "azurerm_resource_group" "infra2_011_fail_02" {
  name     = "infra011fail02"
  location = "East US"
  tags = {
    yor_trace = "86ae6b57-7036-44e7-9345-3ae1dc5f71da"
  }
}
resource "azurerm_resource_group" "infra2_011_fail_03" {
  name     = "infra011fail03"
  location = "South Central US"
  tags = {
    yor_trace = "dd435b14-d44a-4116-9c2b-8d81c0e53527"
  }
}

resource "azurerm_resource_group" "infra2_011_fail_04" {
  name     = "infra011fail04"
  location = var.location
  tags = {
    yor_trace = "dd658f01-b2d0-4601-bc66-ce2b08c82984"
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
    yor_trace   = "8e9f940b-aa13-445d-a767-56ab27b811d8"
  }
}
