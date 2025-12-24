#data "azurerm_client_config" "current" {}
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

# Key Vault module
module "keyvault" {
  source         = "./modules/k8s_platform/keyvault"
  resource_group = var.resource_group
  location       = var.location
  db_password    = var.db_password
}

resource "kubernetes_namespace_v1" "platform" {
  metadata {
    name = "platform-observability"
  }
}
# SecretProviderClass module
module "secret_provider_class" {
  source            = "./modules/k8s_platform/secretproviderclass"
  keyvault_name     = module.keyvault.keyvault_name
  tenant_id         = data.azurerm_client_config.current.tenant_id
  platform_namespace = "platform-observability"
  objects           = [
    {
      objectName = "grafana-admin-password"
      objectType = "secret"
    }
  ]
   # Ensure Terraform knows the dependency
 depends_on = [module.keyvault,module.k8s_platform,kubernetes_namespace_v1.platform]
}


module "k8s_platform" {
 source        = "./modules/k8s_platform"
   providers = {
    kubernetes = kubernetes.aks
  }
 cluster_name  = module.aks.aks_name
 kubeconfig    = module.aks.kube_config
  teams         = var.teams

  depends_on = [module.aks, module.aad_groups]
}

