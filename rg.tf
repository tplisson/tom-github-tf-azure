resource "azurerm_resource_group" "rg" {
  name     = "example5"
  location = "West Europe"
  tags = {
    yor_trace = "bb5fbf94-031b-4a82-8c42-b89ff576c88f"
  }
}