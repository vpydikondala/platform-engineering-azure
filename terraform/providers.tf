terraform {
  required_version = ">= 1.5"

  required_providers {
    azurerm = {
    source  = "hashicorp/azurerm"
    version = ">= 3.64.0"
    }

    azuread = { 
     source = "hashicorp/azuread"
     version = "~> 2.0" 
     }
    kubernetes = { 
        source = "hashicorp/kubernetes"
        version = "~> 2.0" 
        }
  }
}

provider "azurerm" { 
    features {} 
      # Required for OIDC auth
    tenant_id       = var.tenant_id
    subscription_id = var.subscription_id

  # Enables GitHub OIDC authentication
  use_oidc = true
    }
provider "azuread" {}
