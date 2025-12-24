resource "local_file" "kubeconfig" {
  filename = "${path.module}/aks.kubeconfig"
  content  = yamlencode(module.aks.kube_config)
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.k8s_version

  default_node_pool {
    name       = "agentpool"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
  }
}
