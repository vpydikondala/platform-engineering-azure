terraform {
  required_version = ">= 1.5"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.25.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.8"
    }

    local = {
      source  = "hashicorp/local"
      version = "~> 2.1"
    }
  }
}
