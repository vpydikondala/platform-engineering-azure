
output "cluster_name" {
  value = var.aks_module.aks_name
}

output "kube_config" {
  value = var.aks_module.kube_config
}

