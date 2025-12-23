resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "platform"

  default_node_pool {
    name       = "system"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
  }

  identity { type = "SystemAssigned" }

  azure_active_directory_role_based_access_control {
    managed = true
    admin_group_object_ids = [
      azuread_group.platform_admins.object_id
    ]
  }
}
