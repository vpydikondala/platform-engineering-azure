module "aks" {
  source          = "./modules/aks"
  resource_group  = var.resource_group
  location        = var.location
  aks_name        = var.aks_name
  dns_prefix      = var.dns_prefix
  k8s_version         = var.k8s_version
}

module "aad_groups" {
  source = "./modules/aad_groups"
    teams  = var.teams
}

module "keyvault" {
  source         = "./modules/k8s_platform/security"
  resource_group = var.resource_group
  location       = var.location
  db_password    = var.db_password
}

module "k8s_platform" {
  source     = "./modules/k8s_platform"
  cluster_name   = module.aks.aks_name
  aks_module = module.aks  # pass the AKS module as input
  kubeconfig = module.aks.kube_config[0]
  teams      = var.teams
    depends_on = [
    module.aks,        # ensures AKS exists first
    module.aad_groups  # ensures AD groups exist first
  ]
}
