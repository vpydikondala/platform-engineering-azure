
output "cluster_name" {
  value = module.aks.aks_name
}

output "kube_config" {
  value = module.aks.kube_config
}


