resource "azurerm_resource_group" "rg" {
  name     = "example5"
  location = "West Europe"
  tags = {
    yor_trace = "93a4aa10-485d-4303-b097-18739e2b2e7a"
  }
}