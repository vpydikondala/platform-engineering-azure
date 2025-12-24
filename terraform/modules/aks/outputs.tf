output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config
  sensitive = true
}

output "host" {
  value = azurerm_kubernetes_cluster.aks.kube_config[0].host
}


output "aks_name" {
  value = azurerm_kubernetes_cluster.aks.name
}
