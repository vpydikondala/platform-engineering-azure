output "aks_name" {
  value = module.aks.aks_name
}
output "cluster_name" {
  value = module.aks.aks_name  # assuming you export this from aks module
}
output "kube_config" {
  value     = module.aks.kube_config.raw_kube_config
  sensitive = true
}

