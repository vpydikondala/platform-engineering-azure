terraform {
  required_version = ">= 1.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.64.0"
    }

    azuread = { 
      source  = "hashicorp/azuread"
      version = "~> 2.0" 
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.25.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.8"   # example latest v2 version
    }

    local = {
      source  = "hashicorp/local"
      version = "~> 2.1"
    }
  }
}

# Azure provider
provider "azurerm" { 
  features {} 
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  use_oidc        = true
}

# Kubernetes provider
# main.tf
provider "kubernetes" {
  host                   = module.aks.kube_config[0].host
  client_certificate     = base64decode(module.aks.kube_config[0].client_certificate)
  client_key             = base64decode(module.aks.kube_config[0].client_key)
  cluster_ca_certificate = base64decode(module.aks.kube_config[0].cluster_ca_certificate)

}






# AzureAD provider
provider "azuread" {}


