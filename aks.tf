resource "azurerm_resource_group" "tom_aks" {
  name     = "tomAKS"
  location = "West Europe"
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
  }
}
