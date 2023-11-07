resource "azurerm_resource_group" "tom_aks" {
  name     = "tomAKS"
  location = "West Europe"
  tags = {
    owner     = "tplisson"
    yor_trace = "8f484a74-dc12-486e-8cbe-3cae6b6336c5"
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
    owner       = "tplisson"
    yor_trace   = "1323de8d-53da-4d65-81cf-a99da2812388"
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
    owner       = "tplisson"
    yor_trace   = "5860a27d-c06b-4e32-bab1-022bbe17f299"
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
    owner       = "tplisson"
    yor_trace   = "1b43c58e-6264-4d6b-84ed-4dd764e0836a"
  }
}
