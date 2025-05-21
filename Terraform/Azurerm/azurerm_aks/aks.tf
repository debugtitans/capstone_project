resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  node_resource_group = var.node_resource_group_name

  default_node_pool {
    name       = var.default_node_pool_name
    node_count = var.node_count
    vm_size    = var.vm_size

    vnet_subnet_id = var.vnet_subnet_id

  }

  identity {
    type = var.identity_type
  }

 
}

