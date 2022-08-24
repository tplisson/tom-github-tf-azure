resource "azurerm_resource_group" "rg" {
  name     = "example5"
  location = "West Europe"
  tags = {
    yor_trace = "8bf0aaa5-8986-4e0a-b2e2-c203e3f51607"
  }
}