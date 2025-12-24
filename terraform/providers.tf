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
      version = "~> 2.0" 
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.8"   # example latest v2 version
    }
  }
}

# Azure provider
provider "azurerm" { 
  features {} 
}

# Kubernetes provider (AKS)
provider "kubernetes" {
  host                   = module.aks.kube_config[0].host
  client_certificate     = base64decode(module.aks.kube_config[0].client_certificate)
  client_key             = base64decode(module.aks.kube_config[0].client_key)
  cluster_ca_certificate = base64decode(module.aks.kube_config[0].cluster_ca_certificate)
}

# AzureAD provider
provider "azuread" {}

# Helm provider
# No credentials are passed here — it will use the Kubernetes provider in helm_release
provider "helm" {}
