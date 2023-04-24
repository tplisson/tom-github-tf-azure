resource "azurerm_resource_group" "tom_aks" {
  name     = "tomAKS"
  location = "West Europe"
  tags = {
    yor_trace = "45df1956-b959-4f4d-aaf5-54142320b76f"
  }
}

resource "azurerm_kubernetes_cluster" "tom_aks_pass_01" {
  name                = "tomakspass01"
  location            = azurerm_resource_group.tom_aks.location
  resource_group_name = azurerm_resource_group.tom_aks.name
  dns_prefix          = "tomakspass01"
  default_node_pool {
    name       = "tomakspass01"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }
  identity {
    type = "SystemAssigned"
  }
  azure_active_directory_role_based_access_control {
    managed            = true
    azure_rbac_enabled = true
  }
  tags = {
    Environment = "Production"
    yor_trace   = "fc0fd44d-a153-4c41-a38b-a0d3759a41ea"
  }
  local_account_disabled = true
}

resource "azurerm_kubernetes_cluster" "tom_aks_fail_01" {
  name                = "tomaksfail01"
  location            = azurerm_resource_group.tom_aks.location
  resource_group_name = azurerm_resource_group.tom_aks.name
  dns_prefix          = "tomaksfail01"
  default_node_pool {
    name       = "tomaksfail01"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }
  identity {
    type = "SystemAssigned"
  }
  tags = {
    Environment = "Production"
    yor_trace   = "bae64cad-40e7-49f5-8a2a-94ed244a11be"
  }
  private_cluster_enabled = true
}

resource "azurerm_kubernetes_cluster" "tom_aks_fail_02" {
  name                = "tomaksfail02"
  location            = azurerm_resource_group.tom_aks.location
  resource_group_name = azurerm_resource_group.tom_aks.name
  dns_prefix          = "tomaksfail02"
  default_node_pool {
    name       = "tomaksfail02"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }
  identity {
    type = "SystemAssigned"
  }
  azure_active_directory_role_based_access_control {
    managed            = true
    azure_rbac_enabled = true
  }
  tags = {
    Environment = "Production"
    yor_trace   = "ddd0d1fc-33cf-4357-abbd-bc83dde2815c"
  }
}
