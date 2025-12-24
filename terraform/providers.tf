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
      version = "~> 2.8"
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

# AzureAD provider
provider "azuread" {}

# Kubernetes provider (uses kubeconfig file created by GitHub Actions)
provider "kubernetes" {
  alias       = "aks"
  config_path = "${path.root}/.kube/config"
}

# Helm provider (also uses kubeconfig)
provider "helm" {
  alias = "aks"
}

