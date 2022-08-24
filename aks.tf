resource "azurerm_resource_group" "tom_aks" {
  name     = "tomAKS"
  location = "West Europe"
  tags = {
    yor_trace = "6c6f5991-1539-4eb3-b814-783bc4168802"
  }
}

resource "azurerm_kubernetes_cluster" "tom_aks_pass_01" {
  name                = "tomAKSpass01"
  location            = azurerm_resource_group.tom_aks.location
  resource_group_name = azurerm_resource_group.tom_aks.name
  dns_prefix          = "tomAKSpass01"
  default_node_pool {
    name       = "nodepool1"
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
    yor_trace   = "438c473e-dbc2-4870-a1cd-660f1b5b8226"
  }
}

resource "azurerm_kubernetes_cluster" "tom_aks_fail_01" {
  name                = "tomAKSfail01"
  location            = azurerm_resource_group.tom_aks.location
  resource_group_name = azurerm_resource_group.tom_aks.name
  dns_prefix          = "tomAKSfail01"
  default_node_pool {
    name       = "nodepool2"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }
  identity {
    type = "SystemAssigned"
  }
  tags = {
    Environment = "Production"
    yor_trace   = "cf6e32cc-56bb-409d-b261-b15c2c455c53"
  }
}

resource "azurerm_kubernetes_cluster" "tom_aks_fail_02" {
  name                = "tomAKSfail02"
  location            = azurerm_resource_group.tom_aks.location
  resource_group_name = azurerm_resource_group.tom_aks.name
  dns_prefix          = "tomAKSfail02"
  default_node_pool {
    name       = "tomAKSnodepool3"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }
  identity {
    type = "SystemAssigned"
  }
  azure_active_directory_role_based_access_control {
    managed            = true
    azure_rbac_enabled = false
  }
  tags = {
    Environment = "Production"
    yor_trace   = "a2590fe0-7fa4-4f14-bb35-81b027465b00"
  }
}
