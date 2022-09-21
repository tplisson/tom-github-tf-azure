resource "azurerm_resource_group" "tom_aks" {
  name     = "tomAKS"
  location = "West Europe"
  tags = {
    yor_trace = "7032368a-81a0-4692-948b-5ae98444f223"
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
    yor_trace   = "b06a3c6f-1483-4331-9023-9ce33b0ae66d"
  }
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
    yor_trace   = "0b217506-1ce9-4585-9051-24c7e09fa202"
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
    azure_rbac_enabled = false
  }
  tags = {
    Environment = "Production"
    yor_trace   = "65fe472f-4ed4-40bf-af86-566632722a3b"
  }
}
