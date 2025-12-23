module "aks" {
  source          = "./modules/aks"
  resource_group  = var.resource_group
  location        = var.location
  aks_name        = var.aks_name
}

module "aad_groups" {
  source = "./modules/aad_groups"
}

module "keyvault" {
  source         = "./modules/k8s_platform/security"
  resource_group = var.resource_group
  location       = var.location
  db_password    = var.db_password
}

module "k8s_platform" {
  source     = "./modules/k8s_platform"
  kubeconfig = module.aks.kube_config[0]
  teams      = var.teams
}
