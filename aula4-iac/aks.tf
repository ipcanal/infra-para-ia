resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-${var.dupla}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aks-${var.dupla}"
  sku_tier            = "Free"

  default_node_pool {
    name       = "nodepool"
    node_count = var.node_count
    vm_size    = var.node_vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  tags = local.tags
}
